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
$request->variables['recipe']          = array(  );
$request->variables['recipe']['title'] = 'tiponch';

$form = new madBase( array( 
    'title'     => 'tiponch',
    'namespace' => 'recipe',
    'id'        => 'NOTEST',
) );
$form->name = 'recipe';

return array( $options, $request, $form );
?>
