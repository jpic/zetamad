<?php

class madModelController extends madFormController {
    public function doList() {       
        $result = new ezcMvcResult(  );
        $query = $this->configuration['query'];
        $paginate = isset( $this->configuration['paginate'] ) ? intval( $this->configuration['paginate'] ) : false;
        
        if ( $paginate ) {
            $totalObjectsSql = preg_replace( '/^select (.*)? from/i', 'SELECT count(id) FROM', $query );
            $totalObjects = $this->registry->model->query( $totalObjectsSql )->fetchColumn(  );
            $lastPage = ceil( $totalObjects / $paginate );

            $currentPage = isset( $this->request->variables['page'] ) ? intval( $this->request->variables['page'] ) : 1;
            if ( $currentPage > $lastPage ) {
                $currentPage = $lastPage;
            }
            if ( $currentPage < 1 ) {
                $currentPage = 1;
            }

            $query .= sprintf( 
                ' LIMIT %s, %s',
                ( $currentPage - 1 ) * $paginate,
                $paginate
            );

            $result->variables['paginate']    = $paginate;
            $result->variables['currentPage'] = $currentPage;
            $result->variables['lastPage']    = $lastPage;
        } 
        $objectList = $this->registry->model->queryLoad( $query );

        $result->variables['objectList'] = $objectList;

        return $result;
    }

    public function processDeleteFields( madModelObject $form ) {
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

        // handle delete of multiple values
        if ( isset( $form->multipleFields ) ) {
            foreach( $form->multipleFields->options as $name => $field ) {
                if ( !isset( $form[$name . '.DELETE'] ) ) {
                    continue;
                }

                foreach( $form[$name . '.DELETE'] as $key ) {
                    unset( $form[$name][$key] );
                }
                
                unset( $form[$name . '.DELETE'] );
            }
        }
    }

    public function slugify( $string ) {
        $slug = parent::slugify( $string );

        // ensure it is unique
        $stmt = $this->registry->database->query( "select id from mad_model where attribute_key = '" . $name . "' and attribute_value = '" . $slug . "'" );
        while( intval( $stmt->rowCount(  ) ) > 0 ) {
            $slug .= '-';
            $stmt = $this->registry->database->query( "select id from mad_model where attribute_key = '" . $name . "' and attribute_value = '" . $slug . "'" );
        }

        return $slug;
    }

