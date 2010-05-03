<?php

class madAuthenticationViewHandlerPlugin {
    public function hasRole( $role ) {
        var_dump( $role );
        return 'bar';
    }
}

?>
