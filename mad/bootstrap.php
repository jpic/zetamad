<?php
$registry = madRegistry::instance(  );

function autoCreateMadModelTable( $bootstrap ) {
    if ( !$bootstrap->configuration['mad']['refreshModel'] ) {
        return true;
    }
    
    $registry = madRegistry::instance(  );

    $statement = $registry->database->prepare( 'show tables' );
    $statement->setFetchMode( PDO::FETCH_NUM );
    $statement->execute();
    $tables = $statement->fetchAll(  );

    if ( in_array( 'mad_model', $tables ) ) {
        return true;
    }

    $registry->database->query( '
    CREATE TABLE `mad_model` (
      `id_attribute` int(15) DEFAULT NULL,
      `id` varchar(44) DEFAULT NULL,
      `attribute_key` varchar(50) NOT NULL,
      `attribute_value` text
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8
    ' );
}
$registry->signals->connect( 'preSetupModel', 'autoCreateMadModelTable' );

function configurationInheritance( $configuration ) {
    foreach( $configuration as $groupName => $group ) {
        $unst = false;

        foreach( $group as $sectionName => $section ) {
            if ( strpos( $sectionName, '..' ) === false ) {
                continue;
            }

            $sectionNameParts = explode( '..', $sectionName );
            $realSectionName = array_shift( $sectionNameParts );

            foreach( $sectionNameParts as $part ) {

                if ( !isset( $configuration[$groupName][$realSectionName] ) ) {
                    $configuration[$groupName][$realSectionName] = $configuration[$groupName][$sectionName];
                }

                $configuration[$groupName][$realSectionName]->merge( 
                    $configuration[$groupName][$part]
                );

            }

            $unst = true;
        }
        
        if ( $unst ) {
            unset( $configuration[$groupName][$sectionName] );
        }
    }
}
$registry->signals->connect( 'configurationRefreshed', 'configurationInheritance' );

function setRegistryRouter( $router ) {
    madRegistry::instance(  )->router = $router;
}
$registry->signals->connect( 'routerCreated', 'setRegistryRouter' );

function stripTrailingSlashes( &$array ) {
    foreach( $array as $name => $value ) {
        if ( is_array( $value ) || $value instanceof Traversable ) {
            stripTrailingSlashes( $value );
        } else {
            $value = substr( $value, -1 ) == '/' ? substr( $value, 0, -1 ) : $value;
        }
    }
}
$registry->signals->connect( 'configurationRefreshed', 'stripTrailingSlashes' );

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
$registry->signals->connect( 'configurationRefreshed', 'setRoutesApplication' );

function defaultController( $configuration ) {
    foreach( $configuration['routes'] as $name => $route ) {
        if ( !isset( $configuration['routes'][$name]['controller'] ) ) {
            $configuration['routes'][$name]['controller'] = $configuration['applications']['mad']['defaultController'];
        }
    }
}
$registry->signals->connect( 'configurationRefreshed', 'defaultController' );

function defaultView( $configuration ) {
    foreach( $configuration['routes'] as $name => $route ) {
        if ( !isset( $configuration['routes'][$name]['view'] ) ) {
            $configuration['routes'][$name]['view'] = $configuration['applications']['mad']['defaultView'];
        }
    }
}
$registry->signals->connect( 'configurationRefreshed', 'defaultView' );

function prefixRoutes( $configuration ) {
    foreach( $configuration['routes'] as $name => $route ) {
        $applicationName   = substr( $name, 0, strrpos( $name, '.' ) );

        if ( !isset( $configuration['applications'][$applicationName] ) ) {
            continue;
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
$registry->signals->connect( 'configurationRefreshed', 'prefixRoutes' );

function findClasses( $configuration ) {
    foreach( $configuration['applications'] as $name => $application ) {
        $path = $configuration->getPathSetting( 'applications', $name, 'path' );

        if ( !isset( $configuration['applications'][$name]['classes'] ) ) {
            $configuration['applications'][$name]['classes'] = new madObject;
        }

        $classes = array(  );
        $fileIterator = new RecursiveIteratorIterator( 
            new RecursiveDirectoryIterator( 
                $path,
                RecursiveDirectoryIterator::FOLLOW_SYMLINKS|RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST
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
$registry->signals->connect( 'configurationRefreshed', 'findClasses' );

function findStaticFiles( $configuration ) {
    if ( !isset( $configuration['staticFiles'] ) ) {
        $configuration['staticFiles'] = new madObject;
    }
    if ( !isset( $configuration['staticFiles']['paths'] ) ) {
        $configuration['staticFiles']['paths'] = new madObject;
    }

    foreach( $configuration['applications'] as $name => $application ) {
        $path       = $configuration->getPathSetting( 'applications', $name, 'path' );
        $staticPath = $path . '/static';
        
        if ( is_dir( $staticPath ) ) {
            $fileIterator = new RecursiveIteratorIterator( 
                new RecursiveDirectoryIterator( 
                    $staticPath,
                    RecursiveDirectoryIterator::FOLLOW_SYMLINKS|RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST
                )
            );

            foreach( $fileIterator as $fileInfo ) {
                $absolutePath = $fileInfo->getRealPath(  );
                $relativePath = substr( $absolutePath, strlen( $staticPath ) );

                $configuration['staticFiles']['paths'][$relativePath] = 
                    madFramework::getRelativePath( $absolutePath, ENTRY_APP_PATH );
            }
        }
    }
}
$registry->signals->connect( 'configurationRefreshed', 'findStaticFiles' );

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
$registry->signals->connect( 'configurationRefreshed', 'allPathsRelative' );
?>
