<?php
$model = madFramework::instance(  )->model;

$model->save( new madObject( array( 
    'title'     => 'tiponch',
    'namespace' => 'recipe',
) ) );
?>
