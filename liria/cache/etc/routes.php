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
      'paginate' => 7,
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
    'profile.list' => 
    array (
      'rails' => '/profile/list/',
      'controller' => 'madModelController',
      'action' => 'list',
      'query' => 'select id from %(profile_index)s order by updated',
      'application' => 'profile',
    ),
    'profile.create' => 
    array (
      'rails' => '/profile/create/',
      'controller' => 'madModelController',
      'action' => 'form',
      'form' => 'profile.profile',
      'successRoute' => 'profile.details',
      'application' => 'profile',
    ),
    'profile.edit' => 
    array (
      'rails' => '/profile/edit/:id/',
      'controller' => 'madModelController',
      'action' => 'form',
      'form' => 'profile.profile',
      'successRoute' => 'profile.details',
      'application' => 'profile',
    ),
    'profile.details' => 
    array (
      'rails' => '/profile/details/:slug/',
      'controller' => 'madModelController',
      'action' => 'details',
      'application' => 'profile',
    ),
    'profile.autocomplete' => 
    array (
      'rails' => '/profile/autocomplete/profile/',
      'controller' => 'madModelController',
      'action' => 'autocomplete',
      'query' => 'select id from %(profile_index)s order by name',
      'valueAttribute' => 'id',
      'displayAttribute' => 'name',
      'application' => 'profile',
    ),
    'core.fatal' => 
    array (
      'controller' => 'madFatalController',
      'action' => 'fatal',
      'rails' => '/fatal/',
      'application' => 'mad',
    ),
    'authentication.login' => 
    array (
      'rails' => '/auth/login/',
      'controller' => 'madAuthenticationController',
      'action' => 'login',
      'form' => 'authentication.login',
      'application' => 'authentication',
    ),
    'authentication.register' => 
    array (
      'rails' => '/auth/register/',
      'controller' => 'madAuthenticationController',
      'action' => 'form',
      'form' => 'authentication.register',
      'application' => 'authentication',
    ),
    'authentication.logout' => 
    array (
      'rails' => '/auth/logout/',
      'controller' => 'madAuthenticationController',
      'action' => 'logout',
      'form' => 'authentication.logout',
      'application' => 'authentication',
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
