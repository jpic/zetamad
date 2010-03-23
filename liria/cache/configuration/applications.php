<?php
return array (
  'settings' => 
  array (
    'liria' => 
    array (
      'path' => '/srv/mad.100305/jpic_data/madeleinemarket.com.svn/xp/liria',
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
      'path' => '/srv/mad.100305/jpic_data/madeleinemarket.com.svn/xp/recipe',
      'classes' => 
      array (
      ),
    ),
    'ci' => 
    array (
      'routePrefix' => '/ci',
      'path' => '/srv/mad.100305/jpic_data/madeleinemarket.com.svn/xp/mad/ci',
      'classes' => 
      array (
        0 => 'madCiController',
        1 => 'madTestRunner',
      ),
    ),
    'model' => 
    array (
      'path' => '/srv/mad.100305/jpic_data/madeleinemarket.com.svn/xp/mad/model',
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
