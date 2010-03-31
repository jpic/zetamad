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
        $result       = new ezcMvcResult(  );
        
        $form         = new madBase(  );
        $form->name   = $this->request->variables['form'];
        $form->action = $this->request->uri;
        $form->model  = $this->registry->model;
               
        // get and set the form configuration
        // it *must* be called *before* refresh() or relations will fail
        $form->setOptions( $this->registry->configuration->settings['forms'][$form->name] );
        $form['namespace'] = $form->fields->namespace->value;
        
        // make/get the object
        if ( isset( $this->id ) ) {
            $form['id'] = $this->id;
            $this->registry->model->refresh( $form );
        }

        // save the form
        if ( $this->request->protocol == 'http-post' ) {
            $form->merge( $this->request->variables );
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
