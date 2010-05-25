<?php

abstract class madController extends ezcMvcController {
    public $configuration = array(  );
    public $registry = null;
    public $controllers = array(  );
    public $composite = null;
    public $result = null;
    public function __construct( $action = null, ezcMvcRequest $request = null, &$configuration = null ) {
        if ( !is_null( $request ) ) {
            parent::__construct( $action, $request );
        }
        $this->registry = madFramework::instance(  );
        $this->configuration =& $configuration;
    }

    public function compose( $name, $controller ) {
        $controller->composite = $this;
        $this->controllers[$name] = $controller;
    }

    public function prepareResult(  ) {
        $this->result = new ezcMvcResult;
        $this->result->content = new ezcMvcResultContent;
        $this->result->variables['contexts'] = array(
            $this->configuration['META']['application'] . '.' . $this->configuration['name'],
            $this->configuration['META']['application'],
            $this->configuration['name'],
        );
    }

    public function createResult() {
        $this->prepareResult(  );
        
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
        return false;
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
