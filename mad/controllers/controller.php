<?php

abstract class madController extends ezcMvcController {
    public $configuration = array(  );
    public function setConfiguration( array $configuration ) {
        $this->configuration = $configuration;
    }
}


?>
