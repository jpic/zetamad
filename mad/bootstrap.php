<?php

$registry = madRegistry::instance(  );

function setRegistryRouter( $router ) {
    madRegistry::instance(  )->router = $router;
}

$registry->signals->connect( 'routerCreated', 'setRegistryRouter' );

?>
