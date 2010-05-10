<?php

class madAuthenticationController extends madController {
    public $isAuthenticated = false;
    public $isRoleRequired = false;
    public $loginUrl = '';
    public $isLoginRequired = false;
    public $userRole = false;

    public function __construct( $action, ezcMvcRequest $request, &$configuration = null ) {
        parent::__construct( $action, $request, $configuration );

        $this->isAuthenticated = isset( $this->request->variables['user'] ) && isset( $this->request->variables['user']['id'] );
        $this->isRoleRequired = isset( $this->configuration['acceptedRoles'] );
        $this->loginUrl = madRegistry::instance()->configuration->getSetting( 'applications', 'authentication', 'loginUrl' );
        $this->isLoginRequired = ( isset( $this->configuration['loginRequired'] ) && $this->configuration['loginRequired'] ) || $this->isRoleRequired;
        $this->userRole = $this->isAuthenticated && isset( $this->request->variables['user']['role'] ) ? $this->request->variables['user']['role'] : null;
    }
    
    public function preCreateResult(  ) {
        $prefix = $this->registry->configuration->getSetting( 'applications', 'mad', 'urlPrefix', '' );

        if ( $this->isLoginRequired && !$this->isAuthenticated ) {
            $result = new ezcMvcResult(  );
            $result->status = new ezcMvcExternalRedirect( $this->loginUrl );
            return $result;
        }

        if ( $this->isRoleRequired && !in_array( $this->userRole, $this->configuration['acceptedRoles'] ) ) {
            $result = new ezcMvcResult(  );

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
            
            $_SESSION['fatalRequest'] = $this->request;

            $result->status = new ezcMvcExternalRedirect(
                $prefix . $this->registry->configuration->getSetting( 'routes', 'mad.fatal', 'rails' )
            );
    
            return $result;
        }
    }

    public function postCreateResult( $result ) {
        $result->variables['isAuthenticated'] =& $this->isAuthenticated;
        $result->variables['user']            =& $this->request->variables['user'];
        $result->variables['loginUrl']        =& $this->loginUrl;
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
