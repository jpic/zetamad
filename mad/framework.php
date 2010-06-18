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
    public $applications;
    public $entryApplicationPath;
    public $entryApplicationName;
    public $refresh = false;
    static public $instance;
    public $registry =array(  );
    public $languages = null;
    public $configuration;
    public $request;
    public $result;
    public $routeConfiguration;

    # {{{ bootstrap
    public function __construct( $entryApplicationPath ) {
        $this->entryApplicationPath = madFramework::fixPath( $entryApplicationPath );
        $this->entryApplicationName = substr( $this->entryApplicationPath, strrpos( $this->entryApplicationPath, '/' ) + 1 );

        define( 'ENTRY_APP_PATH', $entryApplicationPath );

        $applicationsConfigurationPath = $this->entryApplicationPath . '/cache/etc/applications.php';
        if ( file_exists( $applicationsConfigurationPath ) ) {
            $this->applications = require $applicationsConfigurationPath;
        } else {
            $this->applications = parse_ini_file( $this->entryApplicationPath . '/etc/applications.ini', true );
            $this->applications['mad']['refreshConfiguration'] = true;
        }

        if ( $this->xhprofEnable ) {
            xhprof_enable();
        }

        if ( isset( $_SERVER['REQUEST_URI'] ) && strpos( $_SERVER['REQUEST_URI'], 'static' ) ) {
            // dont refresh cache on static file hits
            $this->applications['mad']['refreshAutoload']      = false;
            $this->applications['mad']['refreshStatic']        = false;
            $this->applications['mad']['refreshTemplates']     = false;
            $this->applications['mad']['refreshConfiguration'] = false;
        } elseif ( $this->applications['mad']['refreshConfiguration'] ) {
            // force configuration reload
            $this->applications = parse_ini_file( $this->entryApplicationPath . '/etc/applications.ini', true );
            $this->applications['mad']['refreshConfiguration'] = true;
        }

        // auto make cache director
        if ( !is_dir( $this->entryApplicationPath . '/cache' ) ) {
            mkdir( $this->entryApplicationPath . '/cache' );
        }

        // force autoload refresh
        if ( !file_exists( $this->entryApplicationPath . '/cache/autoload.php' ) ) {
            $this->applications['mad']['refreshAutoload'] = true;
        }

        // force cache refresh
        if ( !is_dir( $this->entryApplicationPath . '/cache/etc' ) ) {
            mkdir( $this->entryApplicationPath . '/cache/etc' );
            $this->applications['mad']['refreshConfiguration'] = true;
        }

        if ( !is_dir( $this->entryApplicationPath . '/cache/templates' ) ) {
            mkdir( $this->entryApplicationPath . '/cache/templates' );
            $this->applications['mad']['refreshTemplates'] = true;
        }

        if ( !is_dir( $this->entryApplicationPath . '/www/static' ) ) {
            mkdir( $this->entryApplicationPath . '/www/static' );
            $this->applications['mad']['refreshStatic'] = true;
        }

        if ( !isset( self::$instance ) ) {
            self::$instance = $this;
        }
    }

    public function __destruct() {
        if ( $this->xhprofEnable ) {
            $data = xhprof_disable();

            require $this->entryApplicationPath . '/' . $this->applications['mad']['xhprofPath'] . '/utils/xhprof_lib.php';
            require $this->entryApplicationPath . '/' . $this->applications['mad']['xhprofPath'] . '/utils/xhprof_runs.php';
            $profiler = new XHProfRuns_Default();
            $runId = $profiler->save_run( $data, 'mad' );
            shell_exec("echo $runId > /tmp/prof");
        }
    }

    public function createXhprofEnable()  {
        if ( empty( $this->applications['mad']['xhprofEnable'] ) ) {
            return false;
        }
        if ( !extension_loaded( 'xhprof' ) ) {
            return false;
        }
        return true;
    }

    public function refreshConfiguration( $setupApplications = false ) {
        $this->configuration = new madConfiguration( $this->entryApplicationPath . '/etc', $this->applications );
        // parse all ini files again, with overload support, that will
        // update the core configuration (applications.ini)
        $this->configuration->refreshApplications( $this->entryApplicationPath, 'etc' );
        $this->configuration->refresh( $this->entryApplicationPath, array_keys( (array)$this->configuration['applications'] ), 'etc' );
        // bootstrapper requires refreshed configuration with non-overloaded variables
        $this->applications =& $this->configuration['applications'];
        if ( $setupApplications ) {
            // call bootstrap.php from all installed application path to
            // connect signals
            $this->setupApplications(  );
        }

        // allow connected functions to visit it befoere it is written
        $this->sendSignal( 'postConfigurationRefresh', array( &$this->configuration ) );
        // cache the parsed configuration for performances
        $this->configuration->write( $this->entryApplicationPath . '/cache/etc' );
    }

    public function refreshLocale() {
        $this->locale = new madConfiguration( $this->entryApplicationPath . '/locale', $this->applications );
        $this->locale->refresh( $this->entryApplicationPath, array_keys( (array)$this->configuration['applications'] ), 'locale' );
        // no need for application configuration in the locale confiuration
        unset( $this->locale['applications'] );
        $this->sendSignal( 'postLocaleRefresh', array( $this->locale ) );

        if ( !is_dir( $this->entryApplicationPath . '/cache/locale' ) ) {
            mkdir( $this->entryApplicationPath . '/cache/locale' );
        }

        $this->locale->write( $this->entryApplicationPath . '/cache/locale' );
    }

    public function run(  ) {
        if ( $this->applications['mad']['refreshAutoload'] ) {
            $this->refreshAutoload(  );
        }

        set_include_path( ENTRY_APP_PATH . '/cache/templates'. PATH_SEPARATOR . get_include_path() );

        $this->setupAutoload(  );
        
        if ( $this->applications['mad']['refreshConfiguration'] ) {
            $this->refreshConfiguration( true );
        } else {
            $this->configuration = new madConfiguration( $this->entryApplicationPath . '/cache/etc', $this->applications );
            // php parser is still retarded
            $this->applications = $this->configuration['applications'];
            $this->setupApplications(  );
        }
        
        $this->applications['mad']['refreshLocale'] = isset( $this->applications['mad']['refreshLocale'] ) && $this->applications['mad']['refreshLocale'] && is_dir( $this->entryApplicationPath . '/locale' ) ? false : true;

        if ( $this->applications['mad']['refreshLocale'] ) {
            $this->refreshLocale();
        } else {
            $this->locale = new madConfiguration( $this->entryApplicationPath . '/cache/locale', $this->applications, 'locale' );
        }

        if ( !empty( $this->applications['mad']['refreshBin'] ) ) {
            $this->refreshBin(  );
        }

        if ( $this->sendSignal( 'preSetupDatabase', array( $this ) ) ) {
            $this->setupDatabase(  );
        } else {
            if ( !isset( $this->pdo ) ) {
                trigger_error( 'Signal preSetupDatabase returned false, but $this->database was not set', E_USER_ERROR );
            }
        }

        $this->pdo->query( 'set names utf8' );

        if ( $this->applications['mad']['refreshTemplates'] ) {
            $this->refreshTemplates();
        }

        if ( $this->applications['mad']['refreshStatic'] ) {
            $this->refreshStatic();
        }

        if ( $this->applications['mad']['refreshPdo'] ) {
            $this->refreshPdo();
        }

        $this->sendSignal( 'postBootstrap', array( $this ) );

        if ( !isset( $_SESSION ) ) {
            session_start(  );
        }

        if ( !isset( $_SESSION['messages'] ) ) {
            $_SESSION['messages'] = array(  );
        }
    }

    public function refreshPdo() {
        $this->pdo->cacheReset();
    }

    public function refreshStatic() {
        $staticPath = ENTRY_APP_PATH . '/www/static';
        if ( is_dir( $staticPath ) ) {
            ezcBaseFile::removeRecursive( $staticPath );
        }

        $applications = array_reverse( array_keys( (array) $this->configuration['applications'] ) );

        foreach( $applications as $application ) {
            $path = $this->configuration->getPathSetting( 'applications', $application, 'path' ) . '/static';
            madFramework::copyRecursive( $path, $staticPath );
        }
    }

    public function refreshTemplates() {
        $templatesPath = ENTRY_APP_PATH . '/cache/templates';
        if ( is_dir( $templatesPath ) ) {
            ezcBaseFile::removeRecursive( $templatesPath );
        }

        $applications = array_reverse( array_keys( (array) $this->applications ) );

        foreach( $applications as $application ) {
            $path = $this->configuration->getPathSetting( 'applications', $application, 'path' ) . '/templates';
            madFramework::copyRecursive( $path, $templatesPath );
        }
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
        if ( isset( $this->applications['mad']['pdoSkip'] ) && 
            $this->applications['mad']['pdoSkip'] == true ) {
            return true;
        }

        if ( ! $this->applications['mad']['pdoClass'] ) {
            die( 'Did you change refreshConfiguration and did not remove the cache dir?' );
        }

        $reflection = new ReflectionClass( $this->applications['mad']['pdoClass'] );
        
        $database = $reflection->newInstanceArgs( $this->applications['mad']['pdoArguments'] );
        $database->query( 'set names "UTF-8"' );
        $database->setAttribute( PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        
        madFramework::instance()->database = $database;
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
        foreach( $this->applications as $name => $application ) {
            if ( $name == $this->entryApplicationName ) {
                continue;
            }

            if ( empty($application['path']) ) {
                throw new madApplicationPathNotFound( $application );
            }

            $bootstrap = $this->entryApplicationPath . '/' . $application['path'] . '/bootstrap.php';
        
            if ( file_exists( $bootstrap ) ) {
                require $bootstrap;
            }
        }
    }

    public function createUrlPrefix(  ) {
        return $this->configuration->getSetting( 'applications', 'mad', 'urlPrefix', '' );
    }

    public function createDispatcher(  ) {
        return new madHttpDispatcher();
    }
    # }}}    
    static public function instance(  ) { # {{{ singleton
        return self::$instance;
    }
    # }}}
    # {{{ registry
    /**
     * Register an object in the registry.
     *
     * Avoid acronyms. For example:
     * <code>
     * // bad:
     * $this->db = new PDO( $parameters );
     *
     * // acceptable:
     * $this->pdo = new PDO( $parameters );
     *
     * // too long:
     * $this->persistentDataObject = new PDO( $parameters );
     *
     * // good:
     * $this->database = new PDO( $parameters );
     * </code>
     * 
     * @param string $name 
     * @param object $instance 
     * @return void
     */
    public function __set( $name, $instance ) {
        $this->registry[$name] = $instance;
    }
    
    public function __isset( $name ) {
        return array_key_exists( $name, $this->registry );
    }

    /**
     * Gets an object from the registry.
     *
     * <code>
     * $this->database; // whatever was set to $this->database earlier
     * </code>
     * 
     * @param string $name Name with which the instance was registered.
     * @return object
     */
    public function __get( $name ) {
        $createMethod = 'create' . ucfirst( $name );

        if ( !isset( $this->registry[$name] ) && method_exists( $this, $createMethod ) ) {
            $this->registry[$name] = $this->$createMethod(  );
        }
        return $this->registry[$name];
    }

    static public function get( $name ) {
        $registry = self::instance();
        return $registry->$name;
    }
    # }}}

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

    static public function getPath( $group, $section, $name ) {
        $cfg = madFramework::instance()->configuration;
        return $cfg->getPathSetting( $group, $section, $name );
    }

    static public function &dictionnaryReplace( &$string, $dictionnary = array() ) {
        $finalDictionnary = array(  );

        if ( method_exists( $dictionnary, 'flatten' ) ) {
            // don't pollute argument
            $dictionnary = clone $dictionnary;
            $dictionnary->flatten( false );
        }

        foreach( $dictionnary as $key => $value ) {
            if ( is_object( $value ) && !method_exists( $value, '__toString' ) ) {
                continue;
            }

            $finalDictionnary["%($key)s"] = (string) $value;
        }

        $string = str_replace( 
            array_keys( $finalDictionnary ), 
            array_values( $finalDictionnary ), 
            $string
        );

        return $string;
    }

    static public function slugify( $string ) {
        $slug = preg_replace('~[^\\pL\d]+~u', '-', $string );
        $slug = trim($slug, '-');
        $slug = iconv('utf-8', 'us-ascii//TRANSLIT', $slug);
        // lowercase
        $slug = strtolower($slug);
        // remove unwanted characters
        $slug = preg_replace('~[^-\w]+~', '', $slug);

        if ( strlen( $slug ) > 100 ) {
            $slug = substr( $slug, 0, 100 );
        }

        return $slug;
    }

    static public function url( $name, $arguments = array(  ) ) { 
        $framework = madFramework::instance(  );
        $prefix = $framework->configuration->getSetting( 'applications', 'mad', 'urlPrefix' );
        return $prefix . $framework->router->generateUrl( $name, (array) $arguments );
    }

    static public function query( $sql, $arguments = null ) {
        if (is_null($arguments)) {
            return madFramework::instance(  )->pdo->query( $sql )->fetchAll( PDO::FETCH_ASSOC );
        } else {
            $statement = madFramework::instance(  )->pdo->prepare( $sql );

            self::pdoExecute( $statement, $arguments, $sql );

            $rows = $statement->fetchAll( PDO::FETCH_ASSOC );
            return $rows;
        }
    }

    static public function pdoExecute( $statement, $arguments, $sql = null ) {
        if (is_object($arguments)) {
            $arguments = (array) $arguments;
        } else {
            // copy
            $arguments = $arguments;
        }

        $sql = is_null( $sql ) ? $statement->queryString : $sql;

        foreach( array_keys($arguments) as $key) {
            if (strpos( $sql, ":$key" ) === false) {
                unset($arguments[$key]);
            }
        }

        $statement->execute( $arguments );
        return $statement;
    }

    static public function translate( $key, $dictionnary = array(), $contexts = array() ) {
        $framework = madFramework::instance();
        $locale = $framework->locale;

        if ( empty( $framework->languages ) ) {
            $framework->languages = $framework->request->accept->languages;
            $framework->languages[] = $framework->configuration['applications']['mad']['defaultLanguage'];
        }

        $contexts = array_merge( $framework->result->variables['contexts'], $contexts );
        $contexts[] = 'default';

        $message = $key;

        foreach( $framework->languages as $language ) {
            if ( !isset( $framework->locale[$language] ) ) {
                continue;
            }

            foreach( $contexts as $context ) {
                if ( !isset( $framework->locale[$language][$context] ) ) {
                    continue;
                }

                if ( isset( $framework->locale[$language][$context][$key] ) ) {
                    $message = $framework->locale[$language][$context][$key];
                    break;
                }
            }
        }

        // workaround whatever php bug during crunch
        if ( empty( $dictionnary ) ) $dictionnary = array();

        return madFramework::dictionnaryReplace( $message, $dictionnary );
    }

    static public function copyRecursive( $source, $destination, $depth = -1, $dirMode = 0775, $fileMode = 0664 )
    {
        // Skip non readable files in source directory
        if ( !is_readable( $source ) ) {
            return;
        }

        if ( strpos( $source, '.svn' ) !== false ) {
            return;
        } elseif ( is_dir( $source ) && !is_dir( $destination ) ) {
            mkdir( $destination );
            // To ignore umask, umask() should not be changed with
            // multithreaded servers...
            chmod( $destination, $dirMode );
        } elseif ( is_file( $source ) ) {
            copy( $source, $destination );
            chmod( $destination, $fileMode );
        }

        if ( ( $depth === 0 ) ||
            ( !is_dir( $source ) ) ) {
            // Do not recurse (any more)
            return;
        }

        // Recurse
        $dh = opendir( $source );
        while ( ( $file = readdir( $dh ) ) !== false ) {
            if ( ( $file === '.' ) ||
                ( $file === '..' ) ) {
                continue;
            }

            self::copyRecursive(
                $source . '/' . $file,
                $destination . '/' . $file,
                $depth - 1, $dirMode, $fileMode
            );
        }
    }

    # {{{ signals
    public $signals;
    /**
     * List of callbacks connected to a signal.
     * 
     * @var array(string=>callback)
     */
    public function connectSignal( $name, $callback ) {
        if ( !isset( $this->signals[$name] ) ) {
            $this->signals[$name] = array(  );
        }

        $this->signals[$name][] = $callback;
    }
    public function sendSignal( $signal, array $arguments = array() ) {
        if ( !isset( $this->signals[$signal] ) ) {
            return true;
        }

        if ( !count( $this->signals[$signal] ) ) {
            return true;
        }

        $return = true;

        foreach( $this->signals[$signal] as $callback ) {
            $result = call_user_func_array( $callback, $arguments );

            if ( !$result ) {
                $return = false;
            }
        }

        return $result;
    }
    # }}}

    static public function cacheGet( $key ) {
        $key = str_replace( ' ', '_', strtolower( $key ) );
        $cachePath = ENTRY_APP_PATH . '/cache/' . $key . '.php';

        if ( !file_exists( $cachePath) ) {
            return false;
        }

        return include ENTRY_APP_PATH . '/cache/' . $key . '.php';
    }

    static public function cacheStore( $key, $value ) {
        $key = str_replace( ' ', '_', strtolower( $key ) );
        $file = ENTRY_APP_PATH . '/cache/' . $key . '.php';
        $php = '<?php return ' . var_export( $value, true ) . ';';
        file_put_contents( $file, $php );
    }
}
