<?php
$model = madRegistry::instance(  )->model;

$model->save( new madBase( array( 
    'title'     => 'tiponch',
    'namespace' => 'recipe',
) ) );
?>
