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

    protected function getFormOptions( madBase $form ) {
        return $this->registry->configuration->settings['forms'][$form->name];
    }

    public function doForm(  ) {
        $result       = new ezcMvcResult(  );

        $form         = new madBase(  );
        $form->name   = $this->request->variables['form'];
        $form->action = $this->request->uri;
        $form->model  = $this->registry->model;
               
        // get and set the form configuration
        // it *must* be called *before* refresh() or relations will fail
        $form->setOptions( $this->getFormOptions( $form ) );

        // process options
        foreach( $form->fields->options as $name => $field ) {
            // hard coded values
            if ( isset( $field->value ) ) {
                $form[$name] = $field->value;
            }

            if ( isset( $field->widget ) && isset( $field->widget->class ) ) {
                switch( $field->widget->class ) {
                    case 'autocomplete':
                        $field->choices = $this->registry->model->getAttributeValues( $name );
                }
            }
        }
        
        // make/get the object
        if ( isset( $this->id ) ) {
            $form['id'] = $this->id;
            $this->registry->model->refresh( $form );
        }

        // save the form
        if ( $this->request->protocol == 'http-post' ) {
            $form->merge( $this->request->variables[str_replace( '.', '_', $form->name)] );
            
            // handle delete of related objects
            if ( isset( $form->formsets ) ) {
                foreach( $form->formsets->options as $name => $formset ) {
                    $deletes = array(  );

                    foreach( $form[$name] as $key => $related ) {
                        if ( isset( $related['DELETE'] ) ) {
                            // unsetting the related object here would break 
                            // the idiot php array pointer and raise a runtime 
                            // exception
                            $deletes[] = $key;
                        }
                    }
                    
                    foreach( $deletes as $key ) {
                        $delete = $form[$name][$key];
                        // delete from database
                        $this->registry->model->delete( $delete );
                        // delete from object
                        unset( $form[$name][$key] );
                    }
                }
            }
            
            $form->clean();
            $dirty = $form->dirtyAttributes(  );
            if ( $dirty !== false ) {
                var_dump( $dirty );
            } else {
                $this->registry->model->save( $form );
                $prefix = $this->registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );

                $result->status = new ezcMvcExternalRedirect( 
                    $prefix . $this->registry->router->generateUrl( 'recipe.details', array( 
                        'id' => $form['id'],
                    ) 
                ) );
            }
        }

        // add the form to result variables for reuse in the template
        $result->variables['form'] = $form;
        return $result;
    }

    public function doAutocomplete(  ) {

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
