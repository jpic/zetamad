<?php

abstract class madController extends ezcMvcController {
    public $configuration = array(  );
    public $registry = null;
    public $controllers = array(  );
    public $composite = null;
    
    public function __construct( $action, ezcMvcRequest $request, &$configuration = null ) {
        parent::__construct( $action, $request );
        $this->registry = madRegistry::instance(  );
        $this->configuration =& $configuration;
    }

    public function compose( $name, $controller ) {
        $controller->composite = $this;
        $this->controllers[$name] = $controller;
    }

    public function createResult() {
        foreach( $this->controllers as $controller ) {
            $result = $controller->preCreateResult(  );

            if ( $result instanceof ezcMvcResult ) {
                break;
            }
        }
        
        if ( ! isset( $result ) || ! $result instanceof ezcMvcResult ) {
            $result = parent::createResult(  );
        }

        foreach( $this->controllers as $controller ) {
            $controller->postCreateResult( $result );
        }

        return $result;
    }

    public function preCreateResult(  ) {
        return false;
    }

    public function postCreateResult( $result ) {
        return false;
    }
}


?>
