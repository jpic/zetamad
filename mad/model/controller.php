<?php

class madModelController extends ezcMvcController {
    public $registry = null;
    
    public function __construct( $action, ezcMvcRequest $request ) {
        parent::__construct( $action, $request );
        $this->registry = madRegistry::instance(  );
    }

    public function doList() {
        $filter = new madBase();
        foreach( $this->request->variables as $key => $value ) {
            if ( strpos( $key, 'filter__' ) === 0 ) {
                $name = substr(
                    $key,
                    strlen( 'filter__' )
                );
                $filter[$name] = $value;
            }
        }

        $objectList = $this->registry->model->load( $filter );

        $result = new ezcMvcResult(  );
        $result->variables['objectList'] = $objectList;
        $result->variables['filter']     = $filter;
        return $result;
    }

    public function doForm(  ) {
        $result = new ezcMvcResult(  );
        // get the form configuration
        $formName = $this->request->variables['form'];
        $formConfiguration = $this->registry->configuration->settings['forms'][$formName];
        $formNamespaceFieldValue = $formConfiguration['fields']['namespace']['value'];

        // make/get the object
        $object = new madBase();
        if ( isset( $this->id ) ) {
            $object['id'] = $this->id;
            $this->registry->model->refresh( $object );
        }

        // add namespace if required
        if ( !isset( $object['namespace'] ) ) {
            $object['namespace'] = $formNamespaceFieldValue;
        } else { // check the namespace
            if ( $object['namespace'] != $formNamespaceFieldValue ) {
                throw new Exception(
                     "The form namespace field value '{$formNamespaceFieldValue}' is different from the object namespace {$object['namespace']}!"
                );
            }
        }

        // add the object to result variables for reuse in the template
        $result->variables['object'] = $object;
        // add the form configuration to result variables
        $result->variables['formConfiguration'] = $formConfiguration;

        // prepare whatever the form needs to render
        foreach( $formConfiguration['fields'] as $name => $field ) {
            if ( $field['widget'] == 'autocomplete' ) {
                // fill $field['choices'] with existing values
                $field['choices'] = $this->registry->model->getAttributeValues( $name );
            }
        }

        // save the object
        if ( $this->request->protocol == 'http-post' ) {
            foreach( $formConfiguration['fields'] as $name => $field ) {
                if ( $_POST[$name] ) {
                    $object[$name] = $_POST[$name];
                }
            }
            $this->registry->model->save( $object );
        }

        return $result;
    }

    public function doDetails(  ) {
        $object = new madBase( array( 
            'id' => $this->id,
        ) );

        $this->registry->model->refresh( $object );

        $result = new ezcMvcResult(  );
        $result->variables['object'] = $object;
        return $result;
    }
}

?>
