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
    public $refresh = false;

    public function __construct( $entryApplicationPath ) {
        $this->entryApplicationPath = $entryApplicationPath;

        $applicationsConfigurationPath = $entryApplicationPath . '/cache/etc/applications.php';
        if ( file_exists( $applicationsConfigurationPath ) ) {
            $this->configuration = require $applicationsConfigurationPath;
        } else {
            $this->configuration = parse_ini_file( $entryApplicationPath . '/etc/applications.ini', true );
            $this->configuration['mad']['refreshConfiguration'] = true;
        }

        if ( $this->configuration['mad']['refreshConfiguration'] ) {
            $this->configuration = parse_ini_file( $entryApplicationPath . '/etc/applications.ini', true );
        }
        
        if ( isset( $_SERVER['REQUEST_URI'] ) && strpos( $_SERVER['REQUEST_URI'], 'static' ) ) {
            // dont refresh cache on static file hits
            $this->configuration['mad']['refreshAutoload']      = false;
            $this->configuration['mad']['refreshDatabase']      = false;
            $this->configuration['mad']['refreshBin']           = false;
            $this->configuration['mad']['refreshConfiguration'] = false;
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
            $this->setupConfiguration( $this->entryApplicationPath . '/etc' );
            
            // parse all ini files again, with overload support, that will 
            // update the core configuration (applications.ini)
            $registry->configuration->refresh( $this->entryApplicationPath );
            // bootstrapper requires refreshed configuration with non-overloaded variables
            $this->configuration = $registry->configuration['applications'];
            // call bootstrap.php from all installed application path to 
            // connect signals
            $this->setupApplications(  );
            // allow connected functions to visit it befoere it is written
            $registry->signals->send( 'configurationRefreshed', array( $registry->configuration ) );
            // cache the parsed configuration for performances
            $registry->configuration->write( $this->entryApplicationPath . '/cache/etc' );
            
            $this->setupDatabase(  );
            $this->setupModel(  );
        } else {
            $this->setupApplications(  );
            $this->setupConfiguration( $this->entryApplicationPath . '/cache/etc' );
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
    }

    public function setupIncludePath(  ) {
        $paths = array( 
            $this->entryApplicationPath,
            get_include_path(  ),
        );
    
        foreach( $this->configuration['mad']['includePath'] as $relativePath ) {
            if ( strpos( $relativePath, DIRECTORY_SEPARATOR ) !== 0 ) {
                $relativePath = DIRECTORY_SEPARATOR . $relativePath;
            }

            $paths[] = $this->entryApplicationPath . $relativePath;
        }

        set_include_path( join( PATH_SEPARATOR, $paths ) );
    }

    public function setupAutoload(  ) {
        self::$autoload = require join( DIRECTORY_SEPARATOR, array(  
            $this->entryApplicationPath,
            'cache',
            'autoload.php',
        ) );

        spl_autoload_register( array( 'madFramework', 'autoload' ) );
    }

    static public function autoload( $class ) {
        if ( isset( self::$autoload[$class] ) ) {
            $path = realpath( join( DIRECTORY_SEPARATOR, array( 
                ENTRY_APP_PATH,
                self::$autoload[$class]
            ) ) );

            if ( !file_exists( $path ) ) {
                trigger_error( "Cannot load $class from $path which does not exists", E_USER_ERROR );
            }

            require $path;
        }
    }

    public function setupConfiguration( $path ) {
        $configuration = new madConfiguration( $path, $this->configuration );
        madRegistry::instance()->configuration = $configuration;
    }

    public function setupDatabase(  ) {
        if ( isset( $this->configuration['mad']['pdoSkip'] ) && 
            $this->configuration['mad']['pdoSkip'] == true ) {
            return true;
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

        $fileIterator = new RecursiveIteratorIterator( new RecursiveDirectoryIterator( 
            $this->entryApplicationPath . '/..',
            RecursiveDirectoryIterator::FOLLOW_SYMLINKS|RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST
        ) );

        foreach( $fileIterator as $fileInfo ) {
            if ( $fileInfo->isDir(  ) ) {
                continue;
            }

            if ( substr( $fileInfo->getFilename(  ), -4) != '.php' ) {
                continue;
            }

            $relativePath = madFramework::getRelativePath( $fileInfo->getPath(  ) . '/' . $fileInfo->getBaseName(), $this->entryApplicationPath );
             
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
            '<?php return ' . var_export( self::$autoload, true ) . ' ?>' 
        );
    }

    public function setupApplications(  ) {
        foreach( $this->configuration as $name => $application ) {
            $bootstrap = realpath( join( DIRECTORY_SEPARATOR, array( 
                $this->entryApplicationPath,
                $application['path'],
                'bootstrap.php',
            ) ) );

            if ( file_exists( $bootstrap ) && $bootstrap != __FILE__  && $bootstrap != $this->entryApplicationPath . DIRECTORY_SEPARATOR . 'bootstrap.php' ) {
                require $bootstrap;
            }
        }
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
