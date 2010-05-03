<?php

class madAuthenticationControllerDecorator extends madControllerDecorator {
    public function createResult(  ) {
        if ( $this->isLoginRequired(  ) && !$this->isAuthenticated(  ) ) {
            $result = new ezcMvcResult(  );
    
            $result->status = new ezcMvcExternalRedirect(
                $this->registry->configuration->getSetting( 'applications', 'authentication', 'loginUrl' )
            );
    
            return $result;
        }

        if ( $this->isRoleRequired(  ) && !$this->hasAnyRole( $this->configuration['acceptedRoles'] ) ) {
            $result = new ezcMvcResult(  );
            $prefix = $this->registry->configuration->getSetting( 'applications', 'mad', 'urlPrefix' );
    
            $result->status = new ezcMvcExternalRedirect(
                $prefix . $this->registry->configuration->getSetting( 'routes', 'mad.fatal', 'rails' )
            );
    
            return $result;
        }

        $result = $this->decorated->createResult();
        return $result;
    }

    public function isAuthenticated(  ) {
        if ( isset( $this->request->variables['user'] ) && isset( $this->request->variables['user']['id'] ) ) {
            return true;
        }

        return false;
    }

    public function isRoleRequired(  ) {
        if ( isset( $this->configuration['acceptedRoles'] ) ) {
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

    public function hasAnyRole( $roles ) {
        if ( !isset( $this->request->variables['user']['role'] ) ) {
            return false;
        }

        if ( !in_array( $this->request->variables['user']['role'], $roles ) ) {
            return false;
        }

        return true;
    }

    public function doRoleError(  ) {
        $result = new ezcMvcResult(  );
        $result->variables['role'] = $this->configuration['acceptedRoles'];
        return $result;
    }

    public function doLoginRedirect(  ) {
        $result = new ezcMvcResult(  );
        $prefix = $this->registry->configuration->getSetting( 'applications', 'mad', 'urlPrefix' );

        $result->status = new ezcMvcExternalRedirect(
            $this->registry->configuration->getSetting( 'applications', 'authentication', 'loginUrl' )
        );

        return $result;
    }
}

?>
