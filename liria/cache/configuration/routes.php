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
      'controller' => 'madModelController',
      'action' => 'form',
      'arguments' => 
      array (
        'form' => 'recipe.recipe',
        'successRoute' => 'recipe.details',
      ),
      'application' => 'recipe',
    ),
    'recipe.edit' => 
    array (
      'rails' => '/recipe/edit/:id/',
      'controller' => 'madModelController',
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
      'rails' => '/recipe/details/:id/',
      'controller' => 'madModelController',
      'action' => 'details',
      'application' => 'recipe',
    ),
    'recipe.originAutocomplete' => 
    array (
      'rails' => '/recipe/autocomplete/origin/',
      'controller' => 'madModelController',
      'action' => 'autocomplete',
      'arguments' => 
      array (
        'filter' => 
        array (
          'namespace' => 'recipe',
        ),
        'distinct' => 'origin',
        'valueAttribute' => 'origin',
        'displayAttribute' => 'origin',
      ),
      'application' => 'recipe',
    ),
    'recipe.ingredientAutocomplete' => 
    array (
      'rails' => '/recipe/autocomplete/origin/',
      'controller' => 'madModelController',
      'action' => 'autocomplete',
      'arguments' => 
      array (
        'filter' => 
        array (
          'namespace' => 'ingredient',
        ),
        'valueAttribute' => 'name',
        'displayAttribute' => 'name',
      ),
      'application' => 'recipe',
    ),
    'profile.list' => 
    array (
      'rails' => '/profile/list/',
      'controller' => 'madModelController',
      'action' => 'list',
      'arguments' => 
      array (
        'filter' => 
        array (
          'namespace' => 'profile',
        ),
      ),
      'application' => 'profile',
    ),
    'profile.create' => 
    array (
      'rails' => '/profile/create/',
      'controller' => 'madModelController',
      'action' => 'form',
      'arguments' => 
      array (
        'form' => 'profile.profile',
        'successRoute' => 'profile.details',
      ),
      'application' => 'profile',
    ),
    'profile.edit' => 
    array (
      'rails' => '/profile/edit/:id/',
      'controller' => 'madModelController',
      'action' => 'form',
      'arguments' => 
      array (
        'form' => 'profile.profile',
        'successRoute' => 'profile.details',
      ),
      'application' => 'profile',
    ),
    'profile.details' => 
    array (
      'rails' => '/profile/details/:id/',
      'controller' => 'madProfileController',
      'action' => 'details',
      'application' => 'profile',
    ),
    'profile.autocomplete' => 
    array (
      'rails' => '/profile/autocomplete/',
      'controller' => 'madModelController',
      'action' => 'autocomplete',
      'arguments' => 
      array (
        'filter' => 
        array (
          'namespace' => 'profile',
        ),
        'valueAttribute' => 'id',
        'displayAttribute' => 'name',
      ),
      'application' => 'profile',
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
