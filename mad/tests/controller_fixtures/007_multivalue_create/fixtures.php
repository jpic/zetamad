<?php

$options = array (
    'label' => 'save a profile',
    'fields' => array (
        'namespace' =>  array (
            'value' => 'profile',
        ),
        'name' =>  array (
            'label'    => 'user name',
            'required' => true,
        ),
    ),
    'multipleFields' =>  array (
        'products' => array (
            'label'  => 'favorite products',
            'widget' => array( 
                'class' => 'multiple values',
            ),
        ),
    ),
);

$request                                      = new ezcMvcRequest(  );
$request->protocol                            = 'http-post';
$request->variables['form']                   = 'profile';
$request->variables['successRoute']           = 'profile.details';
$request->variables['profile']                = array(  );
$request->variables['profile']['name']        = 'james';
$request->variables['profile']['products'][0] = 123;
                                                        
$form = new madObject( array( 
    'id'        => '1FDB6574-3E40-11DF-8BB4-1B969F5BE980',
    'name'      => 'james',
    'namespace' => 'profile',
    'products'  => new madObject( array( 
        '123',
    ) ),
) );
$form->name = 'profile';

return array( $options, $request, $form );
?>
