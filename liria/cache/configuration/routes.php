<?php
return array (
  'settings' => 
  array (
    'recipe.list' => 
    array (
      'rails' => '/recipe/list/',
      'controller' => 'madModelController',
      'action' => 'list',
      'query' => 'select id from %(recipe_index)s order by updated',
      'application' => 'recipe',
    ),
    'recipe.create' => 
    array (
      'rails' => '/recipe/create/',
      'controller' => 'madModelController',
      'action' => 'form',
      'template' => 'recipe_form.php',
      'form' => 'recipe.recipe',
      'successRoute' => 'recipe.details',
      'application' => 'recipe',
    ),
    'recipe.edit' => 
    array (
      'rails' => '/recipe/edit/:id/',
      'controller' => 'madModelController',
      'action' => 'form',
      'form' => 'recipe.recipe',
      'successRoute' => 'recipe.details',
      'application' => 'recipe',
    ),
    'recipe.details' => 
    array (
      'rails' => '/recipe/details/:slug/',
      'controller' => 'madModelController',
      'action' => 'details',
      'application' => 'recipe',
    ),
    'recipe.categoryAutocomplete' => 
    array (
      'rails' => '/recipe/autocomplete/category/',
      'controller' => 'madModelController',
      'action' => 'autocomplete',
      'query' => 'select id from %(recipe_index)s',
      'attribute' => 'category',
      'application' => 'recipe',
    ),
    'core.fatal' => 
    array (
      'controller' => 'madFatalController',
      'action' => 'fatal',
      'rails' => '/fatal/',
      'application' => 'mad',
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
