<?php
return array (
  'settings' => 
  array (
    'liria' => 
    array (
      'path' => '/srv/mad.svn/xp/liria',
      'classes' => 
      array (
        0 => 'madTestRunner',
      ),
      'configPaths' => 
      array (
        0 => '../',
      ),
    ),
    'recipe' => 
    array (
      'routePrefix' => '/recipe',
      'path' => '/srv/mad.svn/xp/recipe',
      'classes' => 
      array (
      ),
    ),
    'ci' => 
    array (
      'routePrefix' => '/ci',
      'path' => '/srv/mad.svn/xp/mad/ci',
      'classes' => 
      array (
        0 => 'madCiController',
        1 => 'madTestRunner',
      ),
    ),
    'core' => 
    array (
      'path' => '/srv/mad.svn/xp/mad/core',
      'classes' => 
      array (
        0 => 'madCoreRoute',
        1 => 'madCoreView',
        2 => 'madCoreFatalController',
        3 => 'madCoreDownloadController',
        4 => 'madCoreRoutingInformation',
        5 => 'madCoreViewHandler',
        6 => 'madCoreConfiguration',
        7 => 'madCoreDispatcher',
        8 => 'madCoreRouter',
      ),
    ),
    'model' => 
    array (
      'path' => '/srv/mad.svn/xp/mad/model',
      'classes' => 
      array (
        0 => 'madModelController',
        1 => 'madModel',
        2 => 'madModelException',
        3 => 'madModelExceptedId',
      ),
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
