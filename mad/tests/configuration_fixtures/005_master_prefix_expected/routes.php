<?php
return array (
  'settings' => 
  array (
    'recipe.list' => 
    array (
      'controller' => 'someTestController',
      'args' => 
      array (
        'filter__foo' => 'bar',
        'filter' => 
        array (
          'namespace' => 'recipe',
        ),
      ),
      'application' => 'MASTER',
      'action' => 'list',
      'rails' => '/list',
    ),
    'profile.list' => 
    array (
      'controller' => 'madCrud',
      'action' => 'list',
      'rails' => '/list',
      'args' => 
      array (
        'filter' => 
        array (
          'namespace' => 'profile',
        ),
      ),
      'application' => 'profiles',
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
