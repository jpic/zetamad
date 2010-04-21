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
$request->variables['successRoute']    = 'recipe.details';
$request->variables['id']              = '1FDB6574-3E40-11DF-8BB4-1B969F5BE980';
$request->variables['recipe']          = array(  );
$request->variables['recipe']['title'] = 'tiponch';
$request->variables['recipe']['ingredients'] = array(  );
$request->variables['recipe']['ingredients'][0] = array(  );
$request->variables['recipe']['ingredients'][0]['name']     = 'lime';
$request->variables['recipe']['ingredients'][0]['DELETE']   = true;
$request->variables['recipe']['ingredients'][0]['quantity'] = 'few';
$request->variables['recipe']['ingredients'][1] = array(  );
$request->variables['recipe']['ingredients'][1]['name']     = 'rhum';
$request->variables['recipe']['ingredients'][1]['quantity'] = 'not that much';

$form = new madBase( array( 
    'title'     => 'tiponch',
    'namespace' => 'recipe',
    'id'        => '1FDB6574-3E40-11DF-8BB4-1B969F5BE980',
    'ingredients' => new madBase( array( 
        // relation 0 was deleted
        1 => new madBase( array( 
            'name'     => 'rhum',
            'id'       => '3FDB6574-3E40-11DF-8BB4-1B969F5BE980',
            'quantity' => 'not that much',
            'namespace' => 'ingredient',
        ) ),       
    ) ),
) );
$form->name = 'recipe';

return array( $options, $request, $form );
?>
