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
 *
 * @credit Aikar@irc.freenode.net##php parse_ini_file works on 5.3
 */
class madConfiguration implements ArrayAccess, Iterator, Countable {
    public $path = null;

    public function __construct( $path, array &$applicationsConfiguration = null ) {
        $this->path = $path;

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

        // discover paths to applications in configured repositories
        foreach( $this['applications'][$entryApplicationName]['applicationRepositories'] as $path ) {
            // prepend / if necessary
            $path = $path[0] == '/' ? $path : '/' . $path;
            // prepend application path and get the absolute path
            $path = realpath( $entryApplicationPath . $path );

            // find all configuration paths in this repository path
            $find = shell_exec( "find $path -name etc -type d \! -path \"*/tests/*\" \! -path \"*/cache/*\"" );
            // trim shell output
            $find = trim( $find );

            foreach( explode( "\n", $find ) as $configurationPath ) {
                // strip trailing / if necessary
                $configurationPath = substr( $configurationPath, -1 ) == '/' ? substr( $configurationPath, 0, -1 ) : $configurationPath;

                // get application path
                $applicationPath = realpath( $configurationPath . '/..' );

                // get current application name
                $applicationName = substr( $applicationPath, strrpos( $applicationPath, '/' ) + 1 );

                // skip uninstalled applications
                if ( !in_array( $applicationName, array_keys( $this['applications'] ) ) ) continue;
                
                // fetch configuration of the application
                $applicationConfiguration = new madConfiguration( $applicationPath . '/etc' );

                // save application "path" for later use
                $this->container['applications'][$applicationName]['path'] = $applicationPath;

                // contribute to this configuration
                $this->merge( $applicationConfiguration->getArray(  ) );
             }
        }
        die( 'lol2' );
    }

    public function write( $cacheDirectory ) {
        foreach( $this as $name => $array ) {
            $body = sprintf(
                '<?php return %s ?>',
                var_export( $array, true )
            );

            $target = $cacheDirectory . "/$name.php";
            file_put_contents( $target, $body );
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

    public function merge( array $contributor ) {
        $this->container = self::array_contribute( $this->container, $contributor );
    }

    public function &getArray(  ) {
        return $this->container;
    }

    // {{{ basic implementation of countable, traversable and arrayaccess
    public $container = array();

    public function offsetSet($offset,$value) {
        $this->container[$offset] = $value;
    }

    public function offsetExists($offset) {
     return isset($this->container[$offset]);
    }

    public function offsetUnset($offset) {
        unset($this->container[$offset]);
    }

    public function offsetGet($offset) {
        return isset($this->container[$offset]) ? $this->container[$offset] : null;
    }

    public function rewind() {
        reset($this->container);
    }

    public function current() {
        return current($this->container);
    }

    public function key() {
        return key($this->container);
    }

    public function next() {
        return next($this->container);
    }

    public function valid() {
        return $this->current() !== false;
    }   

    public function count() {
        return count($this->container);
    }
    // }}}
    
    public function getSetting( $group, $section, $name, $default = null ) {
        if ( !isset( $this->settings[$group] ) ) {
            return $default;
        }
        
        if ( !isset( $this->settings[$group][$section] ) ) {
            return $default;
        }

        if ( !isset( $this->settings[$group][$section][$name] ) ) {
            return $default;
        }

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

        foreach ( new NoRewindIterator( $parser ) as $element )
        {
            if ( $element instanceof ezcConfigurationIniItem )
            {
                switch ( $element->type )
                {
                    case ezcConfigurationIniItem::GROUP_HEADER:
                        $this[$name][$element->group] = array();
                        break;

                    case ezcConfigurationIniItem::SETTING:
                        eval( '$this[$name][$element->group][$element->setting]'. $element->dimensions. ' = $element->value;' );
                        break;
                }
            }
            if ( $element instanceof ezcConfigurationValidationItem )
            {
                throw new ezcConfigurationParseErrorException( $element->file, $element->line, $element->description );
            }
        }

        var_dump( $name, $this[$name] );
    }

    public function parsePhp( $file ) {
        $name = substr( substr( $file, strrpos( $file, '/' ) + 1 ), 0, -4 );
        $this[$name] = require $file;
    }
}

?>
