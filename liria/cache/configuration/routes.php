<?php
return array (
  'settings' => 
  array (
    'recipe.list' => 
    array (
      'rails' => '/recipe/list/',
      'controller' => 'madModelController',
      'action' => 'list',
      'arguments' => 
      array (
        'filter__namespace' => 'recipe',
      ),
      'application' => 'recipe',
    ),
    'recipe.create' => 
    array (
      'rails' => '/recipe/create/',
      'controller' => 'madModelController',
      'action' => 'form',
      'application' => 'recipe',
    ),
    'recipe.edit' => 
    array (
      'rails' => '/recipe/edit/:id/',
      'controller' => 'madModelController',
      'action' => 'form',
      'application' => 'recipe',
    ),
    'recipe.details' => 
    array (
      'rails' => '/recipe/details/:id/',
      'controller' => 'madModelController',
      'action' => 'details',
      'application' => 'recipe',
    ),
    'ci.runtests' => 
    array (
      'rails' => '/ci/runtests/',
      'controller' => 'madCiController',
      'action' => 'runtests',
      'application' => 'ci',
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
