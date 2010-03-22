<?php
/**
 * File containing the madCoreConfiguration class.
 * 
 * @package MadConfiguration
 * @version //autogen//
 * @copyright Copyright (C) 2010-2011 madeleinemarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
/**
 * madCoreConfiguration is responsible for reading, merging and caching 
 * configuration from several folders.
 * 
 * See documentation of the factory() static method for an alternate way to 
 * instanciate madCoreConfiguration.
 *
 * @package MadConfiguration
 * @version //autogen//
 */
class madCoreConfiguration {
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
     * Instanciates a madCoreConfiguration with an array of paths to configuration 
     * files.
     *
     * The configuration paths array should order paths from the most important to 
     * the least important.
     *
     * For example, if you want to overload the configuration of my application in 
     * the configuration folder of your application:
     * <code>
     * $configuration = new madCoreConfiguration( array( 
     *     '/path/to/your-app/configuration',
     *     '/path/to/my-app/configuration',
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
     * Instanciate a madCoreConfiguration with a path to an application that 
     * contains an 'applications.ini' configuration file.
     *
     * This factory assumes that all the applications store only ini configuration
     * files in a subdirectory named "configuration".
     * 
     * For example, to create a complete madCoreConfiguration for application 'yourApp':
     * <code>
     * $configuration = madCoreConfiguration::factory( '/path/to/your-app' );
     * </code>
     *
     * @param string $applicationPath Absolute path to the application.
     * @return madCoreConfiguration
     */
    static public function factory( $applicationPath, $refresh = false ) {
        $applicationName = substr( $applicationPath, strrpos( $applicationPath, DIRECTORY_SEPARATOR ) );

        if ( !$refresh ) {
            $path = join( DIRECTORY_SEPARATOR, array( 
                $applicationPath,
                'cache',
                'configuration'
            ) );
            $return = new madCoreConfiguration( array( $path ) );
            $return->read(  );
            return $return;
        }

        # generate applications config that we need
        $reader = new ezcConfigurationIniReader( join( DIRECTORY_SEPARATOR, array( 
            $applicationPath,
            'configuration',
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
                'configuration',
            ) ),
        );

        foreach( $settings as $app => $config ) {
            if ( isset( $config['configPaths'] ) ) {
                foreach( $config['configPaths'] as $configurationPath ) {
                    $path = realpath( join( DIRECTORY_SEPARATOR, array( 
                        $applicationPath,
                        $configurationPath
                    ) ) );

                    $out = shell_exec( "find $path -name configuration -type d \! -path \"*/tests/*\" \! -path \"*/cache/*\"" );
                    if ( $out ) {
                        foreach( split( "\n", $out ) as $path ) {
                            if ( $path == dirname( __FILE__ ) ) {
                                continue;
                            }
                            
                            if ( !$path ) {
                                continue;
                            }

                            $paths[] = $path;
                        }
                    }
                }
            }
        }

        $writer = new madCoreConfiguration( $paths );
        $writer->read(  );
        $writer->clean(  );

        $path = join( DIRECTORY_SEPARATOR, array( 
            $applicationPath,
            'cache',
            'configuration'
        ) );
        $writer->write( $path );
        $return = new madCoreConfiguration( array( $path ) );
        $return->read(  );
        return $return;
    }

    /**
     * Writes the configuration in PHP format in an arbitary directory.
     *
     * For example, to write the configuration in /var/cache/configuration:
     * <code>
     * $configuration->write( '/var/cache/configuration' );
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

        foreach( $this->paths as $path ) {
            if ( !$path ) {
                continue;
            }

            $split = split( DIRECTORY_SEPARATOR, $path );
            $application = $split[count( $split )-2];

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

                foreach( $settings as $sectionName => $section ) {
                    if ( !isset( $settings[$sectionName]['application'] ) ) {
                        $settings[$sectionName]['application'] = $application;
                    }
                }

                $staticPath = realpath( $path . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'static' );
                foreach( new RecursiveIteratorIterator( new RecursiveDirectoryIterator( $staticPath ) ) as $fileInfo ) {
                    $absolutePath = $fileInfo->getRealPath(  );
                    $relativePath = substr( $absolutePath, strlen( $staticPath ) );
                    $this->settings['staticFiles']['paths'][$relativePath] = $absolutePath;
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
}

?>
