<?php
$model = madRegistry::instance(  )->model;

$model->save( new madBase( array( 
    'name'      => 'james',
    'namespace' => 'profile',
    'products'  => new madBase( array( 
        1,
        2,
        3,
    ) ),
) ) );
?>
