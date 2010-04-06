<?php
return array (
  'settings' => 
  array (
    'liria' => 
    array (
      'path' => false,
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
      'path' => '../recipe',
      'classes' => 
      array (
      ),
    ),
    'ci' => 
    array (
      'routePrefix' => '/ci',
      'path' => '../mad/ci',
      'classes' => 
      array (
        0 => 'madCiController',
        1 => 'madCiTestCase',
        2 => 'madTestRunner',
      ),
    ),
    'core' => 
    array (
      'path' => '../mad/core',
      'classes' => 
      array (
        0 => 'madCoreRoute',
        1 => 'madCoreView',
        2 => 'madCoreFatalController',
        3 => 'madCoreDownloadController',
        4 => 'madCoreRoutingInformation',
        5 => 'madCoreViewHandler',
        6 => 'madCoreConfiguration',
        7 => 'madCoreRouter',
      ),
    ),
    'model' => 
    array (
      'path' => '../mad/model',
      'classes' => 
      array (
        0 => 'madModelController',
        1 => 'madModel',
        2 => 'madModelException',
        3 => 'madModelExceptedId',
        4 => 'CKEditor',
        5 => 'CKEditor',
      ),
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
