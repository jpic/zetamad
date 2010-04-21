<?php
/**
 * File containing the madConfiguration class.
 * 
 * @package MadConfiguration
 * @version //autogen//
 * @copyright Copyright (C) 2010-2011 madeleinemarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
/**
 * madConfiguration is responsible for reading, merging and caching 
 * configuration from several folders.
 * 
 * See documentation of the factory() static method for an alternate way to 
 * instanciate madConfiguration.
 *
 * @package MadConfiguration
 * @version //autogen//
 */
class madConfiguration {
    /**
     * Array of paths to ini configuration.
     * 
     * @var array
     */
    private $paths;  
    
    /**
     * Settings array.
     * 
     * @var array
     */
    public $settings = array();

    /**
     * Comments array.
     * 
     * @var array
     */
    public $comments = array(  );

    /**
     * Instanciates a madConfiguration with an array of paths to configuration 
     * files.
     *
     * The configuration paths array should order paths from the most important to 
     * the least important.
     *
     * For example, if you want to overload the configuration of my application in 
     * the configuration folder of your application:
     * <code>
     * $configuration = new madConfiguration( array( 
     *     '/path/to/your-app/etc',
     *     '/path/to/my-app/etc',
     * ) );
     * </code>
     *
     * @param array $paths Array of full paths.
     * @return void
     */
    public function __construct( $paths ) {
        $this->paths = $paths;  
    }
   
    /**
     * Instanciate a madConfiguration with a path to an application that 
     * contains an 'applications.ini' configuration file.
     *
     * This factory assumes that all the applications store only ini configuration
     * files in a subdirectory named "etc".
     * 
     * For example, to create a complete madConfiguration for application 'yourApp':
     * <code>
     * $configuration = madConfiguration::factory( '/path/to/your-app' );
     * </code>
     *
     * @param string $applicationPath Absolute path to the application.
     * @return madConfiguration
     */
    static public function factory( $applicationPath, $refresh = false ) {
        $applicationName = substr( $applicationPath, strrpos( $applicationPath, DIRECTORY_SEPARATOR ) );

        if ( !$refresh ) {
            $path = join( DIRECTORY_SEPARATOR, array( 
                $applicationPath,
                'cache',
                'etc'
            ) );
            $return = new madConfiguration( array( $path ) );
            $return->read(  );
            return $return;
        }

        # generate applications config that we need
        $reader = new ezcConfigurationIniReader( join( DIRECTORY_SEPARATOR, array( 
            $applicationPath,
            'etc',
            'applications.ini'
        ) ) );
        $result = $reader->validate(  );
            
        foreach (  $result->getResultList( ) as $resultItem ) {
            print $resultItem->file . ":" . $resultItem->line . ":" . $resultItem->column. ":"; 
            print " " . $resultItem->details . "\n"; 
        }
        
        # load app settings
        $cfg = $reader->load();
        $settings = $cfg->getAllSettings(  );

        $paths = array( 
            join( DIRECTORY_SEPARATOR, array( 
                $applicationPath,
                'etc',
            ) ),
        );

        foreach( $settings as $app => $config ) {
            if ( isset( $config['configPaths'] ) ) {
                foreach( $config['configPaths'] as $configurationPath ) {
                    $path = realpath( join( DIRECTORY_SEPARATOR, array( 
                        $applicationPath,
                        $configurationPath
                    ) ) );

                    $out = shell_exec( "find $path -name etc -type d \! -path \"*/tests/*\" \! -path \"*/cache/*\"" );
                    if ( $out ) {
                        foreach( explode( "\n", $out ) as $path ) {
                            if ( $path == dirname( __FILE__ ) ) {
                                continue;
                            }
                            
                            if ( !$path ) {
                                continue;
                            }

                            if ( !in_array( $path, $paths ) ) {
                                $paths[] = $path;
                            }
                        }
                    }
                }
            }
        }

        $writer = new madConfiguration( $paths );
        $writer->read(  );
        $writer->clean(  );

        $path = join( DIRECTORY_SEPARATOR, array( 
            $applicationPath,
            'cache',
            'etc'
        ) );
        $writer->write( $path );
        $return = new madConfiguration( array( $path ) );
        $return->read(  );
        return $return;
    }

