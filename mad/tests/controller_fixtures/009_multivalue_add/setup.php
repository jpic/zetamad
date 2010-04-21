<?php
$model = madRegistry::instance(  )->model;

$fixture = new madObject( array( 
    'name'      => 'james',
    'namespace' => 'profile',
    'products'  => new madObject( array( 
        1,
    ) ),
) );

$model->save( $fixture );
?>
