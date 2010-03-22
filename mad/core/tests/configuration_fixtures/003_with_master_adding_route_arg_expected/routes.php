<?php
return array (
  'settings' => 
  array (
    'recipe.list' => 
    array (
      'arguments' => 
      array (
        'filter__foo' => 'bar',
        'filter__namespace' => 'recipe',
      ),
      'application' => 'MASTER',
      'controller' => 'madCrud',
      'action' => 'list',
      'rails' => '/list',
    ),
    'profile.list' => 
    array (
      'controller' => 'madCrud',
      'action' => 'list',
      'rails' => '/list',
      'arguments' => 
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
