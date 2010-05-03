<?php

class madAuthenticationControllerDecorator extends madControllerDecorator {
    public function createResult(  ) {
        if ( $this->isLoginRequired(  ) && !$this->isAuthenticated(  ) ) {
            return $this->doLoginRedirect();
        }

        if ( $this->isRoleRequired(  ) && !$this->hasRole( $this->configuration['roleRequired'] ) ) {
            return $this->doRoleError();
        }

        return $this->decorated->createResult();
    }

    public function isAuthenticated(  ) {
        if ( isset( $request->variables['user'] ) && isset( $request->variables['user']['id'] ) ) {
            return true;
        }

        return false;
    }

    public function isRoleRequired(  ) {
        if ( isset( $this->configuration['roleRequired'] ) ) {
            return true;
        }
    }

    public function isLoginRequired(  ) {
        if ( isset( $this->configuration['loginRequired'] ) && $this->configuration['loginRequired'] ) {
            return true;
        }

        if ( $this->isRoleRequired(  ) ) {
            return true;
        }

        return false;
    }

    public function hasRole( $role ) {
        if ( !isset( $this->request->variables['user']['role'] ) ) {
            return false;
        }

        if ( $this->request->variables['user']['role'] != $role ) {
            return false;
        }

        return true;
    }

    public function doRoleError(  ) {
        $result = new ezcMvcResult(  );
        $result->variables['role'] = $this->configuration['roleRequired'];
        return $result;
    }

    public function doLoginRedirect(  ) {
        $result = new ezcMvcResult(  );
        $prefix = $this->registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );

        $result->status = new ezcMvcExternalRedirect(
            $this->registry->configuration->getSetting( 'applications', 'authentication', 'loginUrl' )
        );

        return $result;
    }
}

?>
