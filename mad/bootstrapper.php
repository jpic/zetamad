<?php

/**
 *
 * FEATURE FROZEN WARNING
 *
 * The only reason you may touch this before it is automatically testable is to 
 * send signals.
 *
 */
class madBootstrapper {
    static public $autoload;
    public $configuration;
    public $entryApplicationPath;
    public $refresh = false;

    public function __construct( $entryApplicationPath ) {
        $this->entryApplicationPath = $entryApplicationPath;

        $applicationsConfigurationPath = $entryApplicationPath . '/cache/etc/applications.php';
        if ( file_exists( $applicationsConfigurationPath ) ) {
            $this->configuration = require $applicationsConfigurationPath;
            $this->refresh = $this->configuration['mad']['refresh'];
        } else {
            $this->configuration = parse_ini_file( $entryApplicationPath . '/etc/applications.ini', true );
            $this->refresh = true;
        }
        
        if ( PHP_OS != 'Linux' ) {
            // refresh uses standard linux commands
            $this->refresh = false;
        }

        if ( isset( $_SERVER['REQUEST_URI'] ) && strpos( $_SERVER['REQUEST_URI'], 'static' ) ) {
            // dont refresh cache on static file hits
            $this->refresh = false;
        }
    }

    public function run(  ) {
        if ( $this->refresh ) {
            $this->setupIncludePath(  );
            $this->setupAutoload(  );
            $this->setupSignals(  );
            
            $this->setupConfiguration( $this->entryApplicationPath . '/etc' );
            
            $registry = madRegistry::instance(  );
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
            
            $this->refreshBin(  );
            $this->refreshAutoload(  );
            
            $this->setupDatabase(  );
            $this->setupModel(  );
        } else {
            $this->setupIncludePath(  );
            $this->setupAutoload(  );
            $this->setupSignals(  );
            $this->setupApplications(  );

            $this->setupConfiguration( $this->entryApplicationPath . '/cache/etc' );
            
            $this->setupDatabase(  );
            $this->setupModel(  );
        }

        $registry = madRegistry::instance(  );

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

        spl_autoload_register( array( 'madBootstrapper', 'autoload' ) );
    }

    static public function autoload( $class ) {
        if ( isset( self::$autoload[$class] ) ) {
            $path = realpath( join( DIRECTORY_SEPARATOR, array( 
                ENTRY_APP_PATH,
                self::$autoload[$class]
            ) ) );
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

        if ( $this->refresh ) {
            $registry->model->applyConfiguration(  );
        }
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
        if ( !$this->refresh ) {
            return true;
        }

        $ocwd = getcwd();
        chdir( $this->entryApplicationPath );
        shell_exec( 'bin/generate-autoload-file ../ > cache/autoload.php' );
        chdir( $ocwd );

        $this->setupAutoload(  );
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
}
?>
