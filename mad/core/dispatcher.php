<?php

class madCoreDispatcher implements ezcMvcDispatcherConfiguration {
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
        return new madCoreView( $request, $result, $routeInfo );
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
    

    static public function run() {
        $config = new madCoreDispatcher(  );

        $dispatcher = new ezcMvcConfigurableDispatcher( $config );
        $dispatcher->run();
    }
}
?>
