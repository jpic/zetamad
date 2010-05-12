<?php

/**
 *
 * FEATURE FROZEN WARNING
 *
 * The only reason you may touch this before it is automatically testable is to 
 * send signals.
 *
 */
class madFramework {
    static public $autoload;
    public $configuration;
    public $entryApplicationPath;
    public $entryApplicationName;
    public $refresh = false;

    public function __construct( $entryApplicationPath ) {
        $this->entryApplicationPath = madFramework::fixPath( $entryApplicationPath );
        $this->entryApplicationName = substr( $this->entryApplicationPath, strrpos( $this->entryApplicationPath, '/' ) + 1 );

        define( 'ENTRY_APP_PATH', $entryApplicationPath );

        $applicationsConfigurationPath = $this->entryApplicationPath . '/cache/etc/applications.php';
        if ( file_exists( $applicationsConfigurationPath ) ) {
            $this->configuration = require $applicationsConfigurationPath;
        } else {
            $this->configuration = parse_ini_file( $this->entryApplicationPath . '/etc/applications.ini', true );
            $this->configuration['mad']['refreshConfiguration'] = true;
        }
        
        if ( isset( $_SERVER['REQUEST_URI'] ) && strpos( $_SERVER['REQUEST_URI'], 'static' ) ) {
            // dont refresh cache on static file hits
            $this->configuration['mad']['refreshAutoload']      = false;
            $this->configuration['mad']['refreshDatabase']      = false;
            $this->configuration['mad']['refreshBin']           = false;
            $this->configuration['mad']['refreshConfiguration'] = false;
        } elseif ( $this->configuration['mad']['refreshConfiguration'] ) {
            // force configuration reload
            $this->configuration = parse_ini_file( $this->entryApplicationPath . '/etc/applications.ini', true );
            $this->configuration['mad']['refreshConfiguration'] = true;
        }

        // auto make cache director
        if ( !is_dir( $this->entryApplicationPath . '/cache' ) ) {
            mkdir( $this->entryApplicationPath . '/cache' );
        }

        // force autoload refresh
        if ( !file_exists( $this->entryApplicationPath . '/cache/autoload.php' ) ) {
            $this->configuration['mad']['refreshAutoload'] = true;
        }

        // force cache refresh
        if ( !is_dir( $this->entryApplicationPath . '/cache/etc' ) ) {
            mkdir( $this->entryApplicationPath . '/cache/etc' );
            $this->configuration['mad']['refreshConfiguration'] = true;
        }
    }

    public function run(  ) {
        $this->setupIncludePath(  );

        if ( $this->configuration['mad']['refreshAutoload'] ) {
            $this->refreshAutoload(  );
        }

        $this->setupAutoload(  );
        
        $registry = madRegistry::instance(  );

        $this->setupSignals(  );
        
        if ( $this->configuration['mad']['refreshConfiguration'] ) {
            $registry->configuration = new madConfiguration( $this->entryApplicationPath . '/etc', $this->configuration );
            // parse all ini files again, with overload support, that will 
            // update the core configuration (applications.ini)
            $registry->configuration->refreshApplications( $this->entryApplicationPath, 'etc' );
            $registry->configuration->refresh( $this->entryApplicationPath, array_keys( (array)$registry->configuration['applications'] ), 'etc' );
            // bootstrapper requires refreshed configuration with non-overloaded variables
            $this->configuration = $registry->configuration['applications'];
            // call bootstrap.php from all installed application path to 
            // connect signals
            $this->setupApplications(  );
            // allow connected functions to visit it befoere it is written
            $registry->signals->send( 'postConfigurationRefresh', array( $registry->configuration ) );
            // cache the parsed configuration for performances
            $registry->configuration->write( $this->entryApplicationPath . '/cache/etc' );
        } else {
            $registry->configuration = new madConfiguration( $this->entryApplicationPath . '/cache/etc', $this->configuration );
            $this->setupApplications(  );
        }
        
        $this->configuration['mad']['refreshLocale'] = isset( $this->configuration['mad']['refreshLocale'] ) && $this->configuration['mad']['refreshLocale'] && is_dir( $this->entryApplicationPath . '/locale' ) ? false : true;

        if ( $this->configuration['mad']['refreshLocale'] ) {
            $registry->locale = new madConfiguration( $this->entryApplicationPath . '/locale', $this->configuration );
            $registry->locale->refresh( $this->entryApplicationPath, array_keys( (array)$registry->configuration['applications'] ), 'locale' );
            // no need for application configuration in the locale confiuration
            unset( $registry->locale['applications'] );
            $registry->signals->send( 'postLocaleRefresh', array( $registry->locale ) );

            if ( !is_dir( $this->entryApplicationPath . '/cache/locale' ) ) {
                mkdir( $this->entryApplicationPath . '/cache/locale' );
            }

            $registry->locale->write( $this->entryApplicationPath . '/cache/locale' );
        } else {
            $regitry->configuration = new madConfiguration( $this->entryApplicationPath . '/cache/locale', $this->configuration, 'locale' );
        }

        if ( $this->configuration['mad']['refreshBin'] ) {
            $this->refreshBin(  );
        }

        if ( $registry->signals->send( 'preSetupDatabase', array( $this ) ) ) {
            $this->setupDatabase(  );
        } else {
            if ( !isset( $registry->database ) ) {
                trigger_error( 'Signal preSetupDatabase returned false, but $registry->database was not set', E_USER_ERROR );
            }
        }
        
        $registry->signals->send( 'preSetupModel', array( $this ) );
        $this->setupModel(  );

        if ( $this->configuration['mad']['refreshDatabase'] ) {
            $registry->model->applyConfiguration(  );
        }

        $registry->signals->send( 'postBootstrap', array( $this ) );

        if ( !isset( $_SESSION ) ) {
            session_start(  );
        }
    }

