<?php

class madAuthenticationViewHandlerPlugin {
    public function hasRole( $role ) {
        if ( !isset( $this->request->variables['user'] ) ) {
            return false;
        }

        if ( !isset( $this->request->variables['user']['role'] ) ) {
            return false;
        }

        return $this->request->variables['user']['role'] == $role;
    }
}

?>
