<?php
$registry = madFramework::instance(  );

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
$registry->signals->connect( 'postConfigurationRefresh', 'setRoutesApplication' );

function defaultController( $configuration ) {
    foreach( $configuration['routes'] as $name => $route ) {
        if ( !isset( $configuration['routes'][$name]['controller'] ) ) {
            $configuration['routes'][$name]['controller'] = $configuration['applications']['mad']['defaultController'];
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'defaultController' );

function defaultView( $configuration ) {
    foreach( $configuration['routes'] as $name => $route ) {
        if ( !isset( $configuration['routes'][$name]['view'] ) ) {
            $configuration['routes'][$name]['view'] = $configuration['applications']['mad']['defaultView'];
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'defaultView' );

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
$registry->signals->connect( 'postConfigurationRefresh', 'prefixRoutes' );

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
$registry->signals->connect( 'postConfigurationRefresh', 'findClasses' );

function stripTrailingSlashes( &$array ) {
    foreach( $array as $name => $value ) {
        if ( is_array( $value ) || $value instanceof Traversable ) {
            stripTrailingSlashes( $value );
        } else {
            $value = substr( $value, -1 ) == '/' ? substr( $value, 0, -1 ) : $value;
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'stripTrailingSlashes' );

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
                $relativePath = substr( $absolutePath, strlen( $staticPath ) );

                $configuration['staticFiles']['paths'][$relativePath] = 
                    madFramework::getRelativePath( $absolutePath, ENTRY_APP_PATH );
            }
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'findStaticFiles' );

function allPathsRelative( &$configuration ) {
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
$registry->signals->connect( 'postConfigurationRefresh', 'allPathsRelative' );

function setDefaultWidgets( &$configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( isset( $field['value'] ) ) {
                continue;
            }

            if ( isset( $field['autoNow'] ) ) {
                continue;
            }

            if ( isset( $field['slugify'] ) ) {
                continue;
            }

            if ( !isset( $field['widget'] ) ) {
                if ( isset( $field['relation'] ) && $field['relation'] == 'manyToMany' ) {
                    $configuration['forms'][$formName][$fieldName]['widget'] = 'select';
                    $configuration['forms'][$formName][$fieldName]['multiple'] = true;
                } else {
                    $configuration['forms'][$formName][$fieldName]['widget'] = 'text';
                }
            } elseif ( $field['widget'] == 'select' && !isset( $attribute['multiple'] ) ) {
                $attribute['multiple'] = false;
            }
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultWidgets' );

function setDefaultFieldNames( &$configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( !isset( $field['name'] ) ) {
                $configuration['forms'][$formName][$fieldName]['name'] = $fieldName;
            }
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultFieldNames' );

function setFormAttributesViewDefaultParameters( &$configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
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
$registry->signals->connect( 'postConfigurationRefresh', 'setFormAttributesViewDefaultParameters' );

function setDefaultFieldErrors( &$configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( !isset( $field['errors'] ) ) {
                $configuration['forms'][$formName][$fieldName]['errors'] = array(  );
            }
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultFieldErrors' );

function setDefaultFieldRequired( &$configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( !isset( $field['required'] ) ) {
                $configuration['forms'][$formName][$fieldName]['required'] = false;
            }
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultFieldRequired' );

function setDefaultFieldDisplayValue( &$configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( !isset( $field['displayValue'] ) ) {
                $configuration['forms'][$formName][$fieldName]['displayValue'] = '';
            }
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultFieldDisplayValue' );

function setDefaultFieldClasses( &$configuration ) {
    foreach( $configuration['forms'] as $formName => $form ) {
        foreach( $form as $fieldName => $field ) {
            if ( !isset( $field['classes'] ) ) {
                $configuration['forms'][$formName][$fieldName]['classes'] = array(  );
            }

            if ( !isset( $configuration['forms'][$formName][$fieldName]['widget'] ) ) {
                continue;
            }

            switch( $configuration['forms'][$formName][$fieldName]['widget'] ) {
                case 'text':
                    $configuration['forms'][$formName][$fieldName]['classes'][] = 'textInput';
                    break;
            }
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultFieldClasses' );

function setDefaultFkNames( &$configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
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
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultFkNames' );

function setDefaultColumn( &$configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
            if ( !empty( $field['column'] ) ) {
                continue;
            }

            $configuration['forms'][$formName][$fieldName]['column'] = $fieldName;
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultColumn' );

function setDefaultValueAttributes( &$configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
            if ( !isset( $field['displayAttribute'] ) ) {
                continue;
            }

            if ( isset( $field['valueAttribute'] ) ) {
                continue;
            }

            $field['valueAttribute'] = 'id';
        }
    }
}
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultValueAttributes' );

function setDefaultManyToManyTableNames( &$configuration ) {
    foreach( $configuration['forms'] as $formName => &$form ) {
        foreach( $form as $fieldName => &$field ) {
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
$registry->signals->connect( 'postConfigurationRefresh', 'setDefaultManyToManyTableNames' );

?>
