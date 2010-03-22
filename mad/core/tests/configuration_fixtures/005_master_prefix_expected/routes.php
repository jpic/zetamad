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
        'filter__namespace' => 'recipe',
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
        'filter__namespace' => 'profile',
      ),
      'application' => 'profiles',
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
