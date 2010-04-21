<?php $routeInfo = madCoreRoutingInformation::__set_state(array(
   'route' => 
  madCoreRoute::__set_state(array(
     'application' => 'recipe',
     'pattern' => '/list',
     'controllerClassName' => 'fooControllerMock',
     'action' => 'list',
     'defaultValues' => 
    array (
      'filter__category' => 'default category',
    ),
  )),
   'matchedRoute' => '/list',
   'controllerClass' => 'fooControllerMock',
   'action' => 'list',
   'router' => NULL,
)); 
$requestVariables = array (
  'filter__category' => 'default category',
); 
return array( $routeInfo, $requestVariables ) ?>