<?php

abstract class madControllerDecorator extends madController {
    public $decorated = null;

    public function decorate( ezcMvcController $controller ) {
        $this->decorated = $controller;
    }

    public function createResult(  ) {
        return $this->decorated->createResult();
    }
    
    public function setConfiguration( array &$configuration ) {
        parent::setConfiguration( $configuration );
        $this->decorated->setConfiguration( $configuration );
    }
}

?>
