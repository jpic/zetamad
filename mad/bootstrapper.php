<?php
class madBootstrapper {
    static public $autoload;
    public $configuration;

    public function __construct( $configuration ) {
        $this->configuration = $configuration['settings'];
    }

    public function run(  ) {
        $this->setupIncludePath(  );
        $this->setupAutoload(  );
        $this->setupConfiguration(  );
        $this->setupSignals(  );
        $this->refreshAutoload(  );
        $this->refreshBin(  );
        $this->setupApplications(  );
        $this->setupDatabase(  );
        $this->setupModel(  );
    }

    public function setupIncludePath(  ) {
        $paths = array( 
            ENTRY_APP_PATH,
            get_include_path(  ),
        );

        foreach( $this->configuration['bootstrap']['includePath'] as $relativePath ) {
            if ( strpos( $relativePath, DIRECTORY_SEPARATOR ) !== 0 ) {
                $relativePath = DIRECTORY_SEPARATOR . $relativePath;
            }

            $paths[] = ENTRY_APP_PATH . $relativePath;
        }

        set_include_path( join( PATH_SEPARATOR, $paths ) );
    }

    public function setupAutoload(  ) {
        self::$autoload = require join( DIRECTORY_SEPARATOR, array(  
            ENTRY_APP_PATH,
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

    public function setupConfiguration(  ) {
        $refresh = isset( $this->configuration['bootstrap']['refreshCache'] ) ? $this->configuration['bootstrap']['refreshCache'] : true;

        if ( PHP_OS != 'Linux' ) {
            // refresh uses standard linux commands
            $refresh = false;
        }

        if ( isset( $_SERVER['REQUEST_URI'] ) && strpos( $_SERVER['REQUEST_URI'], 'static' ) ) {
            // dont refresh cache on static file hits
            $refresh = false;
        }

        $configuration = madConfiguration::factory( ENTRY_APP_PATH, $refresh );

        madRegistry::instance()->configuration = $configuration;
    }

    public function setupDatabase(  ) {
        if ( isset( $this->configuration['database']['skip'] ) && 
            $this->configuration['database']['skip'] == true ) {
            return true;
        }

        $reflection = new ReflectionClass( $this->configuration['database']['class'] );
        
        $database = $reflection->newInstanceArgs( $this->configuration['database']['arguments'] );
        $database->query( 'set names "UTF-8"' );
        $database->setAttribute( PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        
        madRegistry::instance()->database = $database;
    }

    public function setupModel(  ) {
        $registry = madRegistry::instance();

        $registry->model = new madModel( 
            $registry->database, 
            $registry->configuration->settings['model'],
            $registry->configuration->settings['core']['model']
        );

        if ( $this->configuration['bootstrap']['refreshModel'] ) {
            $registry->model->applyConfiguration(  );
        }
    }

    public function setupSignals(  ) {
        $registry = madRegistry::instance();
        $registry->signals = new madSignals(  );
    }

    public function refreshBin(  ) {
        if ( !$this->configuration['bootstrap']['refreshBin'] ) {
            return true;
        }

        if ( PHP_OS != 'Linux' ) {
            // refresh uses standard linux commands
            return true;
        }

        if ( isset( $_SERVER['REQUEST_URI'] ) && strpos( $_SERVER['REQUEST_URI'], 'static' ) ) {
            // dont refresh cache on static file hits
            return true;
        }

        $ocwd = getcwd();
        chdir( ENTRY_APP_PATH );
        chdir( 'bin' );
        shell_exec( './generate-bin ../../' );
        chdir( $ocwd );
    }

    public function refreshAutoload(  ) {
        if ( !$this->configuration['bootstrap']['refreshAutoload'] ) {
            return true;
        }

        if ( PHP_OS != 'Linux' ) {
            // refresh uses standard linux commands
            return true;
        }

        if ( isset( $_SERVER['REQUEST_URI'] ) && strpos( $_SERVER['REQUEST_URI'], 'static' ) ) {
            // dont refresh cache on static file hits
            return true;
        }

        $ocwd = getcwd();
        chdir( ENTRY_APP_PATH );
        shell_exec( 'bin/generate-autoload-file ../ > cache/autoload.php' );
        chdir( $ocwd );

        $this->setupAutoload(  );
    }

    public function setupApplications(  ) {
        $registry = madRegistry::instance();

        foreach( $registry->configuration->settings['applications'] as $name => $application ) {
            $bootstrap = realpath( join( DIRECTORY_SEPARATOR, array( 
                ENTRY_APP_PATH,
                $application['path'],
                'bootstrap.php',
            ) ) );
        
            if ( file_exists( $bootstrap ) && $bootstrap != __FILE__  && $bootstrap != ENTRY_APP_PATH . DIRECTORY_SEPARATOR . 'bootstrap.php' ) {
                require $bootstrap;
            }
        }
    }
}
?>
