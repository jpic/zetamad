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
        'filter' => 
        array (
          'namespace' => 'recipe',
        ),
      ),
      'application' => 'recipe',
    ),
    'recipe.create' => 
    array (
      'rails' => '/recipe/create/',
      'controller' => 'madRecipeController',
      'action' => 'form',
      'arguments' => 
      array (
        'template' => 'recipe_form.php',
        'form' => 'recipe.recipe',
        'successRoute' => 'recipe.details',
      ),
      'application' => 'recipe',
    ),
    'recipe.edit' => 
    array (
      'rails' => '/recipe/edit/:id/',
      'controller' => 'madRecipeController',
      'action' => 'form',
      'arguments' => 
      array (
        'form' => 'recipe.recipe',
        'successRoute' => 'recipe.details',
      ),
      'application' => 'recipe',
    ),
    'recipe.details' => 
    array (
      'rails' => '/recipe/details/:slug/',
      'controller' => 'madModelController',
      'action' => 'details',
      'application' => 'recipe',
    ),
    'core.fatal' => 
    array (
      'controller' => 'madCoreFatalController',
      'action' => 'fatal',
      'rails' => '/fatal/',
      'application' => 'core',
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
