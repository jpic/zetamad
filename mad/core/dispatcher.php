<?php
/**
 * File containing the ezcMvcConfigurableDispatcher class
 *
 * @copyright Copyright (C) 2005-2009 eZ Systems AS. All rights reserved.
 * @license http://ez.no/licenses/new_bsd New BSD License
 * @version //autogentag//
 * @filesource
 * @package MvcTools
 */

/**
 * This class implements an example dispatcher that can be configured through
 * ezcMvcDispatcherConfiguration.
 *
 * @package MvcTools
 * @version //autogentag//
 * @mainclass
 */
class madCoreDispatcher implements ezcMvcDispatcher
{
    /*
     * Creates the controller by using the routing information and request data.
     *
     * @param ezcMvcRoutingInformation $routingInformation
     * @param ezcMvcRequest            $request
     * @return ezcMvcController
     */
    protected function createController( ezcMvcRoutingInformation $routingInformation, ezcMvcRequest $request )
    {
        $controllerClass = $routingInformation->controllerClass;
        $controller = new $controllerClass( $routingInformation->action, $request );
        return $controller;
    }

    /**
     * Checks whether the number of redirects does not exceed the limit, and
     * increases the $redirects count.
     *
     * @throws ezcMvcInfiniteLoopException when the number of redirects exceeds
     *         the limit (25 by default).
     * @param int $redirects
     */
    protected function checkRedirectLimit( &$redirects )
    {
        $redirects++;
        if ( $redirects >= 25 )
        {
            throw new ezcMvcInfiniteLoopException( $redirects );
        }
    }

    /**
     * Uses the configuration to fetch the request parser
     *
     * @throws ezcMvcInvalidConfiguration when the returned object is of the wrong class
     *
     * @return ezcMvcRequestParser
     */
    protected function getRequestParser()
    {
        // create the request parser
        $requestParser = $this->createRequestParser();
        if ( ezcBase::inDevMode() && !$requestParser instanceof ezcMvcRequestParser )
        {
            throw new ezcMvcInvalidConfiguration( 'requestParser', $requestParser, 'instance of ezcMvcRequestParser' );
        }
        return $requestParser;
    }

    /**
     * Uses the configuration to fetch the router
     *
     * @throws ezcMvcInvalidConfiguration when the returned object is of the wrong class
     *
     * @param ezcMvcRequest $request
     * @return ezcMvcRouter
     */
    protected function getRouter( ezcMvcRequest $request )
    {
        $router = $this->createRouter( $request );
        if ( ezcBase::inDevMode() && !$router instanceof ezcMvcRouter )
        {
            throw new ezcMvcInvalidConfiguration( 'router', $router, 'instance of ezcMvcRouter' );
        }
        return $router;
    }

    /**
     * Uses the router (through createController()) to fetch the controller
     *
     * @throws ezcMvcInvalidConfiguration when the returned object is of the wrong class
     *
     * @param ezcMvcRoutingInformation $routingInformation
     * @param ezcMvcRequest            $request
     * @return ezcMvcController
     */
    protected function getController( ezcMvcRoutingInformation $routingInformation, ezcMvcRequest $request )
    {
        $controller = $this->createController( $routingInformation, $request );
        if ( ezcBase::inDevMode() && !$controller instanceof ezcMvcController )
        {
            throw new ezcMvcInvalidConfiguration( 'controller', $controller, 'instance of ezcMvcController' );
        }
        $controller->setRouter( $routingInformation->router );
        return $controller;
    }

    /**
     * Uses the configuration to fetch the view handler
     *
     * @throws ezcMvcInvalidConfiguration when the returned object is of the wrong class
     *
     * @param ezcMvcRoutingInformation $routingInformation
     * @param ezcMvcRequest            $request
     * @param ezcMvcResult             $result
     * @return ezcMvcView
     */
    protected function getView( ezcMvcRoutingInformation $routingInformation, ezcMvcRequest $request, ezcMvcResult $result )
    {
        $view = $this->createView( $routingInformation, $request, $result );
        if ( ezcBase::inDevMode() && !$view instanceof ezcMvcView )
        {
            throw new ezcMvcInvalidConfiguration( 'view', $view, 'instance of ezcMvcView' );
        }
        return $view;
    }

    /**
     * Uses the configuration to fetch a fatal redirect request object
     *
     * @throws ezcMvcInvalidConfiguration when the returned object is of the wrong class
     *
     * @param ezcMvcRequest $request
     * @param ezcMvcResult  $result
     * @param Exception     $e
     * @return ezcMvcRequest
     */
    protected function getFatalRedirectRequest( ezcMvcRequest $request, ezcMvcResult $result, Exception $e )
    {
        if ( $request->isFatal )
        {
            throw new ezcMvcFatalErrorLoopException( $request );
        }
        $request = $this->createFatalRedirectRequest( $request, new ezcMvcResult, $e );
        $request->isFatal = true;
        if ( ezcBase::inDevMode() && !$request instanceof ezcMvcRequest )
        {
            throw new ezcMvcInvalidConfiguration( 'request', $request, 'instance of ezcMvcRequest' );
        }
        return $request;
    }

