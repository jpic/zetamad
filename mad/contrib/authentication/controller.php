<?php

class madAuthenticationController extends madController {
    public function preCreateResult(  ) {
        $prefix = $this->registry->configuration->getSetting( 'applications', 'mad', 'urlPrefix', '' );

        if ( $this->isLoginRequired(  ) && !$this->isAuthenticated(  ) ) {
            $result = new ezcMvcResult(  );
    
            $result->status = new ezcMvcExternalRedirect(
                $this->registry->configuration->getSetting( 'applications', 'authentication', 'loginUrl' )
            );
    
            return $result;
        }

        if ( $this->isRoleRequired(  ) && !$this->hasAnyRole( $this->configuration['acceptedRoles'] ) ) {
            $result = new ezcMvcResult(  );
            
            $_SESSION['fatalRequest'] = $this->request;
            $dictionnary = array_merge(
                array(
                    'acceptedRoles' => implode( ', ', $this->configuration['acceptedRoles'] ),
                ),
                (array)$this->request->variables['user']
            );

            $messages = $this->registry->configuration->getSetting( 'applications', 'authentication', 'messages' );
            $_SESSION['fatalMessage'] = madFramework::dictionnaryReplace( 
                $messages['insuficientRolePlural'],
                $dictionnary
            );

            $_SESSION['fatalSolutions'] = array();
            foreach( $messages['insuficientRoleSolutions'] as $message ) {
                $_SESSION['fatalSolutions'][] = madFramework::dictionnaryReplace( 
                    $message,
                    $dictionnary
                );
            }

            $result->status = new ezcMvcExternalRedirect(
                $prefix . $this->registry->configuration->getSetting( 'routes', 'mad.fatal', 'rails' )
            );
    
            return $result;
        }
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
