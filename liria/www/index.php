<?php
include '../bootstrap.php';
$registry = madRegistry::instance();

// create the request parser
$requestParser = new ezcMvcHttpRequestParser;
$requestParser->prefix = $registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );

// run the request parser: get a request struct
$request = $requestParser->createRequest();

// create the router with the cached routes configuration and the request 
$routes = $registry->configuration->settings['routes'];
$router = new madCoreRouter( $request, $routes );
$registry->router = $router;

// run the router: get a routing information struct
$routingInformation = $router->getRoutingInformation();

// get the controller class from the routing information struct
$controllerClass = $routingInformation->controllerClass;

// create the controller with the request struct
$controller = new $controllerClass( $routingInformation->action, $request );

// todo: check if this can be removed:
$controller->setRouter( $routingInformation->router ); // monkey patch

// run the controller: get a result struct
$result = $controller->createResult();

// todo: check if this can be removed:
$result->variables['installRoot'] = preg_replace( '@/index\.php$@', '', $_SERVER['SCRIPT_NAME'] );

// create the view
$view = new madCoreView( $request, $result, $routingInformation );
// run the view: get a response struct
$response = $view->createResponse();

// create the response writer with the response
$responseWriter = new ezcMvcHttpResponseWriter( $response );
$responseWriter->handleResponse();
?>
