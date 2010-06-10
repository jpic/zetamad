<?php

class madRoutingInformation extends ezcMvcRoutingInformation {
    public $route = null;
    public $routeName = null;

    /**
     * Returns a new instance of this class with the data specified by $array.
     *
     * $array contains all the data members of this class in the form:
     * array('member_routeName'=>value).
     *
     * __set_state makes this class exportable with var_export.
     * var_export() generates code, that calls this method when it
     * is parsed with PHP.
     *
     * @param array(string=>mixed) $array
     * @return madRoutingInformation
     */
    static public function __set_state( array $array )
    {
        $return = new madRoutingInformation( $array['matchedRoute'],
            $array['controllerClass'], $array['action'], $array['router'] );
        if ( isset( $array['routeName'] ) ) {
            $return->routeName = $array['routeName'];
        }
        if ( isset( $array['route'] ) ) {
            $return->route = $array['route'];
        }
        return $return;
    }
}