    public function setupIncludePath(  ) {
        $paths = array( 
            $this->entryApplicationPath,
            get_include_path(  ),
        );
    
        foreach( $this->configuration['mad']['includePath'] as $relativePath ) {
            if ( strpos( $relativePath, '/' ) !== 0 ) {
                $relativePath = '/' . $relativePath;
            }

            $paths[] = $this->entryApplicationPath . $relativePath;
        }

        set_include_path( join( PATH_SEPARATOR, $paths ) );
    }

    public function setupAutoload(  ) {
        self::$autoload = require join( '/', array(  
            $this->entryApplicationPath,
            'cache',
            'autoload.php',
        ) );

        spl_autoload_register( array( 'madFramework', 'autoload' ) );
    }

    static public function autoload( $class ) {
        if ( isset( self::$autoload[$class] ) ) {
            $path = ENTRY_APP_PATH . '/' . self::$autoload[$class];

            if ( !file_exists( $path ) ) {
                trigger_error( "Cannot load $class from $path which does not exists", E_USER_ERROR );
            }

            require $path;
        }
    }

    public function setupDatabase(  ) {
        if ( isset( $this->configuration['mad']['pdoSkip'] ) && 
            $this->configuration['mad']['pdoSkip'] == true ) {
            return true;
        }

        if ( ! $this->configuration['mad']['pdoClass'] ) {
            die( 'Did you change refreshConfiguration and did not remove the cache dir?' );
        }

        $reflection = new ReflectionClass( $this->configuration['mad']['pdoClass'] );
        
        $database = $reflection->newInstanceArgs( $this->configuration['mad']['pdoArguments'] );
        $database->query( 'set names "UTF-8"' );
        $database->setAttribute( PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        
        madRegistry::instance()->database = $database;
    }

    public function setupModel(  ) {
        $registry = madRegistry::instance();

        $registry->model = new madModel( 
            $registry->database, 
            $registry->configuration['model'],
            $this->configuration['mad']
        );
    }

    public function setupSignals(  ) {
        $registry = madRegistry::instance();
        $registry->signals = new madSignals(  );
    }

    public function refreshBin(  ) {
        if ( !$this->refresh ) {
            return true;
        }

        $ocwd = getcwd();
        chdir( $this->entryApplicationPath );
        chdir( 'bin' );
        shell_exec( './generate-bin ../../' );
        chdir( $ocwd );
    }

    public function refreshAutoload(  ) {
        $autoloadPath = $this->entryApplicationPath . '/cache/autoload.php';
        if ( file_exists( $autoloadPath ) && !is_writable( $autoloadPath ) ) {
            trigger_error( "$autoloadPath is not writable", E_USER_ERROR );
        }

        if ( defined( 'RecursiveDirectoryIterator::FOLLOW_SYMLINKS' ) ) {
            $flags = RecursiveDirectoryIterator::FOLLOW_SYMLINKS|RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
        } else { // php 5.2.6 support
            $flags = RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
        }

        $fileIterator = new RecursiveIteratorIterator( new RecursiveDirectoryIterator( 
            $this->entryApplicationPath . '/..',
            $flags
        ) );

        foreach( $fileIterator as $fileInfo ) {
            if ( $fileInfo->isDir(  ) ) {
                continue;
            }

            if ( substr( $fileInfo->getFilename(  ), -4) != '.php' ) {
                continue;
            }

            $path = madFramework::fixPath( $fileInfo->getPath(  ) . '/' . $fileInfo->getBaseName() );
            $relativePath = madFramework::getRelativePath( $path, $this->entryApplicationPath );
             
            // skip tests
            if ( strpos( $relativePath, 'tests' ) !== false ) {
                continue;
            }

            // skip cache
            if ( strpos( $relativePath, 'cache' ) !== false ) {
                continue;
            }

            $fileObject = $fileInfo->openFile(  );

            if ( !$fileObject->isReadable(  ) ) {
                trigger_error( "$fileInfo is not readable", E_USER_ERROR );
            }

            while( !$fileObject->eof(  ) ) {
                // this pattern does not work FFS
                // $pattern = '/^(class)|(abstract class)|(interface) ([a-zA-Z0-9_]+)/';
                $line = $fileObject->fgets(  );

                $pattern = '/^class (?P<className>[a-zA-Z0-9_]+)/';
                if ( preg_match( $pattern, $line, $matches ) ) {
                    self::$autoload[$matches['className']] = $relativePath;
                }

                $pattern = '/^abstract class (?P<className>[a-zA-Z0-9_]+)/';
                if ( preg_match( $pattern, $line, $matches ) ) {
                    self::$autoload[$matches['className']] = $relativePath;
                }

                $pattern = '/^interface (?P<className>[a-zA-Z0-9_]+)/';
                if ( preg_match( $pattern, $line, $matches ) ) {
                    self::$autoload[$matches['className']] = $relativePath;
                }
            }
        }

        file_put_contents( 
            $autoloadPath, 
            '<?php return ' . var_export( self::$autoload, true ) . ' ?>' // <?php /* syntax highlight hack */
        );
    }

    public function setupApplications(  ) {
        foreach( $this->configuration as $name => $application ) {
            if ( $name == $this->entryApplicationName ) {
                continue;
            }

            $bootstrap = $this->entryApplicationPath . '/' . $application['path'] . '/bootstrap.php';
        
            if ( file_exists( $bootstrap ) ) {
                require $bootstrap;
            }
        }
    }

    static public function getRelativePath( $path, $compareTo ) {
        // clean arguments by removing trailing and prefixing slashes
        if ( substr( $path, -1 ) == '/' ) {
            $path = substr( $path, 0, -1 );
        }
        if ( substr( $path, 0, 1 ) == '/' ) {
            $path = substr( $path, 1 );
        }

        if ( substr( $compareTo, -1 ) == '/' ) {
            $compareTo = substr( $compareTo, 0, -1 );
        }
        if ( substr( $compareTo, 0, 1 ) == '/' ) {
            $compareTo = substr( $compareTo, 1 );
        }

        // simple case: $compareTo is in $path
        if ( strpos( $path, $compareTo ) === 0 ) {
            $offset = strlen( $compareTo ) + 1;
            return substr( $path, $offset );
        }

        $relative  = array(  );
        $pathParts = explode( '/', $path );
        $compareToParts = explode( '/', $compareTo );

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

        return implode( '/', $relative );
    }

    static public function fixPath( $path ) {
        if ( DIRECTORY_SEPARATOR == '\\' ) {
            $path = str_replace( DIRECTORY_SEPARATOR, '/', $path );
        }

        if ( substr( $path, -1 ) == '/' ) {
            $path = substr( $path, 0, -1 );
        }
        return $path;
    }

    static public function fixPathArray( ArrayObject $array ) {
        if ( DIRECTORY_SEPARATOR == '/' ) {
            return true;
        }

        foreach( $array as $key => $value ) {
            if ( is_array( $value ) ) {
                $array[$key] = new madObject( $value );
                self::fixPathArray( $array[$key] );
            } elseif ( $value instanceof Traversable ) {
                self::fixPathArray( $array[$key] );
            } else {
                $array[$key] = str_replace( DIRECTORY_SEPARATOR, '/', $value );
            }
        }
    }

    static public function dictionnaryReplace( $string, $dictionnary ) {
        $finalDictionnary = array(  );

        foreach( $dictionnary as $key => $value ) {
            $finalDictionnary["%($key)s"] = $value;
        }

        return str_replace( 
            array_keys( $finalDictionnary ), 
            array_values( $finalDictionnary ), 
            $string
        );
    }
}
?>
