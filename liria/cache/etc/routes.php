<?php return array (
  'recipe.list' => 
  array (
    'rails' => '/recipe/list',
    'controller' => 'madModelController',
    'action' => 'list',
    'query' => 'select id from %(recipe_index)s order by updated',
    'paginate' => 7,
    'application' => 'recipe',
    'path' => '../recipe',
    'routePrefix' => '/recipe',
    'view' => 'madView',
    'name' => 'recipe.list',
  ),
  'recipe.create' => 
  array (
    'rails' => '/recipe/create',
    'controller' => 'madModelController',
    'action' => 'form',
    'template' => 'recipe_form.php',
    'form' => 'recipe.recipe',
    'successRoute' => 'recipe.details',
    'acceptedRoles' => 
    array (
      0 => 'chief',
      1 => 'administrator',
    ),
    'application' => 'recipe',
    'path' => '../recipe',
    'routePrefix' => '/recipe',
    'view' => 'madView',
    'name' => 'recipe.create',
  ),
  'recipe.edit' => 
  array (
    'rails' => '/recipe/edit/:id',
    'controller' => 'madModelController',
    'action' => 'form',
    'form' => 'recipe.recipe',
    'successRoute' => 'recipe.details',
    'application' => 'recipe',
    'path' => '../recipe',
    'routePrefix' => '/recipe',
    'view' => 'madView',
    'name' => 'recipe.edit',
  ),
  'recipe.details' => 
  array (
    'rails' => '/recipe/details/:slug',
    'controller' => 'madModelController',
    'action' => 'details',
    'views' => 
    array (
      0 => 'madCommentView',
    ),
    'application' => 'recipe',
    'path' => '../recipe',
    'routePrefix' => '/recipe',
    'view' => 'madView',
    'name' => 'recipe.details',
  ),
  'recipe.categoryAutocomplete' => 
  array (
    'rails' => '/recipe/autocomplete/category',
    'controller' => 'madModelController',
    'action' => 'autocomplete',
    'query' => 'select distinct(category) as category from %(recipe_index)s',
    'column' => 'category',
    'application' => 'recipe',
    'path' => '../recipe',
    'routePrefix' => '/recipe',
    'view' => 'madView',
    'name' => 'recipe.categoryAutocomplete',
  ),
  'profile.list' => 
  array (
    'rails' => '/profile/list',
    'controller' => 'madModelController',
    'action' => 'list',
    'query' => 'select id from %(profile_index)s order by updated',
    'application' => 'profile',
    'routePrefix' => '/profile',
    'path' => '../profile',
    'view' => 'madView',
    'name' => 'profile.list',
  ),
  'profile.create' => 
  array (
    'rails' => '/profile/create',
    'controller' => 'madModelController',
    'action' => 'form',
    'form' => 'profile.profile',
    'successRoute' => 'profile.details',
    'application' => 'profile',
    'routePrefix' => '/profile',
    'path' => '../profile',
    'view' => 'madView',
    'name' => 'profile.create',
  ),
  'profile.edit' => 
  array (
    'rails' => '/profile/edit/:id',
    'controller' => 'madModelController',
    'action' => 'form',
    'form' => 'profile.profile',
    'successRoute' => 'profile.details',
    'application' => 'profile',
    'routePrefix' => '/profile',
    'path' => '../profile',
    'view' => 'madView',
    'name' => 'profile.edit',
  ),
  'profile.details' => 
  array (
    'rails' => '/profile/details/:slug',
    'controller' => 'madModelController',
    'action' => 'details',
    'application' => 'profile',
    'routePrefix' => '/profile',
    'path' => '../profile',
    'view' => 'madView',
    'name' => 'profile.details',
  ),
  'profile.autocomplete' => 
  array (
    'rails' => '/profile/autocomplete/profile',
    'controller' => 'madModelController',
    'action' => 'autocomplete',
    'query' => 'select id from %(profile_index)s order by name',
    'valueAttribute' => 'id',
    'displayAttribute' => 'name',
    'application' => 'profile',
    'routePrefix' => '/profile',
    'path' => '../profile',
    'view' => 'madView',
    'name' => 'profile.autocomplete',
  ),
  'mad.fatal' => 
  array (
    'controller' => 'madFatalController',
    'action' => 'fatal',
    'rails' => '/mad/fatal',
    'application' => 'mad',
    'includePath' => 
    array (
      0 => '../../',
      1 => '../',
    ),
    'routePrefix' => '/mad',
    'urlPrefix' => '/mm/xp',
    'uploadUrl' => '/mm/xp/liria/upload',
    'pdoArguments' => 
    array (
      0 => 'mysql:host=localhost;dbname=madmodel',
      1 => 'root',
    ),
    'refresh' => false,
    'path' => '../mad',
    'tablePrefix' => 'mad_',
    'pdoClass' => 'PDO',
    'defaultController' => 'madModelController',
    'defaultView' => 'madView',
    'viewPlugins' => 
    array (
      0 => 'madAuthenticationViewHandlerPlugin',
    ),
    'controllerDecorators' => 
    array (
      0 => 'madAuthenticationControllerDecorator',
    ),
    'view' => 'madView',
    'name' => 'mad.fatal',
  ),
  'mad.static' => 
  array (
    'regexp' => '@^/mad/static(?P<path>/.+)$@',
    'controller' => 'madDownloadController',
    'action' => 'download',
    'view' => 'madView',
    'application' => 'mad',
    'includePath' => 
    array (
      0 => '../../',
      1 => '../',
    ),
    'routePrefix' => '/mad',
    'urlPrefix' => '/mm/xp',
    'uploadUrl' => '/mm/xp/liria/upload',
    'pdoArguments' => 
    array (
      0 => 'mysql:host=localhost;dbname=madmodel',
      1 => 'root',
    ),
    'refresh' => false,
    'path' => '../mad',
    'tablePrefix' => 'mad_',
    'pdoClass' => 'PDO',
    'defaultController' => 'madModelController',
    'defaultView' => 'madView',
    'viewPlugins' => 
    array (
      0 => 'madAuthenticationViewHandlerPlugin',
    ),
    'controllerDecorators' => 
    array (
      0 => 'madAuthenticationControllerDecorator',
    ),
    'name' => 'mad.static',
  ),
  'authentication.userList' => 
  array (
    'tableColumns' => 
    array (
      'prestashopIp' => 'id presta',
      'email' => 'email',
    ),
    'rails' => '/auth/user/list',
    'controller' => 'madModelController',
    'action' => 'list',
    'query' => 'select id from %(user_index)s order by updated',
    'title' => 'liste des utilisateurs',
    'tableLinkColumns' => 
    array (
      'authentication.userDetails' => 'details',
    ),
    'ifEmpty' => 'il n\'y a pas d\'utilisateur enregistré',
    'createRoute' => 'authentication.userCreate',
    'createLabel' => 'enregistrer un nouvel utilisateur',
    'application' => 'authentication',
    'routePrefix' => '/auth',
    'backends' => 
    array (
      0 => 'madAuthenticationPrestashopBackend',
    ),
    'loginUrl' => '/mm/authentication.php',
    'path' => '../mad/contrib/authentication',
    'view' => 'madView',
    'name' => 'authentication.userList',
  ),
  'authentication.userCreate' => 
  array (
    'rails' => '/auth/user/create',
    'controller' => 'madModelController',
    'action' => 'form',
    'form' => 'authentication.user',
    'successRoute' => 'authentication.userDetails',
    'application' => 'authentication',
    'routePrefix' => '/auth',
    'backends' => 
    array (
      0 => 'madAuthenticationPrestashopBackend',
    ),
    'loginUrl' => '/mm/authentication.php',
    'path' => '../mad/contrib/authentication',
    'view' => 'madView',
    'name' => 'authentication.userCreate',
  ),
  'authentication.userEdit' => 
  array (
    'rails' => '/auth/user/edit/:id',
    'controller' => 'madModelController',
    'action' => 'form',
    'form' => 'authentication.user',
    'successRoute' => 'authentication.userDetails',
    'application' => 'authentication',
    'routePrefix' => '/auth',
    'backends' => 
    array (
      0 => 'madAuthenticationPrestashopBackend',
    ),
    'loginUrl' => '/mm/authentication.php',
    'path' => '../mad/contrib/authentication',
    'view' => 'madView',
    'name' => 'authentication.userEdit',
  ),
  'authentication.userDetails' => 
  array (
    'rails' => '/auth/user/details/:slug',
    'controller' => 'madModelController',
    'action' => 'details',
    'title' => 'détails de l\'utilisateur',
    'application' => 'authentication',
    'routePrefix' => '/auth',
    'backends' => 
    array (
      0 => 'madAuthenticationPrestashopBackend',
    ),
    'loginUrl' => '/mm/authentication.php',
    'path' => '../mad/contrib/authentication',
    'view' => 'madView',
    'name' => 'authentication.userDetails',
  ),
  'authentication.roleAutocomplete' => 
  array (
    'rails' => '/auth/autocomplete/role',
    'controller' => 'madModelController',
    'action' => 'autocomplete',
    'query' => 'select distinct(role) as role from %(user_index)s order by role',
    'column' => 'role',
    'application' => 'authentication',
    'routePrefix' => '/auth',
    'backends' => 
    array (
      0 => 'madAuthenticationPrestashopBackend',
    ),
    'loginUrl' => '/mm/authentication.php',
    'path' => '../mad/contrib/authentication',
    'view' => 'madView',
    'name' => 'authentication.roleAutocomplete',
  ),
) ?>