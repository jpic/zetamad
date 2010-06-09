<?php

function setRoutesApplication( $configuration ) {
    foreach( $configuration['routes'] as $name => $route ) {
        $applicationName = substr( $name, 0, strrpos( $name, '.' ) );
        $configuration['routes'][$name]['application'] = $applicationName;

        if ( !isset( $configuration['applications'][$applicationName] ) ) {
            continue;
        }

        $configuration['routes'][$name]->merge( $configuration['applications'][$applicationName] );
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setRoutesApplication' );

function defaultController( $configuration ) {
    foreach( $configuration['routes'] as $name => $route ) {
        if ( !isset( $configuration['routes'][$name]['controller'] ) ) {
            $configuration['routes'][$name]['controller'] = $configuration['applications']['mad']['defaultController'];
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'defaultController' );

function defaultView( $configuration ) {
    foreach( $configuration['routes'] as $name => $route ) {
        if ( !isset( $configuration['routes'][$name]['view'] ) ) {
            $configuration['routes'][$name]['view'] = $configuration['applications']['mad']['defaultView'];
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'defaultView' );

function defaultRails( $configuration ) {
    foreach( $configuration['routes'] as $routeName => &$route ) {
        if ( empty( $route['rails'] ) && empty( $route['regexp'] ) ) {
            $route['rails'] = "/{$route['action']}";
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'defaultRails' );

function defaultTemplate( $configuration ) {
    foreach( $configuration['routes'] as $routeName => &$route ) {
        if ( empty( $route['template'] ) ) {
            $route['template'] = $routeName . '.php';
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'defaultTemplate' );

function prefixRoutes( $configuration ) {
    foreach( $configuration['routes'] as $name => &$route ) {
        $applicationName   = substr( $name, 0, strrpos( $name, '.' ) );

        if ( !isset( $configuration['applications'][$applicationName] ) ) {
            continue;
        }

        if ( isset( $route['rails'] ) && substr( $route['rails'], 0, 1 ) != '/' ) {
            $route['rails'] = '/' . $route['rails'];
        }
        
        $applicationPrefix = $configuration['applications'][$applicationName]['routePrefix'];
        if ( isset( $route['rails'] ) ) {
            $configuration['routes'][$name]['rails'] = $applicationPrefix . $configuration['routes'][$name]['rails'];
        } elseif ( isset( $route['regexp'] ) ) {
            if ( substr( $route['regexp'], 0, 1 ) == '^' ) {
                $route['regexp'] = substr( $route['regexp'], 1 );
            }
            $configuration['routes'][$name]['regexp'] = '@^' . $applicationPrefix . $route['regexp'] . '@';
        }

        $configuration['routes'][$name]['name'] = $name;
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'prefixRoutes' );

function findClasses( $configuration ) {
    if ( defined( 'RecursiveDirectoryIterator::FOLLOW_SYMLINKS' ) ) {
        $flags = RecursiveDirectoryIterator::FOLLOW_SYMLINKS|RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
    } else { // php 5.2.6 support
        $flags = RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
    }

    foreach( $configuration['applications'] as $name => $application ) {
        $path = $configuration->getPathSetting( 'applications', $name, 'path' );

        if ( !isset( $configuration['applications'][$name]['classes'] ) ) {
            $configuration['applications'][$name]['classes'] = array(  );
        }

        $fileIterator = new RecursiveIteratorIterator( 
            new RecursiveDirectoryIterator( 
                $path,
                $flags
            )
        );
        
        foreach( $fileIterator as $fileInfo ) {
            if ( substr( $fileInfo->getFilename(  ), -4) != '.php' ) {
                continue;
            }

            // skip tests
            $relativePath = madFramework::getRelativePath( 
                $fileInfo->getPath(  ) . '/' . $fileInfo->getBasename(  ) , 
                ENTRY_APP_PATH
            );

            if ( strpos( $relativePath, 'tests' ) !== false ) {
                continue;
            }

            $fileObject = $fileInfo->openFile(  );

            if ( !$fileObject->isReadable(  ) ) {
                trigger_error( "$fileInfo is not readable", E_USER_ERROR );
            }

            while( !$fileObject->eof() ) {
                $line = $fileObject->fgets(  );

                // this pattern does not work FFS
                // $pattern = '/^(class)|(abstract class)|(interface) ([a-zA-Z0-9_]+)/';

                $pattern = '/^class (?P<className>[a-zA-Z0-9_]+)/';
                if ( preg_match( $pattern, $line, $matches ) ) {
                    $configuration['applications'][$name]['classes'][] = $matches['className'];
                }

                $pattern = '/^abstract class (?P<className>[a-zA-Z0-9_]+)/';
                if ( preg_match( $pattern, $line, $matches ) ) {
                    $configuration['applications'][$name]['classes'][] = $matches['className'];
                }

                $pattern = '/^interface (?P<className>[a-zA-Z0-9_]+)/';
                if ( preg_match( $pattern, $line, $matches ) ) {
                    $configuration['applications'][$name]['classes'][] = $matches['className'];
                }
            }
        }
    }
}
//$this->connectSignal( 'postConfigurationRefresh', 'findClasses' );

function stripTrailingSlashes( $configuration ) {
    function doStripTrailingSlashes( &$array ) {
        foreach( $array as $name => $value ) {
            if ( is_array( $value ) || $value instanceof Traversable ) {
                doStripTrailingSlashes( $value );
            } else {
                $value = substr( $value, -1 ) == '/' ? substr( $value, 0, -1 ) : $value;
            }
        }
    }

    doStripTrailingSlashes( $configuration );
}
$this->connectSignal( 'postConfigurationRefresh', 'stripTrailingSlashes' );

function findStaticFiles( $configuration ) {
    if ( !isset( $configuration['staticFiles'] ) ) {
        $configuration['staticFiles'] = new madObject;
    }
    if ( !isset( $configuration['staticFiles']['paths'] ) ) {
        $configuration['staticFiles']['paths'] = new madObject;
    }

    if ( defined( 'RecursiveDirectoryIterator::FOLLOW_SYMLINKS' ) ) {
        $flags = RecursiveDirectoryIterator::FOLLOW_SYMLINKS|RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
    } else { // php 5.2.6 support
        $flags = RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
    }


    foreach( $configuration['applications'] as $name => $application ) {
        $path       = $configuration->getPathSetting( 'applications', $name, 'path' );
        $staticPath = madFramework::fixPath( realpath( $path . '/static' ) );
        
        if ( is_dir( $staticPath ) ) {
            $fileIterator = new RecursiveIteratorIterator( 
                new RecursiveDirectoryIterator( 
                    $staticPath,
                    $flags
                )
            );

            foreach( $fileIterator as $fileInfo ) {
                $absolutePath = madFramework::fixPath( $fileInfo->getRealPath(  ) );
                
                // skip .svn subdirs
                if ( strpos( $absolutePath, '.svn' ) !== false ) {
                    continue;
                }
                
                $relativePath = substr( $absolutePath, strlen( $staticPath ) );

                $configuration['staticFiles']['paths'][$relativePath] = ezcBaseFile::calculateRelativePath(
                    $absolutePath,
                    ENTRY_APP_PATH
                );
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'findStaticFiles' );

function allPathsRelative( $configuration ) {
    foreach( $configuration as $key => $value ) {
        if ( is_array( $value ) || $value instanceof madObject ) {
            allPathsRelative( $value );
        } else {
            if ( strlen( $value ) && $value[0] == '/' && file_exists( $value ) ) {
                $value = madFramework::getRelativePath( $value, ENTRY_APP_PATH );
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'allPathsRelative' );

function setDefaultWidgets( $configuration ) {
    $noWidget = array(
        'value',
        'autoNow',
        'autoMe',
        'autoNowAdd',
        'slugify',
    );

    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }
            
            foreach( $noWidget as $key ) {
                if ( isset( $field[$key] ) ) {
                    if ( !empty( $field['widget'] ) ) {
                        unset( $configuration['forms'][$formName][$fieldName]['widget'] );
                    }
                    continue 2;
                }
            }

            if ( empty( $field['widget'] ) ) {
                $configuration['forms'][$formName][$fieldName]['widget'] = 'text';

                if ( !empty( $field['relation'] ) ) {
                    if ( $field['relation'] == 'manyToMany' ) {
                        $configuration['forms'][$formName][$fieldName]['widget'] = 'select';
                        $configuration['forms'][$formName][$fieldName]['multiple'] = true;
                    } elseif ( $field['relation'] == 'fk' ) {
                        $configuration['forms'][$formName][$fieldName]['widget'] = 'select';
                        $configuration['forms'][$formName][$fieldName]['multiple'] = false;
                    }
                }
            } elseif ( $field['widget'] == 'select' && !isset( $attribute['multiple'] ) ) {
                $attribute['multiple'] = false;
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultWidgets' );

function setDefaultFieldNames( $configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( !isset( $field['name'] ) ) {
                $configuration['forms'][$formName][$fieldName]['name'] = $fieldName;
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultFieldNames' );

function setFormAttributesViewDefaultParameters( $configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            $field['asFormSet'] = false;
            $field['asMultiValue'] = false;

            if ( !isset( $field['relation'] ) ) {
                continue;
            }

            if ( $field['relation'] != 'reverseFk' ) {
                continue;
            }

            if ( isset( $field['formName'] ) ) {
                $field['asFormSet'] = true;
            } else {
                $field['asMultiValue'] = true;
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setFormAttributesViewDefaultParameters' );

function setDefaultFieldErrors( $configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( !isset( $field['errors'] ) ) {
                $configuration['forms'][$formName][$fieldName]['errors'] = array(  );
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultFieldErrors' );

function setDefaultFieldRequired( $configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( !isset( $field['required'] ) ) {
                $configuration['forms'][$formName][$fieldName]['required'] = false;
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultFieldRequired' );

function setDefaultFieldDisplayValue( $configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( !isset( $field['displayValue'] ) ) {
                $configuration['forms'][$formName][$fieldName]['displayValue'] = '';
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultFieldDisplayValue' );

function setDefaultFieldClasses( $configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( empty( $field['classes'] ) ) {
                $field['classes'] = array(  );
            }

            if ( empty( $field['widget'] ) ) {
                continue;
            }

            switch( $field['widget'] ) {
                case 'text':
                    $field['classes'][] = 'textInput';
                    break;
                case 'file':
                    $field['classes'][] = 'fileInput';
                    break;
            }

            if ( !empty( $field['required'] ) ) {
                $field['classes'][] = 'required';
            }

            if ( !empty($field['minLength']) ) {
                $field['classes'][] = 'validate_minlength ' . $field['minLength'];
            }

            if ( !empty($field['maxLength']) ) {
                $field['classes'][] = 'validate_maxlength ' . $field['maxLength'];
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultFieldClasses' );

function setDefaultFkNames( $configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( !isset( $field['relation'] ) ) {
                continue;
            }

            if ( isset( $field['fkName'] ) ) {
                continue;
            }

            switch( $field['relation'] ) {
                case 'fk':
                    $field['fkName'] = $fieldName;
                    continue;
                case 'reverseFk':
                    $field['fkName'] = $form['namespace']['value'];
                    continue;
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultFkNames' );

function setDefaultColumn( $configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( !empty( $field['column'] ) ) {
                continue;
            }

            $configuration['forms'][$formName][$fieldName]['column'] = $fieldName;
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultColumn' );

function setDefaultValueAttributes( $configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( empty( $field['valueAttribute'] ) ) {
                $field['valueAttribute'] = 'id';
            }
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultValueAttributes' );

function setDefaultManyToManyTableNames( $configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
            if ( $fieldName == 'META' ) {
                continue;
            }

            if ( empty( $field['relation'] ) ) {
                continue;
            }

            if ( $field['relation'] != 'manyToMany') {
                continue;
            }

            if ( empty( $field['leftRelationAttribute'] ) ) {
                $field['leftRelationAttribute'] = $form['namespace']['value'];
            }

            if ( empty( $field['rightRelationAttribute'] ) ) {
                preg_match( '/from `?([^`\s]+)`?/i', $field['query'], $m);
                $field['rightRelationAttribute'] = $m[1];
            }

            if ( empty( $field['relationNamespace'] ) ) {
                $field['relationNamespace'] = sprintf(
                    '%s_%s',
                    $field['leftRelationAttribute'],
                    $field['rightRelationAttribute']
                );
            }

            // @todo: set reverse field
        }
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'setDefaultManyToManyTableNames' );

function copyTemplates( $configuration ) {
    $templatesPath = ENTRY_APP_PATH . '/cache/templates';
    if ( is_dir( $templatesPath ) ) {
        ezcBaseFile::removeRecursive( $templatesPath );
    }

    $applications = array_reverse( array_keys( (array) $configuration['applications'] ) );

    foreach( $applications as $application ) {
        $path = $configuration->getPathSetting( 'applications', $application, 'path' ) . '/templates';
        madFramework::copyRecursive( $path, $templatesPath );
    }
}
$this->connectSignal( 'postConfigurationRefresh', 'copyTemplates' );

function shortTemplateTags( $configuration ) {
    if ( defined( 'RecursiveDirectoryIterator::FOLLOW_SYMLINKS' ) ) {
        $flags = RecursiveDirectoryIterator::FOLLOW_SYMLINKS|RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
    } else { // php 5.2.6 support
        $flags = RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
    }

    $path = ENTRY_APP_PATH . '/cache/templates';

    $fileIterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator(
            $path,
            $flags
        )
    );

    foreach( $fileIterator as $fileInfo ) {
        $template = file_get_contents( $fileInfo->getRealPath(  ) );
        $template = preg_replace( '/<?=( .*)?>/', '<?php $this->e( \1 ) ?>', $template );
        $template = preg_replace( '/<??( .*)?>/', '<?php $this->\1 ?>', $template );
        file_put_contents( $fileInfo->getRealPath(  ), $template );
    }
}
//$this->connectSignal( 'shortTemplateTags', 'postConfigurationRefresh' );

?>
