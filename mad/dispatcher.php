<?php

class madHttpDispatcher {
    public function __construct( madConfiguration $configuration, madSignals $signals ) {
        $this->configuration = $configuration;
        $this->signals = $signals;
    }

    public function run(  ) {
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
        $requestParser->prefix = $this->configuration->getSetting( 'applications', 'mad', 'urlPrefix', '' );
        
        /**
         * The http specific request request parser will consider PHP classic 
         * superglobals, but not only. Encapsulating request specific variables in a "struct" 
         * class is convenient for several reasons:
         *
         * - native protocol abstraction
         * - the ability to make request fixtures for testing
         */
        $request = $requestParser->createRequest();
        
        $request->uri = substr( $request->uri, -1 ) == '/' ? substr( $request->uri, 0, -1 ) : $request->uri;
        $request->variables['prefixedUrl'] = $registry->configuration->getSetting( 'applications', 'mad', 'urlPrefix' ) . $request->uri;
        
        // check if ajax
        $request->variables['ajaxRequest'] = isset( $request->raw['HTTP_X_REQUESTED_WITH'] ) &&
            $request->raw['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest';
               
        // handle files properly, 2 array level
        // properly: http://es2.php.net/manual/en/faq.html.php#faq.html.arrays
        $request->files = array();
        foreach( $_FILES as $formName => $array ) {
            $request->files[$formName] = array(  );
        
            foreach( array_keys( $array['name'] ) as $fieldName ) {
                if ( is_array( $array['name'][$fieldName] ) ) {
                    $request->files[$formName][$fieldName] = array(  );

                    foreach( $array['name'][$fieldName] as $key => $value ) {
                        $file = new ezcMvcRequestFile;
                        $file->mimeType = $array['type'][$fieldName][$key];
                        $file->name = $array['name'][$fieldName][$key];
                        $file->size = $array['size'][$fieldName][$key];
                        $file->status = $array['error'][$fieldName][$key];
                        $file->tmpPath = $array['tmp_name'][$fieldName][$key];

                        $request->files[$formName][$fieldName][$key] = $file;
                    }
                } else {
                    $file = new ezcMvcRequestFile;
                    $file->mimeType = $array['type'][$fieldName];
                    $file->name = $array['name'][$fieldName];
                    $file->size = $array['size'][$fieldName];
                    $file->status = $array['error'][$fieldName];
                    $file->tmpPath = $array['tmp_name'][$fieldName];
                   
                    $request->files[$formName][$fieldName] = $file;

                }
            }
        }
        
        $this->signals->send( 'postParseRequest', array( $request ) );
        
        /**
         * A router should be istnanciated with the request object.
         *
         * In our case, the router uses configuration as additionnal constructor 
         * argument.
         */
        $routes = $this->configuration['routes'];
        $router = new madRouter( $request, $routes );
        madRegistry::instance(  )->router = $router;

        $this->signals->send( 'postCreateRouter', array( $request, $router ) );
        
        /**
         * Run the router and get the routing information.
         *
         * The router must parse the request and return a struct which encapsulates 
         * some of the routing information. It could have returned an array instead of 
         * a class bu that would be propice to backward compatibility breaks which are 
         * against eZ Components coding standards.
         */
        $routingInformation = $router->getRoutingInformation();
        
        // get route routeConfiguration
        $routeConfiguration = $this->configuration['routes'][$routingInformation->routeName];

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
        $controller = $this->createRouteController( $request, $routeConfiguration );
        $result = $controller->createResult();
        
        $result->variables['request'] = $request;
        $result->variables['configuration'] =& $routeConfiguration;
        
        $this->signals->send( 'postCreateResult', array( $request, $result ) );

        /**
         * Instanciate the view.
         *
         * This view class is also protocol and framework specific.
         */
        $view = $this->createRouteView( $request, $result, $routingInformation, $routeConfiguration );

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

    }

    public function createRouteView( $request, $result, $routingInformation, &$routeConfiguration ) {
        $viewClass = $routeConfiguration['view'];
        $view = new $viewClass( $request, $result, $routingInformation, $routeConfiguration );

        if ( !isset( $routeConfiguration['views'] ) ) {
            $routeConfiguration['views'] = array();
        }

        foreach( $routeConfiguration['views'] as $name => $class ) {
            $view->compose( $name, new $class( $request, $result, $routingInformation, $routeConfiguration ) );
        }

        return $view;
    }

    public function createRouteController( $request, &$routeConfiguration ) {
        $class = $routeConfiguration['controller'];
        $action = $routeConfiguration['action'];
        $controller = new $class( $action, $request, $routeConfiguration );
        
        foreach( $this->configuration->getSetting( 'applications', 'mad', 'controllers', array(  ) ) as $name => $class ) {
            $controller->compose( $name, new $class( $action, $request, $routeConfiguration ) );
        }

        return $controller;
    }
}

?>
