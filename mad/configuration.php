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
    public function __construct( $path, &$applicationsConfiguration = null ) {
        $this->path   = $path;

        if ( $applicationsConfiguration ) {
            $this['applications'] = $applicationsConfiguration;
        }
    }

    public function reset() {
        if ( isset( $this->reseted ) ) {
            return parent::reset();
        }

        $files = glob( "{$this->path}/*" );

        if ( !$files ) {
            return true;
        }

        foreach( $files as $file ) {
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

        $this->reseted = true;

        return parent::reset();
    }

    public function offsetGet( $key ) {
        if ( parent::offsetExists( $key ) ) {
            return parent::offsetGet($key);
        }

        if ( file_exists( "$this->path/$key.php" ) ) {
            $this->parsePhp( "$this->path/$key.php" );
        } elseif ( file_exists( "$this->path/$key.ini" ) ) {
            $this->parseIni( "$this->path/$key.ini" );
        } else {
            trigger_error( "Cannot find configuration for $key in $this->path", E_USER_ERROR );
        }

        return parent::offsetGet( $key );
    }

    public function refreshApplications( $entryApplicationPath, $subdir = 'etc' ) {
        // figure the entry application name
        $entryApplicationName = substr( $entryApplicationPath, strrpos( $entryApplicationPath, '/' ) + 1 );

        // save entry app repositories and installed applications because 'applications' 
        // will be emptied
        $repositories = $this['applications'][$entryApplicationName]['applicationRepositories'];
        
        // clean applications configuration
        $this['applications'] = new madObject();

        // find all configuration paths in this repository path
        $applicationPaths = array(  );

        if ( defined( 'RecursiveDirectoryIterator::FOLLOW_SYMLINKS' ) ) {
            $flags = RecursiveDirectoryIterator::FOLLOW_SYMLINKS|RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
        } else { // php 5.2.6 support
            $flags = RecursiveIteratorIterator::LEAVES_ONLY|RecursiveIteratorIterator::SELF_FIRST;
        }

        // discover paths to applications in configured repositories
        foreach( $repositories as $path ) {
            // prepend application path and get the absolute path
            $path = $entryApplicationPath . '/' . $path;
            $fileIterator = new RecursiveIteratorIterator( new RecursiveDirectoryIterator( 
                $path,
                $flags
            ) );

            foreach( $fileIterator as $fileInfo ) {
                $filePath = madFramework::fixPath( realpath( $fileInfo->getPath(  ) ) );
                
                // searching for directories named etc
                if ( substr( $filePath, -3 ) != $subdir ) {
                    continue;
                }
                
                $relativePath = madFramework::getRelativePath( $filePath, $path );
                
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

                // get current application path
                $applicationPath = substr( $filePath, 0, strrpos( $filePath, '/'. $subdir ) );

                // get current application name
                $applicationName = substr( $applicationPath, strrpos( $applicationPath, '/' ) + 1 );

                // don't add paths twice
                if ( in_array( $applicationName, array_keys( $applicationPaths ) ) ) {
                    continue;
                }

                // store the path because we'll parse application config in the 
                // order of sections in applications.ini
                $this['applications'][$applicationName]['path'] = madFramework::getRelativePath( $applicationPath, $entryApplicationPath );
            }
        }
    }
    public function refresh( $entryApplicationPath, $installedApplications, $subdir = 'etc' ) {
        // applications.ini apps order is from the most specific to the less 
        // specific. Our merge overrides, so configuration must be parsed from 
        // the less specific to the most specific
        foreach( array_reverse( $installedApplications ) as $applicationName ) {
            $applicationPath = $this['applications'][$applicationName]['path'];
            
            // entry app has its relative path empty, hence this change to 
            // avoid getting $entryApplicationPath//foo.ini
            if ( $applicationPath ) {
                $applicationPath .= '/';
            }

            $files = glob( "$entryApplicationPath/$applicationPath{$subdir}/*.ini" );

            if ( !$files ) {
                continue;
            }

            // fetch and override this application configuration
            foreach( $files as $file ) {
                $this->parseIni( madFramework::fixPath( $file ) );
            }
        }
    }

    public function write( $cacheDirectory ) {
        foreach( $this as $name => $object ) {
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
            $this->offsetGet( $group );
        }
        
        if ( isset( $this[$group] ) && isset( $this[$group][$section] ) && isset( $this[$group][$section][$name] ) ) {
            return $this[$group][$section][$name];
        }

        if ( !is_null( $default ) ) {
            return $default;
        }

        trigger_error( "Setting [$group][$section][$name] does not exist, and no default setting was set.", E_USER_ERROR );
    }

    public function getClassApplicationName( $className ) {
        foreach( $this['applications'] as $name => $settings ) {
            if ( isset( $settings['classes'] ) && in_array( $className, $settings['classes'] ) ) {
                return $name;
            }
        }

        throw new Exception( "Cannot find the name of the application containing class $className, does it contain a $subdir subdir?" );
    }

    public function getPathSetting( $group, $section, $name ) {
        $path = $this->getSetting( $group, $section, $name );

        $realPath = ENTRY_APP_PATH . '/' . $path;

        if ( !$realPath ) {
            trigger_error( "Configured path deos not exists $path" );
        }

        return $realPath;
    }

    public function parseIni( $file ) {
        preg_match( '@/(?P<appName>[^/]+)/(?P<subdir>[^/]+)/(?P<name>[^/]+)\.ini$@', $file, $matches );
        $name = $matches['name'];
        $appName = $matches['appName'];
        
        $parser = new ezcConfigurationIniParser( ezcConfigurationIniParser::PARSE, $file );

        if ( !isset( $this[$name] ) ) {
            $this[$name] = new madObject();
        }

        $unsetGroups = array(  );

        foreach( new NoRewindIterator( $parser ) as $element ) {
            if ( $element instanceof ezcConfigurationIniItem ) {
                switch ( $element->type ) {
                    case ezcConfigurationIniItem::GROUP_HEADER:
                        if ( !isset( $this[$name] ) ) {
                            $this[$name] = new madObject();
                        }
                        
                        if ( !isset( $this[$name][$element->group] ) ) {
                            $this[$name][$element->group] = new madObject();
                            $this[$name][$element->group]['META'] = array(
                                'application' => $appName,
                            );
                        }

                        // a little heavy on performances, but its the safest 
                        if ( strpos( $element->group, '..' ) ) {
                            $groupParts = explode( '..', $element->group );
                            $realGroup = array_shift( $groupParts );

                            // hardlink the real group to its false name for 
                            // the parsed variables to be set in both.
                            $this[$name][$realGroup] = $this[$name][$element->group];

                            // the configuration section with the false name 
                            // will be dereferenced later.
                            $unsetGroups[] = $element->group;

                            // the order of parents should be defined from 
                            // the most specific to the less specific, but our 
                            // merge does override, so the order is reversed to 
                            // start by the least specific.
                            foreach( array_reverse( $groupParts ) as $parentGroup ) {
                                if ( !isset($this[$name])) {
                                    $this[$name] = new madObject();
                                }
                                if ( !isset( $this[$name][$parentGroup] ) ) {
                                    trigger_error( "Can't inherit from a section that was not defined! Happenned with: " . $element->group, E_USER_ERROR );
                                }

                                $this[$name][$realGroup]->merge( $this[$name][$parentGroup] );
                            }
                        }
                        break;
                    case ezcConfigurationIniItem::SETTING:
                        eval( '$this[$name][$element->group][$element->setting]'. $element->dimensions . ' = $element->value;' );
                        break;
                }
            }
            if ( $element instanceof ezcConfigurationValidationItem ) {
                throw new ezcConfigurationParseErrorException( $element->file, $element->line, $element->description );
            }
        }

        foreach( $unsetGroups as $group ) {
            unset( $this[$name][$group] );
        }

        madFramework::fixPathArray( $this[$name] );
    }

    public function parsePhp( $file ) {
        $name = substr( substr( $file, strrpos( $file, '/' ) + 1 ), 0, -4 );
        $this[$name] = require $file;
    }

}
