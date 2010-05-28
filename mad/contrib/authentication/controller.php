<?php

class madAuthenticationController extends madController {
    public $isAuthenticated = false;
    public $isRoleRequired = false;
    public $loginUrl = '';
    public $isLoginRequired = false;
    public $userRole = false;

    public function __construct( $framework ) {
        parent::__construct( $framework );

        $this->isAuthenticated = isset( $this->request->variables['user'] ) && isset( $this->request->variables['user']['id'] );
        $this->isRoleRequired = isset( $this->framework->routeConfiguration['acceptedRoles'] );
        $this->loginUrl = madFramework::instance()->configuration->getSetting( 'applications', 'authentication', 'loginUrl' );
        $this->isLoginRequired = ( isset( $this->framework->routeConfiguration['loginRequired'] ) && $this->framework->routeConfiguration['loginRequired'] ) || $this->isRoleRequired;
        $this->userRole = $this->isAuthenticated && isset( $this->request->variables['user']['role'] ) ? $this->request->variables['user']['role'] : null;
    }
    
    public function preCreateResult(  ) {
        $prefix = $this->framework->urlPrefix;

        if ( $this->isLoginRequired && !$this->isAuthenticated ) {
            $this->result->status = new ezcMvcExternalRedirect( $this->loginUrl );
            return true;
        }

        if ( $this->isRoleRequired && !in_array( $this->userRole, $this->framework->routeConfiguration['acceptedRoles'] ) ) {
            $dictionnary = array_merge(
                array(
                    'acceptedRoles' => implode( ', ', $this->framework->routeConfiguration['acceptedRoles'] ),
                ),
                (array)$this->request->variables['user']
            );

            $_SESSION['fatalMessage'] = $this->t( 'insuficientRolePlural', $dictionnary );

            $_SESSION['fatalSolutions'] = $this->t( 'insuficientRoleSolutions', $dictionnary );
            
            $_SESSION['fatalRequest'] = $this->request;

            $this->result->status = new ezcMvcExternalRedirect(
                $prefix . $this->framework->configuration->getSetting( 'routes', 'mad.fatal', 'rails' )
            );
    
            return true;
        }
    }

    public function postCreateResult(  ) {
        $this->result->variables['isAuthenticated'] =& $this->isAuthenticated;
        $this->result->variables['user']            =& $this->request->variables['user'];
        $this->result->variables['loginUrl']        =& $this->loginUrl;
    }

    public function doRoleError(  ) {
        $result->variables['role'] = $this->framework->routeConfiguration['acceptedRoles'];
    }

    public function doLoginRedirect(  ) {
        $prefix = $this->framework->configuration->getSetting( 'applications', 'mad', 'urlPrefix' );

        $result->status = new ezcMvcExternalRedirect(
            $this->framework->configuration->getSetting( 'applications', 'authentication', 'loginUrl' )
        );
    }
}

?>
