<?php
$model = madRegistry::instance(  )->model;

$model->save( new madObject( array( 
    'name'      => 'james',
    'namespace' => 'profile',
    'products'  => new madObject( array( 
        1,
        2,
        3,
    ) ),
) ) );
?>
