<?php

$registry = madRegistry::instance(  );

function setRegistryRouter( $router ) {
    $registry->router = $router;
}

$registry->signals->connect( 'routerCreated', 'setRegistryRouter' );

?>
