<?php

abstract class madController extends ezcMvcController {
    public $configuration = array(  );
    public $registry = null;
    public $controllers = array(  );
    public $composite = null;
    public $result = null;
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
        $this->result = new ezcMvcResult;
        $this->result->content = new ezcMvcResultContent;
        
        foreach( $this->controllers as $controller ) {
            $ready = $controller->preCreateResult(  );

            if ( $ready ) {
                break;
            }
        }
        
        if ( ! $ready ) {
            $result = parent::createResult(  );
        }

        foreach( $this->controllers as $controller ) {
            $controller->postCreateResult(  );
        }

        return $this->result;
    }

    public function preCreateResult(  ) {
        return false;
    }

    public function postCreateResult(  ) {
    }
}


?>
