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
 *
 * FEATURE FROZEN WARNING
 *
 * You shall not edit this file before it is automatically tested.
 *
 *
 * @package MadConfiguration
 * @version //autogen//
 *
 * @credit Aikar@irc.freenode.net##php parse_ini_file works on 5.3
 */
class madConfiguration extends madObject {
    public function __construct( $path, array &$applicationsConfiguration = null ) {
        $this->path    = $path;

        if ( $applicationsConfiguration ) {
            $this['applications'] = $applicationsConfiguration;
        }

        foreach( glob( "{$this->path}/*" ) as $file ) {
            // filename without extension
            $name = substr( substr( $file, strrpos( $file, '/' ) + 1 ), 0, -4 );

            // skip applications which is already set
            if ( isset( $this['applications'] ) && $name == 'applications' ) {
                continue;
            }

            switch( substr( $file, -3 ) ) {
                case 'php':
                    $this->parsePhp( $file );
                    break;
                case 'ini':
                    $this->parseIni( $file );
                    break;
                default:
                    continue;
            }
        }
    }

    public function refresh( $entryApplicationPath ) {
        // figure the entry application name
        $entryApplicationName = substr( $entryApplicationPath, strrpos( $entryApplicationPath, '/' ) + 1 );

        // save entry app repositories and installed applications because 'applications' 
        // will be emptied
        $repositories = $this['applications'][$entryApplicationName]['applicationRepositories'];
        $installedApplications = array_keys( (array)$this['applications'] );
        
        // clean applications configuration
        $this['applications'] = new madObject();

        // discover paths to applications in configured repositories
        foreach( $repositories as $path ) {
            // prepend / if necessary
            $path = $path[0] == '/' ? $path : '/' . $path;
            // prepend application path and get the absolute path
            $path = realpath( $entryApplicationPath . $path );

            // find all configuration paths in this repository path
            $configurationPaths = array(  );
            
            $fileIterator = new RecursiveIteratorIterator( new RecursiveDirectoryIterator( $path ) );
            foreach( $fileIterator as $fileInfo ) {
                // searching for directories named etc
                if ( substr( $fileInfo->getPath(  ), -3 ) != 'etc' ) {
                    continue;
                }
                
                $relativePath = madFramework::getRelativePath( $fileInfo->getPath(  ), $path );
                
                // if the relative path contains "tests" then its in unit 
                // tests, skip.
                if ( strpos( $relativePath, 'tests' ) !== false ) {
                    continue;
                }

                // if the relative path contains "cache" then its a cached 
                // configuration, skip
                if ( strpos( $relativePath, 'cache' ) !== false ) {
                    continue;
                }

                // don't add paths twice
                if ( in_array( $fileInfo->getPath(  ), $configurationPaths ) ) {
                    continue;
                }

                $configurationPaths[] = $fileInfo->getPath(  );
            }

            foreach( $configurationPaths as $configurationPath ) {
                // strip trailing / if necessary
                $configurationPath = substr( $configurationPath, -1 ) == '/' ? substr( $configurationPath, 0, -1 ) : $configurationPath;

                // get application path
                $applicationPath = realpath( $configurationPath . '/..' );

                // get current application name
                $applicationName = substr( $applicationPath, strrpos( $applicationPath, '/' ) + 1 );

                // skip uninstalled applications
                if ( !in_array( $applicationName, $installedApplications ) ) continue;

                // fetch configuration of the application
                $applicationConfiguration = new madConfiguration( $applicationPath . '/etc' );

                if ( !isset( $this['applications'][$applicationName] ) ) {
                    $this['applications'][$applicationName] = new madObject;
                }

                // save application "path" for later use
                $this['applications'][$applicationName]['path'] = madFramework::getRelativePath( $applicationPath, $entryApplicationPath );

                // merge to this configuration
                $this->merge( $applicationConfiguration );
             }
        }
    }

    public function write( $cacheDirectory ) {
        foreach( $this as $name => $object ) {
            if ( !is_object( $object ) ) {
                var_dump($name, $object );
            }
            $body = sprintf(
                '<?php return %s ?>',
                var_export( $object->objectsToArray(), true )
            );

            $target = $cacheDirectory . "/$name.php";
            file_put_contents( $target, $body );
        }
    }
    
    public function getSetting( $group, $section, $name, $default = null ) {
        if ( !isset( $this[$group] ) ) {
            return $default;
        }
        
        if ( !isset( $this[$group][$section] ) ) {
            return $default;
        }

        if ( !isset( $this[$group][$section][$name] ) ) {
            return $default;
        }

        return $this[$group][$section][$name];
    }

    public function getClassApplicationName( $className ) {
        foreach( $this['applications'] as $name => $settings ) {
            if ( isset( $settings['classes'] ) && in_array( $className, $settings['classes'] ) ) {
                return $name;
            }
        }

        throw new Exception( "Cannot find the name of the application containing class $className, does it contain a 'etc' subdir?" );
    }

    public function getPathSetting( $group, $section, $name ) {
        $path = $this->getSetting( $group, $section, $name );
        $realPath = realpath( join( DIRECTORY_SEPARATOR, array( 
            ENTRY_APP_PATH,
            $path
        ) ) );

        if ( !$realPath ) {
            trigger_error( "Configured path deos not exists $path" );
        }

        return $realPath;
    }

    public function parseIni( $file ) {
        $parser = new ezcConfigurationIniParser( ezcConfigurationIniParser::PARSE, $file );
        $name = substr( substr( $file, strrpos( $file, '/' ) + 1 ), 0, -4 );

        if ( !isset( $this[$name] ) ) {
            $this[$name] = new madObject();
        }

        foreach( new NoRewindIterator( $parser ) as $element ) {
            if ( $element instanceof ezcConfigurationIniItem ) {
                switch ( $element->type ) {
                    case ezcConfigurationIniItem::GROUP_HEADER:
                        if ( !isset( $this[$name][$element->group] ) ) {
                            $this[$name][$element->group] = new madObject();
                        }
                        break;
                    case ezcConfigurationIniItem::SETTING:
                        eval( '$this[$name][$element->group][$element->setting]'. $element->dimensions. ' = $element->value;' );
                        break;
                }
            }
            if ( $element instanceof ezcConfigurationValidationItem ) {
                throw new ezcConfigurationParseErrorException( $element->file, $element->line, $element->description );
            }
        }
    }

    public function parsePhp( $file ) {
        $name = substr( substr( $file, strrpos( $file, '/' ) + 1 ), 0, -4 );
        $this[$name] = require $file;
    }

    public function renameSection( $name, $newName ) {

    }
}

?>
