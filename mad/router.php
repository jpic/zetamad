<?php

class madRouter extends ezcMvcRouter {
    private $config = array(  );

    public function __construct( ezcMvcRequest $request, $config ) {
        parent::__construct( $request );
        $this->config = $config;
    }

    /**
     * Returns routing information, including a controller classname from the set of routes.
     *
     * This method is run by the dispatcher to obtain a controller. It uses the
     * user implemented createRoutes() method from the inherited class to fetch the
     * routes. It then loops over these routes in order - the first one that
     * matches the request returns the routing information. The loop stops as
     * soon as a route has matched. In case none of the routes matched
     * with the request data an exception is thrown.
     *
     * @throws ezcMvcNoRoutesException when there are no routes defined.
     * @throws ezcBaseValueException when one of the returned routes was not
     *         actually an object implementing the ezcMvcRoute interface.
     * @throws ezcMvcRouteNotFoundException when no routes matched the request URI.
     * @return ezcMvcRoutingInformation
     */
    public function getRoutingInformation()
    {
        if ( substr( $this->request->uri, 0, 8 ) == '/static/' ) {
            $routingInformation = new ezcMvcRoutingInformation(
                 $this->request->uri,
                 'madDownloadController',
                 'download'
            );
            $routingInformation->router = $this;
        } else {
            $routingInformation = parent::getRoutingInformation(  );
        }

        return $routingInformation;
    }



    public function createRoutes(  ) {
        $routes = array(  );

        foreach( $this->config as $name => $routeArray ) {
            if ( !isset( $routeArray['arguments'] ) ) {
                $routeArray['arguments'] = array(  );
            }

            $route = new madRoute( 
                $routeArray['rails'],
                $routeArray['controller'],
                $routeArray['action'],
                $routeArray['arguments']
            );

            if ( !isset( $routeArray['application'] ) ) {
                throw new Exception( "What application is that route comming from?" );
            }

            $route->application = $routeArray['application'];

            $routes[$name] = $route;
        }

        return $routes;
    }
}
?>
