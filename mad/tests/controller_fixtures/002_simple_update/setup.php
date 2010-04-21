<?php
$model = madRegistry::instance(  )->model;

$model->save( new madObject( array( 
    'title'     => 'tiponch',
    'namespace' => 'recipe',
) ) );
?>
