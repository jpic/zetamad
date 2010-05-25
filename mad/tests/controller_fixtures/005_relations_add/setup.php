<?php
$model = madFramework::instance(  )->model;

$model->save( new madObject( array( 
    'title'       => 'tiponch',
    'namespace'   => 'recipe',
    'ingredients' => new madObject( array( 
        new madObject( array( 
            'name'     => 'lime',
            'quantity' => 'few',
        ) ),
        new madObject( array( 
            'name'     => 'rhum',
            'quantity' => 'much',
        ) ),
    ) ),
) ) );
?>
