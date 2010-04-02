<?php

$options = array (
    'label' => 'save a recipe',
    'fields' => array (
        'namespace' =>  array (
            'value' => 'recipe',
        ),
        'title' =>  array (
            'label'    => 'recipe title',
            'required' => true,
        ),
    ),
    'formsets' =>  array (
        'ingredients' => array (
            'label'  => 'recipe ingredients',
            'fields' => array (
                'namespace' => array (
                    'value' => 'ingredient',
                ),
                'name' =>  array (
                    'label' => 'name',
                ),
                'quantity' => array (
                    'label' => 'quantity',
                ),
            ),
        ),
    ),
);

$request                               = new ezcMvcRequest(  );
$request->protocol                     = 'http-post';
$request->variables['form']            = 'recipe';
$request->variables['recipe']          = array(  );
$request->variables['recipe']['title'] = 'tiponch';
$request->variables['recipe']['ingredients'] = array(  );
$request->variables['recipe']['ingredients'][0] = array(  );
$request->variables['recipe']['ingredients'][0]['name']     = 'lime';
$request->variables['recipe']['ingredients'][0]['quantity'] = 'few';
$request->variables['recipe']['ingredients'][1] = array(  );
$request->variables['recipe']['ingredients'][1]['name']     = 'rhum';
$request->variables['recipe']['ingredients'][1]['quantity'] = 'much';

$form = new madBase( array( 
    'title'     => 'tiponch',
    'namespace' => 'recipe',
    'id'        => 'NOTEST',
    'ingredients' => new madBase( array( 
        new madBase( array( 
            'id'       => 'NOTEST',
            'name'     => 'lime',
            'quantity' => 'few',
        ) ),
        new madBase( array( 
            'id'       => 'NOTEST',
            'name'     => 'rhum',
            'quantity' => 'much',
        ) ),       
    ) ),
) );
$form->name = 'recipe';

return array( $options, $request, $form );
?>
