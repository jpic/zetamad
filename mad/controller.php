<?php

abstract class madController extends ezcMvcController {
    public $configuration = array(  );

    public $registry = null;
    
    public function __construct( $action, ezcMvcRequest $request ) {
        parent::__construct( $action, $request );
        $this->registry = madRegistry::instance(  );
    }

    public function setConfiguration( array &$configuration ) {
        $this->configuration =& $configuration;
    }
}


?>
