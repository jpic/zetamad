<?php
$registry = madRegistry::instance(  );

function configurationInheritance( $configuration ) {
    foreach( $configuration as $groupName => $group ) {
        $unst = false;

        foreach( $group as $sectionName => $section ) {
            if ( strpos( $sectionName, '..' ) === false ) {
                continue;
            }

            $sectionNameParts = explode( '..', $sectionName );
            $sectionName = array_shift( $sectionNameParts );

            foreach( $sectionNameParts as $part ) {

                if ( !isset( $configuration[$groupName][$sectionName] ) ) {
                    $configuration[$groupName][$sectionName] = $configuration[$groupName][$sectionName . '..' . implode( '..', $sectionNameParts ) ];
                }

                $configuration[$groupName][$sectionName]->merge( 
                    $configuration[$groupName][$part]
                );

            }

            $unst = true;
        }
        
        if ( $unst ) {
            unset( $configuration[$groupName][$sectionName . '..' . implode( '..', $sectionNameParts ) ] );
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

        $grep = "grep --exclude-dir=tests --exclude-dir=.svn -o -r '^class [a-zA-Z0-9]*' '$path' | sed 's/^.*class //'";
        $grep = trim( shell_exec( $grep ) );

        if ( !$grep ) {
            continue;
        }

        foreach( explode( "\n", $grep ) as $class ) {
            $configuration['applications'][$name]['classes'][] = $class;
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
            $fileIterator = new RecursiveIteratorIterator( new RecursiveDirectoryIterator( $staticPath ) );

            foreach( $fileIterator as $fileInfo ) {
                $absolutePath = $fileInfo->getRealPath(  );
                $relativePath = substr( $absolutePath, strlen( $staticPath ) );

                $configuration['staticFiles']['paths'][$relativePath] = 
                    madConfiguration::getRelativePath( $absolutePath, ENTRY_APP_PATH );
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
                $value = madConfiguration::getRelativePath( $value, ENTRY_APP_PATH );
            }
        }
    }
}
$registry->signals->connect( 'configurationRefreshed', 'allPathsRelative' );

?>
