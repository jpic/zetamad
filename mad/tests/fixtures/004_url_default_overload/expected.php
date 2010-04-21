<?php $routeInfo = madCoreRoutingInformation::__set_state(array(
   'route' => 
  madCoreRoute::__set_state(array(
     'application' => 'recipe',
     'pattern' => '/list/:filter__category',
     'controllerClassName' => 'fooControllerMock',
     'action' => 'list',
     'defaultValues' => 
    array (
    ),
  )),
   'matchedRoute' => '/list/:filter__category',
   'controllerClass' => 'fooControllerMock',
   'action' => 'list',
   'router' => NULL,
)); 
$requestVariables = array (
  'filter__category' => 'Drinks',
); 
return array( $routeInfo, $requestVariables ) ?>