<?php

class madSignals {
    protected $signals;

    public function connect( $signal, $callback ) {
        if ( !isset( $this->signals[$signal] ) ) {
            $this->signals[$signal] = array(  );
        }
        
        $this->signals[$signal][] = $callback;
    }
    
    public function send( $signal, array $arguments = array(  ) ) {
        if ( !isset( $this->signals[$signal] ) ) {
            return true;
        }

        if ( !count( $this->signals[$signal] ) ) {
            return true;
        }

        foreach( $this->signals[$signal] as $callback ) {
            call_user_func_array( $callback, $arguments );
        }
    }
}

?>
