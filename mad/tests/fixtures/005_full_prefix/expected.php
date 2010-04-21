<?php $routeInfo = madCoreRoutingInformation::__set_state(array(
   'route' => 
  madCoreRoute::__set_state(array(
     'application' => 'recipe',
     'pattern' => '/recipes/list/',
     'controllerClassName' => 'madCrud',
     'action' => 'list',
     'defaultValues' => 
    array (
      'filter__namespace' => 'recipe',
    ),
  )),
   'matchedRoute' => '/recipes/list/',
   'controllerClass' => 'madCrud',
   'action' => 'list',
   'router' => NULL,
)); 
$requestVariables = array (
  'filter__namespace' => 'recipe',
); 
return array( $routeInfo, $requestVariables ) ?>