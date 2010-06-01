<?php

abstract class madController extends ezcMvcController {
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
    }

    public function postCreateResult(  ) {
    }

    public function t( $key, $dictionnary = null ) {
        $message = $this->registry->locale->getMessageSetting( 
            $key,
            $this->request->accept->languages,
            $this->result->variables['contexts']
        );

        if ( $dictionnary ) {
            if ( is_array( $message ) ) {
                foreach( $message as $key => $value ) {
                    $message[$key] = madFramework::dictionnaryReplace( $value, $dictionnary );
                }
            } else {
                $message = madFramework::dictionnaryReplace( $message, $dictionnary );
            }
        }

        return $message;
    }
}


?>
