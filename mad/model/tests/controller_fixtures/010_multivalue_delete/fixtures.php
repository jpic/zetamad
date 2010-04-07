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

$request                                            = new ezcMvcRequest(  );
$request->protocol                                  = 'http-post';
$request->variables['form']                         = 'profile';
$request->variables['id']                           = '1FDB6574-3E40-11DF-8BB4-1B969F5BE980';
$request->variables['successRoute']                 = 'profile.details';
$request->variables['profile']                      = array(  );
$request->variables['profile']['name']              = 'james';
$request->variables['profile']['products'][0]       = '1';
$request->variables['profile']['products'][1]       = '4';
$request->variables['profile']['products'][2]       = '9';
$request->variables['profile']['products.DELETE'][] = '1';
                                                     
$form = new madBase( array( 
    'id'        => '1FDB6574-3E40-11DF-8BB4-1B969F5BE980',
    'name'      => 'james',
    'namespace' => 'profile',
    'products'  => new madBase( array( 
        0 => '1',
        // value of offset 1 was deleted
        2 => '9',
    ) ),
) );
$form->name = 'profile';

return array( $options, $request, $form );
?>
