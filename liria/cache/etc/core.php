<?php
return array (
  'settings' => 
  array (
    'dispatcher' => 
    array (
      'prefix' => '/mm/xp',
    ),
    'upload' => 
    array (
      'url' => '/mm/xp/liria/upload',
    ),
    'model' => 
    array (
      'prefix' => 'mad_',
    ),
    'bootstrap' => 
    array (
      'includePath' => 
      array (
        0 => '../../',
        1 => '../',
      ),
      'refreshCache' => true,
      'refreshModel' => true,
      'refreshAutoload' => true,
      'refreshBin' => true,
    ),
    'database' => 
    array (
      'class' => 'PDO',
      'arguments' => 
      array (
        0 => 'mysql:host=localhost;dbname=madmodel',
        1 => 'root',
      ),
    ),
  ),
  'comments' => 
  array (
  ),
);
?>
