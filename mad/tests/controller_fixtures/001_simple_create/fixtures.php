<?php

$options = array (
    'label' => 'enregistrement de recette',
    'fields' => 
    array (
          'namespace' => 
              array (
                  'value' => 'recipe',
              ),
          'title' => 
              array (
                  'label'    => 'titre de la recette',
                  'required' => true,
              ),
    )
);

$request                               = new ezcMvcRequest(  );
$request->protocol                     = 'http-post';
$request->variables['form']            = 'recipe';
$request->variables['successRoute']    = 'recipe.details';
$request->variables['recipe']          = array(  );
$request->variables['recipe']['title'] = 'tiponch';

$form = new madObject( array( 
    'title'     => 'tiponch',
    'namespace' => 'recipe',
    'id'        => '1FDB6574-3E40-11DF-8BB4-1B969F5BE980',
) );
$form->name = 'recipe';

return array( $options, $request, $form );
?>