<?php $routeInfo = madRoutingInformation::__set_state(array(
   'route' => 
  madRoute::__set_state(array(
     'application' => 'recipe',
     'pattern' => '/list',
     'controllerClassName' => 'fooControllerMock',
     'action' => 'list',
     'defaultValues' => 
    array (
      0 => 'filter__category',
    ),
  )),
   'matchedRoute' => '/list',
   'controllerClass' => 'fooControllerMock',
   'action' => 'list',
   'router' => NULL,
)); 
$requestVariables = array (
  0 => 'filter__category',
); 
return array( $routeInfo, $requestVariables ) ?>