    /**
     * Generic and configurable form action.
     * 
     * A madModelObject is instanciated which represents the current data to edit. Its 
     * options are set from the result of getFormOptions() method. It will use 
     * the configuration by default, see the method docblock for more details.
     *
     * If the request as an 'id' parameter, then data is loaded into the form 
     * object.
     *
     * Form options are then processed by processOptions() method. It should 
     * fix inconsistencies and call processFormFieldOptions() for each field, 
     * be it multiple fields, formset fields and regular fields. See the method 
     * docblock for more details.
     *
     * If the request HTTP method is POST, then some request variables will be 
     * merged to the form object, for example if the form name is "fooApp.barForm" 
     * then request variables in the "fooApp_barForm" are merged in the form. 
     * So:
     * <code>
     * $form = new madModelObject( array( 
     *     'foo' => 'bar',
     * ) );
     * $form->name = 'fooApp.barForm';
     *
     * $request = array( 
     *     'fooApp_barForm' => array( 
     *         'foo' => 'test'
     *     ),
     * );
     *
     * // $request['fooApp_barForm'] will be merged into $form and $form['foo'] 
     * // will be set to 'test'.
     * </code>
     *
     * If the request HTTP method is POST, then the controller method 
     * processDeleteFields() will handle and remove special input field names 
     * which contain word "DELETE". They are used for multipleFields and 
     * formsets, allowing to delete values. See docblock for method 
     * processDeleteFields() for details.
     *
     * If the request HTTP method is POST, the madModelObject method clean() will be 
     * called to remove all empty values. See madModelObject clean() method for 
     * details.
     *
     * If the request HTTP method is POST, the validate() method will be 
     * called. It is responsible for filling the $field->errors array option 
     * and switching $form->valid to false if any error is found. See validate()
     * docblock for details.
     *
     * If the request HTTP method is POST, then processOptions() will be called 
     * again to process the new data.
     *
     * If the request HTTP method is POST, then the madModelObject method 
     * dirtyAttributes() will be called to ensure that the the $form state is 
     * saveable, and badly die otherwise.
     *
     * If the request HTTP method is POST, and that the form is still valid 
     * after being merged, processed, cleaned .... Then $form is saved and the 
     * successRoute option is used to define the redirect URL.
     *
     * Otherwise, the visitor is not redirected and the form is displayed 
     * again.
     *
     * @return ezcMvcResult
     */
    public function doForm(  ) {
        $result       = new ezcMvcResult(  );

        $form         = new madModelObject(  );
        $form->name   = $this->configuration['form'];
        $form->action = $this->request->uri;
        $form->model  = $this->registry->model;
        $form->valid  = true;
        
        // get and set the form configuration
        $form->setOptions( $this->getFormOptions( $form ) );

        // get the object
        if ( isset( $this->id ) ) {
            $form['id'] = $this->id;
            $this->registry->model->refresh( $form );
        }

        // process options
        $this->processOptions( $form );

        // save the form
        if ( $this->request->protocol == 'http-post' ) {
            $form->merge( $this->request->variables[str_replace( '.', '_', $form->name)] );

            // handle special field names with "DELETE"
            $this->processDeleteFields( $form );

            // process options again with the new data, autocomplete, hard 
            // coded values, slugs ...
            $this->processOptions( $form );

            // remove everything we don't want to save
            $this->clean( $form );

            // check for errors
            // commented because it doesn't work well
            // $this->validate( $form );

            // check if something is *really* wrong ( prorgamming error )
            $dirty = $form->dirtyAttributes(  );
            if ( $dirty !== false ) {
                var_dump( $dirty );

            } else { // save if there is no errors
                $this->registry->model->save( $form );

                // redirect to successRoute
                $prefix = $this->registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );

                if ( isset( $this->request->variables['popup'] ) ) {
                    $result->variables['responseBody'] = sprintf( 
                        '<script type="text/javascript">opener.dismissAddAnotherPopup( window, "%s", "%s" );</script>',
                        $form[$this->request->variables['valueAttribute']],
                        $form[$this->request->variables['displayAttribute']]
                    );
                } else {
                    $result->status = new ezcMvcExternalRedirect( 
                        $prefix . $this->registry->router->generateUrl( 
                            $this->configuration['successRoute'],
                            (array) $form
                        ) 
                    );
                }
            }
        }

        // add the form to result variables for reuse in the template
        $result->variables['form'] = $form;
        return $result;
    }

    public function doAutocomplete(  ) {
        $result = $this->doList(  );

        if ( isset( $this->configuration['attribute'] ) ) {
            $result->variables['valueAttribute'] = $this->configuration['attribute'];
            $result->variables['displayAttribute'] = $this->configuration['attribute'];
        } else {
            $result->variables['valueAttribute'] = $this->request->variables['valueAttribute'];
            $result->variables['displayAttribute'] = $this->request->variables['displayAttribute'];
        }

        return $result;
    }

    public function doDetails(  ) {
        if ( !isset( $this->id ) ) {
            $sql = sprintf( '
                select 
                    %s as id
                from mad_model 
                where ',
                madModel::DECODE_ID_ENTITY
            );
            $sql.= "attribute_key = 'slug' and attribute_value = :slug";
            $stmt = $this->registry->database->prepare( $sql );
            $stmt->execute( array( 'slug' => $this->slug ) );
            $id = $stmt->fetchColumn( 0 );
        } else {
            $id = $this->id;
        }

        $object = new madModelObject( array(
            'id' => $id,
        ) );
        $this->registry->model->refresh( $object );

        $result = new ezcMvcResult(  );
        $result->variables['object'] = $object;
        return $result;
    }

}

?>
