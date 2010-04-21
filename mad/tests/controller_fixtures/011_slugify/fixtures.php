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
        'slug' => array( 
            'slugify' => 'title'
        ),
    ),
);

$request                               = new ezcMvcRequest(  );
$request->protocol                     = 'http-post';
$request->variables['form']            = 'recipe';
$request->variables['successRoute']    = 'recipe.details';
$request->variables['recipe']          = array(  );
$request->variables['recipe']['title'] = 'TiPonch\'ôéûà';

$form = new madObject( array( 
    'title'     => 'TiPonch\'ôéûà',
    'namespace' => 'recipe',
    'id'        => '1FDB6574-3E40-11DF-8BB4-1B969F5BE980',
    'slug'      => 'tiponch-oeua',
) );
$form->name = 'recipe';

return array( $options, $request, $form );
?>
