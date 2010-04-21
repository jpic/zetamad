<?php

class madRoute extends ezcMvcRailsRoute {
    public $application = null;
    /**
     * Evaluates the URI against this route.
     *
     * The method first runs the match. If the pattern matches, it then creates
     * an object containing routing information and returns it. If the route's
     * pattern did not match it returns null.
     *
     * @param ezcMvcRequest $request
     * @return null|ezcMvcRoutingInformation
     */
    public function matches( ezcMvcRequest $request )
    {
        if ( $this->match( $request, $matches ) )
        {
            $request->variables = array_merge( $this->defaultValues, $request->variables, $matches );

            // monkey patch
            $return = new madRoutingInformation( $this->pattern, $this->controllerClassName, $this->action );
            $return->route = $this;
            return $return;
        }
        return null;
    }

    static public function __set_state( array $state = array(  ) ) {
        $return = new madRoute( 
            $state['pattern'],
            $state['controllerClassName'],
            $state['action'],
            $state['defaultValues']
        );
        if ( isset( $state['application'] ) ) {
            $return->application = $state['application'];
        }
        return $return;
    }
}

?>
