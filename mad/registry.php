<?php
/**
 * File containing the madRegistry class.
 * 
 * @package MadRegistry
 * @version //autogen//
 * @copyright Copyright (C) 2010-2011 madeleinemarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
/**
 * This class is responsible for containing references to objects which are 
 * required in several different scopes.
 *
 * For example, if a 'database' is set during bootstrap, it can be accessed 
 * later through the registry.
 *
 * Example usage:
 * <code>
 * $registry = madRegistry::instance();
 * $registry->database = new PDO( $pdoParameters );
 * </code>
 * 
 * @package MadRegistry
 * @version //autogen//
 */
class madRegistry {
    /**
     * Array of objects.
     * 
     * @var array
     */
    private $registry = array(  );

    /**
     * Singleton instance.
     */
    private static $instance = null;
    
    /**
     * Prevent from *not* using the singleton instance() method.
     * 
     * @return void
     */
    final private function __construct(  ) {
    }

    /**
     * Return always the same instance of madRegistry.
     * 
     * @return madRegistry
     */
    static public function instance(  ) {
        if ( !self::$instance ) {
            self::$instance = new madRegistry;
        }
        return self::$instance;
    }

    /**
     * Register an object in the registry.
     *
     * Avoid acronyms. For example:
     * <code>
     * // bad:
     * $registry->db = new PDO( $parameters );
     *
     * // acceptable:
     * $registry->pdo = new PDO( $parameters );
     *
     * // too long:
     * $registry->persistentDataObject = new PDO( $parameters );
     *
     * // good:
     * $registry->database = new PDO( $parameters );
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
        return array_key_exists( $name, $array );
    }

    /**
     * Gets an object from the registry.
     *
     * <code>
     * $registry->database; // whatever was set to $registry->database earlier
     * </code>
     * 
     * @param string $name Name with which the instance was registered.
     * @return object
     */
    public function __get( $name ) {
        $createMethod = $this, 'create' . ucfirst( $name );

        if ( isset( $this->registry[$name] ) && method_exists( $createMethod ) ) {
            $this->registry[$name] = $this->$createMethod(  );
        }
        return $this->registry[$name];
    }

    // starting here we start coupling the framework
    public function createDispatcher(  ) {
        $dispatcher = new madHttpDispatcher(
            $registry->configuration,
            $registry->signals
        );
    }
}

?>
