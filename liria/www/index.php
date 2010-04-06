<?php
include '../bootstrap.php';
$registry = madRegistry::instance();

/**
 * Create the http request parser.
 * 
 * Note that other request parsers may be used, be it for a soap, mail, or 
 * command line interface.
 */
$requestParser = new ezcMvcHttpRequestParser;

/**
 * Set the http request parser prefix.
 * Consider an http server which serves /var/www:
 * 
 * - if this script is /var/www/foo/index.php, then the prefix should be: "/foo"
 * - if this script is in /var/www/index.php, then the prefix should be an 
 *   empty string: ""
 * 
 * This allows your routes to *not* contain the prefix and thus be more 
 * portable: if the script is in /var/www/foo/index.php, and the prefix was an 
 * empty string "", then routes should be like "/foo/bar" instead of just "/bar". 
 * 
 * The prefix is specific to the runtime environment and should not be hard 
 * coded in the routes.
 *
 * In this example, the prefix comes from a configuratio nvariable.
 */
$requestParser->prefix = $registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );

/**
 * The http specific request request parser will consider PHP classic 
 * superglobals, but not only. Encapsulating request specific variables in a "struct" 
 * class is convenient for several reasons:
 *
 * - native protocol abstraction
 * - the ability to make request fixtures for testing
 */
$request = $requestParser->createRequest();

// append trailing slash if not a static file
if ( substr( $request->uri, 0, 8) != '/static/' ) {
    if ( substr( $request->requestId, -1 ) != '/' ) {
        $request->requestId .= '/';
    }
    if ( substr( $request->uri, -1 ) != '/' ) {
        $request->uri .= '/';
    }
}

/**
 * A router should be istnanciated with the request object.
 *
 * In our case, the router uses configuration as additionnal constructor 
 * argument.
 */
$routes = $registry->configuration->settings['routes'];
$router = new madCoreRouter( $request, $routes );

/**
 * Store the router instance for later.
 *
 * In our case, a registry class is responsible for holding objects which 
 * should be reused in the different layers.
 *
 * It is useful to have the router instance available because it is the role of 
 * the router to generate urls.
 *
 * It is a very bad practice to hardcode a url outside the router because it 
 * will require a url change to be propagated all along the application code.
 */
$registry->router = $router;

/**
 * Run the router and get the routing information.
 *
 * The router must parse the request and return a struct which encapsulates 
 * some of the routing information. It could have returned an array instead of 
 * a class bu that would be propice to backward compatibility breaks which are 
 * against eZ Components coding standards.
 */
$routingInformation = $router->getRoutingInformation();

/**
 * Instanciate the controller and run it.
 *
 * The controller actions should avoid PHP superglobals in order to be more 
 * reuseable. The purpose of the request struct is really to make the 
 * controller reusable in odrer to reduce code duplication and development 
 * time.
 *
 * The controller should return a result object, again to make protocol 
 * abstraction, reusability and testing possible.
 */
$controllerClass = $routingInformation->controllerClass;
$controller = new $controllerClass( $routingInformation->action, $request );
$result = $controller->createResult();

/**
 * Instanciate the view.
 *
 * This view class is also protocol and framework specific.
 */
$view = new madCoreView( $request, $result, $routingInformation );

/**
 * Run the view which returns a response object.
 *
 * The view's role is not to directly output the response, because that would 
 * tie the view class to specific protocols and make it hard to test.
 *
 * Instead, it returns a response struct which can be serialized for testing 
 * for example.
 */
$response = $view->createResponse();

/**
 * The role of the response writer is to actually do something with the 
 * response struct.
 *
 * The ezcMvcHttpResponseWriter is responsible for normal http output, like 
 * setting headers and echo'ing the http body.
 *
 * Example of other writers would be:
 * 
 * - serialize in a test fixture directory,
 * - send an html email,
 * - display with lynx,
 * - etc, etc, ...
 */
$responseWriter = new ezcMvcHttpResponseWriter( $response );
$responseWriter->handleResponse();

/**
 * To conclude, it appears that MvcTools is not a framework. It is just a 
 * library that provides tools allowing users to not reinvent proper MVC and 
 * concentrate on what makes a project different.
 *
 * The arbit project uses an internal software framework which allows to extend 
 * the software easily.
 *
 * There *will* eventually be an application framework which allows to create 
 * applications and reuse them in other projects. Apparently, only a draft 
 * exists on http://github.com/jpic/ezc-framework-apps.
 */
?>
