<?php
/**
 * File containing the madSignals class.
 * 
 * @package Mad
 * @version //autogen//
 * @copyright Copyright (C) 2010-2011 madeleinemarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
/**
 * madSignals is an implementation of the Signal/Slot design pattern.
 *
 * Usage:
 * <code>
 * $signals = new madSignals();
 *
 * function fooBar( $arg ) {
 *     echo $arg;
 * }
 *
 * $signals->connect( 'foo', 'fooBar' );
 *
 * $signals->send( 'foo', array( 'test' ) ); // will echo 'test'
 * </code>
 * 
 * @package Mad
 * @author James Pic <jamespic@gmail.com> 
 */
class madSignals {
    /**
     * List of callbacks connected to a signal.
     * 
     * @var array(string=>callback)
     */
    protected $signals;

    /**
     * Connect a signal with a callback.
     * 
     * @param string $signal 
     * @param mixed $callback 
     * @return void
     */
    public function connect( $signal, $callback ) {
        if ( !is_string( $signal ) ) {
            trigger_error( "\$signal is not a string" );
        }

        if ( !isset( $this->signals[$signal] ) ) {
            $this->signals[$signal] = array(  );
        }
        
        $this->signals[$signal][] = $callback;
    }
    
    /**
     * Send a signal with arguments, will execute all connected callbacks with 
     * the given arguments list.
     * 
     * @param mixed $signal 
     * @param array $arguments 
     * @return false if a connected callback returned false.
     */
    public function send( $signal, array $arguments = array(  ) ) {
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
}

?>
