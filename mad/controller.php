<?php

class madController extends ezcMvcController {
    public $controllers = array(  );
    public $composite = null;
    public $result = null;
    public $framework;
    public $request = null;
    public function __construct( $framework ) {
        $this->framework = $framework;
        $this->request = $framework->request;
        parent::__construct( $framework->action, $framework->request );
    }

    public function compose( $name, $controller ) {
        $controller->composite = $this;
        $this->controllers[$name] = $controller;
    }

    public function createResult() {
        $this->preCreateResult();

        foreach( $this->controllers as $controller ) {
            $controller->result = $this->result;
            $break = $controller->preCreateResult(  );

            if ( $break ) {
                break;
            }
        }
        
        if ( ! $break ) {
            $result = parent::createResult(  );
        }

        foreach( $this->controllers as $controller ) {
            $controller->postCreateResult(  );
        }

        $this->postCreateResult(  );

        return $this->result;
    }

    public function preCreateResult(  ) {
        $this->result = new ezcMvcResult;
        $this->result->content = new ezcMvcResultContent;
        $this->result->variables['contexts'] = array(
            $this->framework->routeConfiguration['META']['application'] . '.' . $this->framework->routeConfiguration['name'],
            $this->framework->routeConfiguration['META']['application'],
            $this->framework->routeConfiguration['name'],
        );
        $this->framework->result = $this->result;
    }

    public function postCreateResult(  ) {
    }

    public function t( $key, $dictionnary = null, $contexts = array() ) {
        if ( !is_array( $contexts ) ) {
            $contexts = array( $contexts );
        }
        $contexts = array_merge( $contexts, $this->result->variables['contexts'] );

        if ( is_null( $dictionnary ) && isset( $this->object ) ) {
            $dictionnary = $this->object->flatten( false );
        }

        if ( is_null( $dictionnary ) && isset( $this->form ) ) {
            $dictionnary = $this->form;
        }

        $message = ucfirst( madFramework::translate( $key, $dictionnary, $contexts ) );

        return $message;
    }

    public function addMessage( $key, $dictionnary = null, $contexts = array() ) {
        $message = $this->t( $key, $dictionnary, $contexts );

        if ( !isset( $_SESSION['messages'] ) ) {
            $_SESSION['messages'] = array();
        }

        $_SESSION['messages'][] = $message;
    }
    
    public function redirectToReferer() {
        $this->result->status = new ezcMvcExternalRedirect(
            $_SERVER['HTTP_REFERER']
        );
    }

    public function routeRedirect( $name, $arguments ) {
        $this->result->status = new ezcMvcExternalRedirect( madFramework::url(
            $name,
            $arguments
        ) );
    }

    public function doVoid() {
        
    }
}