    /**
     * Writes the configuration in PHP format in an arbitary directory.
     *
     * For example, to write the configuration in /var/cache/etc:
     * <code>
     * $configuration->write( '/var/cache/etc' );
     * </code>
     *
     * @param string $path Output path
     * @return void
     */
    public function write( $path ) {
        if ( !$this->settings ) {
            $this->read();
        }

        foreach( array_keys( $this->settings ) as $confName ) {
            $writer = new ezcConfigurationArrayWriter(  );
            $writer->init(
                $path,
                $confName,
                new ezcConfiguration( $this->settings[$confName], $this->comments[$confName] )
            );
            $writer->save(  );
        }
    }

    /**
     * Read the ini configuration files in all paths and fills $this->settings 
     * and $this->comments.
     * 
     * @return void
     */
    public function read() {
        $this->settings['staticFiles'] = array( 'paths' => array(  ));
        $this->comments['staticFiles'] = array(  );
        $this->settings['applications'] = array(  );
        $this->comments['applications'] = array(  );
        
        foreach( $this->paths as $path ) {
            if ( !$path ) {
                continue;
            }

            $explode = explode( DIRECTORY_SEPARATOR, $path );
            $application = $explode[count( $explode )-2];
            $applicationPath = realpath( $path . DIRECTORY_SEPARATOR . '..' );
            if ( !isset( $this->settings['applications'][$application] ) ) {
                $this->settings['applications'][$application] = array();
            }
            $this->settings['applications'][$application]['path'] = self::getRelativePath( $applicationPath, APP_PATH );

            if ( !isset( $this->settings['applications'][$application]['classes'] ) ) {
                $this->settings['applications'][$application]['classes'] = array();
            }
            $command = "grep --exclude-dir=tests --exclude-dir=.svn -o -r '^class [a-zA-Z0-9]*' $applicationPath | sed 's/.*class //'";
            $out = shell_exec( $command );
            foreach( explode( "\n", $out ) as $className ) {
                if ( !$className ) { // skip empty className
                    continue;
                }
                $this->settings['applications'][$application]['classes'][] = $className;
            }


            $staticPath = realpath( $applicationPath . DIRECTORY_SEPARATOR . 'static' );
            if ( $staticPath ) {
                foreach( new RecursiveIteratorIterator( new RecursiveDirectoryIterator( $staticPath ) ) as $fileInfo ) {
                    $absolutePath = $fileInfo->getRealPath(  );
                    $relativePath = substr( $absolutePath, strlen( $staticPath ) );
                    $this->settings['staticFiles']['paths'][$relativePath] = self::getRelativePath( $absolutePath, APP_PATH );
                }
            }

            foreach( glob( $path . DIRECTORY_SEPARATOR . '*' ) as $file ) {
                $name = substr( $file, strrpos( $file, DIRECTORY_SEPARATOR ) + 1, -4 );
                $extension = substr( $file, -3 );

                if ( !isset( $this->comments[$name] ) ) {
                    $this->comments[$name] = array();
                }
                if ( !isset( $this->settings[$name] ) ) {
                    $this->settings[$name] = array();
                }
                
                if ( $extension == 'ini' ) {
                    $reader = new ezcConfigurationIniReader( $file );
                } elseif ( $extension == 'php' ) {
                    $reader = new ezcConfigurationArrayReader( $file );
                } else {
                    trigger_error( "Cannot figure configuration file extension for $file" );
                }

                $result = $reader->validate(  );
        
                foreach (  $result->getResultList( ) as $resultItem ) {
                    print $resultItem->file . ":" . $resultItem->line . ":" . $resultItem->column. ":"; 
                    print " " . $resultItem->details . "\n"; 
                }
                
                // load app settings
                $cfg = $reader->load();
                $settings = $cfg->getAllSettings(  );
                $comments = $cfg->getAllComments(  );

                if ( $name == 'routes' ) {
                    foreach( $settings as $sectionName => $section ) {
                        if ( !isset( $settings[$sectionName]['application'] ) ) {
                            $settings[$sectionName]['application'] = $application;
                        }
                    }
                }

                $this->settings[$name] = self::array_contribute( $this->settings[$name], $settings );
                $this->comments[$name] = self::array_contribute( $this->comments[$name], $comments );
            }
        }
    }

