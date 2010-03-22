<?php
return array (
  'settings' => 
  array (
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
    'recipe.list' => 
    array (
      'controller' => 'madCrud',
      'action' => 'list',
      'rails' => '/list',
      'arguments' => 
      array (
        'filter__namespace' => 'recipe',
      ),
      'application' => 'recipe',
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
