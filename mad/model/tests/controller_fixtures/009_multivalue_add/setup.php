<?php
$model = madRegistry::instance(  )->model;

$fixture = new madBase( array( 
    'name'      => 'james',
    'namespace' => 'profile',
    'products'  => new madBase( array( 
        1,
    ) ),
) );

$model->save( $fixture );
?>
