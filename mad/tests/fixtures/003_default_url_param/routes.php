<?php

return array (
    'settings' => array (
        'recipe.list' => array (
            'rails' => '/list',
            'controller' => 'fooControllerMock',
            'action' => 'list',
            'application' => 'recipe',
            'arguments' => array( 
                'filter__category' => 'default category',
            )
        ), 
    ),
    'comments' => array (
    ),
);

?>