    /**
     * Uses the configuration to fetch the response writer
     *
     * @throws ezcMvcInvalidConfiguration when the returned object is of the wrong class
     *
     * @param ezcMvcRoutingInformation $routingInformation
     * @param ezcMvcRequest            $request
     * @param ezcMvcResult             $result
     * @param ezcMvcResponse           $response
     * @return ezcMvcResponseWriter
     */
    protected function getResponseWriter( ezcMvcRoutingInformation $routingInformation, ezcMvcRequest $request, ezcMvcResult $result, ezcMvcResponse $response )
    {
        $responseWriter = $this->createResponseWriter( $routingInformation, $request, $result, $response );
        if ( ezcBase::inDevMode() && !$responseWriter instanceof ezcMvcResponseWriter )
        {
            throw new ezcMvcInvalidConfiguration( 'responseWriter', $responseWriter, 'instance of ezcMvcResponseWriter' );
        }
        return $responseWriter;
    }

    /**
     * Runs through the request, by using the configuration to obtain correct handlers.
     */
    public function run()
    {
        // initialize infinite loop counter
        $redirects = 0;

        // create the request
        $requestParser = $this->getRequestParser();
        $request = $requestParser->createRequest();

        // start of the request loop
        do
        {
            // do the infinite loop check
            $this->checkRedirectLimit( $redirects );
            $continue = false;

            // run pre-routing filters
            $this->runPreRoutingFilters( $request );

            // create the router from the configuration
            $router = $this->getRouter( $request );

            // router creates routing information
            $routingInformation = $router->getRoutingInformation();

            // run request filters
            $filterResult = $this->runRequestFilters( $routingInformation, $request );

            if ( $filterResult instanceof ezcMvcInternalRedirect )
            {
                $request = $filterResult->request;
                $continue = true;
                continue;
            }

            // create the controller
            $controller = $this->getController( $routingInformation, $request );

            // run the controller
                $result = $controller->createResult();

            if ( $result instanceof ezcMvcInternalRedirect )
            {
                $request = $result->request;
                $continue = true;
                continue;
            }
            if ( !$result instanceof ezcMvcResult )
            {
                throw new ezcMvcControllerException( "The action '{$routingInformation->action}' of controller '{$routingInformation->controllerClass}' did not return an ezcMvcResult object." );
            }

            $this->runResultFilters( $routingInformation, $request, $result );

            if ( $result->status !== 0 )
            {
                $response = new ezcMvcResponse;
                $response->status = $result->status;
            }
            else
            {
                // want the view manager to use my filters
                $view = $this->getView( $routingInformation, $request, $result );

                // create the response
                $response = $view->createResponse();
            }
            $this->runResponseFilters( $routingInformation, $request, $result, $response );

            // create the response writer
            $responseWriter = $this->getResponseWriter( $routingInformation, $request, $result, $response );

            // handle the response
            $responseWriter->handleResponse();
        }
        while ( $continue );
    }

    public function createRequestParser()
    {
        $registry = madRegistry::instance();
        $prefix = $registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );
        $parser = new ezcMvcHttpRequestParser;
        $parser->prefix = $prefix;
        return $parser;
    }
    
    public function createRouter( ezcMvcRequest $request )
    {
        $registry = madRegistry::instance();
        $routes = $registry->configuration->settings['routes'];
        $router = new madCoreRouter( $request, $routes );
        $registry->router = $router;
        return $router;
    }
    
    public function createView( ezcMvcRoutingInformation $routeInfo,
                         ezcMvcRequest $request, ezcMvcResult $result )
    {
        $return = new madCoreView( $request, $result, $routeInfo );
        return $return;
    }
    
    public function createResponseWriter( ezcMvcRoutingInformation $routeInfo,
                                   ezcMvcRequest $request, ezcMvcResult $result,
                                   ezcMvcResponse $response )
    {
        return new ezcMvcHttpResponseWriter( $response );
    }
    
    public function createFatalRedirectRequest( ezcMvcRequest $request,
                                         ezcMvcResult $result,
                                         Exception $response )
    {
        throw $response;
        $req = clone $request;
        $registry = madRegistry::instance();
        $prefix = $registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );
        $req->uri =  $prefix . $registry->router->generateUrl( 'core.fatal' );
    
        return $req;
    }
    
    public function runResultFilters( ezcMvcRoutingInformation $routeInfo, ezcMvcRequest $request, ezcMvcResult $result )
    {
        $result->variables['installRoot'] = preg_replace( '@/index\.php$@', '', $_SERVER['SCRIPT_NAME'] );
    }
    
    public function runPreRoutingFilters( ezcMvcRequest $request )
    {
    }
    
    public function runRequestFilters( ezcMvcRoutingInformation $routeInfo, ezcMvcRequest $request )
    {
    }
    
    public function runResponseFilters( ezcMvcRoutingInformation $routeInfo, ezcMvcRequest $request, ezcMvcResult $result, ezcMvcResponse $response )
    {
    }

}

?>