    /**
     * Cleans the 'routes' settings array.
     *
     * This method ensures all routes are prefixed and suffixed by a slash, and 
     * that routes have a 'rails' attribute.
     * 
     * @return void
     */
    public function clean(  ) {
        if ( !isset( $this->settings['routes'] ) ) {
            return;
        }

        foreach( $this->settings['routes'] as $name => $config ) {
            if ( isset( $config['rails'] ) ) {
                # todo: better to clean silently than to throw an exception?
                # route must be slash prefixed
                if ( substr( $config['rails'], 0, 1 ) != '/' ) {
                    $this->settings['routes'][$name]['rails'] = '/' . $config['rails'];
                }
                
                # route must be slash suffixed
                if ( substr( $config['rails'], -1 ) != '/' ) {
                    $this->settings['routes'][$name]['rails'] = $config['rails'] . '/';
                }
            } else {
                trigger_error( "Route $name has no 'rails' attribute!" );
            }
        }

        if ( !isset( $this->settings['applications'] ) ) {
            return ;
        }

        foreach( $this->settings['applications'] as $applicationName => $config ) {
            if ( isset( $config['routePrefix'] ) ) {
                foreach( $this->settings['routes'] as $routeName => $routeConfig ) {
                    $routeAppName = substr( $routeName, 0, strpos( $routeName, '.' ) );
                    if ( $routeAppName != $applicationName ) {
                        continue;
                    }

                    if ( isset( $routeConfig['rails'] ) ) {
                        # todo: better to clean silently than to throw an exception?
                        # route prefix must by slash prefixed
                        if ( substr( $config['routePrefix'], 0, 1 ) != '/' ) {
                            $this->settings['applications'][$applicationName]['routePrefix'] = '/' . $config['routePrefix'];
                        }

                        # route prefix must *NOT* be slash suffixed
                        if ( substr( $config['routePrefix'], -1 ) == '/' ) {
                            $this->settings['applications'][$applicationName]['routePrefix'] = substr( $config['routePrefix'], 0, -1 );
                        }

                        $newRoute = $this->settings['applications'][$applicationName]['routePrefix'] . $routeConfig['rails'];

                        // full path to setting, no need to thrust php "array 
                        // pass by reference"
                        $this->settings['routes'][$routeName]['rails'] = $newRoute;
                    }
                }
            }
        }
    }

    /**
     * Merge two arrays recursively, without allowing the second to overload 
     * the first one.
     * 
     * @param array $array 
     * @param array $contributor 
     * @return void
     */
    static public function array_contribute( &$array, $contributor ) {
        foreach( $contributor as $key => $value ) {
            if ( !array_key_exists( $key, $array ) ) {
                $array[$key] = $value;
            } elseif ( is_array( $value ) ) {
                self::array_contribute( $array[$key], $value );
            }
        }
        return $array;
    }

    public function getSetting( $group, $section, $name ) {
        return $this->settings[$group][$section][$name];
    }

    public function getClassApplicationName( $className ) {
        foreach( $this->settings['applications'] as $name => $settings ) {
            if ( isset( $settings['classes'] ) && in_array( $className, $settings['classes'] ) ) {
                return $name;
            }
        }

        throw new Exception( "Cannot find the name of the application containing class $className, does it contain a 'etc' subdir?" );
    }

    static public function getRelativePath( $path, $compareTo ) {
        // clean arguments by removing trailing and prefixing slashes
        if ( substr( $path, -1 ) == DIRECTORY_SEPARATOR ) {
            $path = substr( $path, 0, -1 );
        }
        if ( substr( $path, 0, 1 ) == DIRECTORY_SEPARATOR ) {
            $path = substr( $path, 1 );
        }

        if ( substr( $compareTo, -1 ) == DIRECTORY_SEPARATOR ) {
            $compareTo = substr( $compareTo, 0, -1 );
        }
        if ( substr( $compareTo, 0, 1 ) == DIRECTORY_SEPARATOR ) {
            $compareTo = substr( $compareTo, 1 );
        }

        // simple case: $compareTo is in $path
        if ( strpos( $path, $compareTo ) === 0 ) {
            $offset = strlen( $compareTo ) + 1;
            return substr( $path, $offset );
        }

        $relative  = array(  );
        $pathParts = explode( DIRECTORY_SEPARATOR, $path );
        $compareToParts = explode( DIRECTORY_SEPARATOR, $compareTo );

        foreach( $compareToParts as $index => $part ) {
            if ( isset( $pathParts[$index] ) && $pathParts[$index] == $part ) {
                continue;
            }

            $relative[] = '..';
        }

        foreach( $pathParts as $index => $part ) {
            if ( isset( $compareToParts[$index] ) && $compareToParts[$index] == $part ) {
                continue;
            }

            $relative[] = $part;
        }

        return implode( DIRECTORY_SEPARATOR, $relative );
    }
}

?>
