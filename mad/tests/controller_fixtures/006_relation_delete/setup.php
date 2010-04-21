<?php
$model = madRegistry::instance(  )->model;

$model->save( new madBase( array( 
    'title'       => 'tiponch',
    'namespace'   => 'recipe',
    'ingredients' => new madBase( array( 
        new madBase( array( 
            'name'     => 'lime',
            'quantity' => 'few',
        ) ),
        new madBase( array( 
            'name'     => 'rhum',
            'quantity' => 'much',
        ) ),
    ) ),
) ) );
?>
