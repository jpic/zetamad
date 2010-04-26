<?php

class madModelController extends madController {
    public $registry = null;
    
    public function __construct( $action, ezcMvcRequest $request ) {
        parent::__construct( $action, $request );
        $this->registry = madRegistry::instance(  );
    }

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

    /**
     * Returns the configuration corresponding to the form name.
     * 
     * @param madModelObject $form 
     * @return array
     */
    protected function getFormOptions( madModelObject $form ) {
        return $this->registry->configuration->settings['forms'][$form->name];
    }

    /**
     * Processes options for a named field of a form.
     *
     * If $field has a 'value' option, then $form[$name] is set to 
     * $field->value and the function returns. Typically this may be used for a 
     * namespace attribute which should have an arbitary value.
     * 
     * If a field has a 'slugify' option which corresponds to an attribute key, 
     * then that attribute value will be slugified and set to $form[$name], if 
     * it does not have a valeu.
     *
     * If the field widget class is "file" then the uploaded file will be 
     * copied to APP_PATH/upload, and its relative path will be set to $form[$name]. 
     * If a file with that name already exists, it will append an underscore to 
     * its basename.
     *
     * @param madModelObject $form 
     * @param mixed $name 
     * @param madModelObject $field 
     * @return void
     */
    public function processFormFieldOptions( madModelObject $form, $name, madModelObject $field ) {
        // hard coded values
        if ( isset( $field->value ) ) {
            $form[$name] = $field->value;
            return;
        }

        if ( isset( $field->slugify ) && isset( $form[$field->slugify] ) && !isset( $form[$name] ) ) {
            $slug = preg_replace('~[^\\pL\d]+~u', '-', $form[$field->slugify]);
            $slug = trim($slug, '-');
            // transliterate
            if (function_exists('iconv'))
            {
                $slug = iconv('utf-8', 'us-ascii//TRANSLIT', $slug);
            }
            // lowercase
            $slug = strtolower($slug);
            // remove unwanted characters
            $slug = preg_replace('~[^-\w]+~', '', $slug);

            // ensure it is unique
            $stmt = $this->registry->database->query( "select id from mad_model where attribute_key = '" . $name . "' and attribute_value = '" . $slug . "'" );
            while( intval( $stmt->rowCount(  ) ) > 0 ) {
                $slug .= '-';
                $stmt = $this->registry->database->query( "select id from mad_model where attribute_key = '" . $name . "' and attribute_value = '" . $slug . "'" );
            }

            $form[$name] = $slug;

            return true;
        }

        // select fields need choices option
        if ( isset( $field->widget ) && $field->widget == 'select' ) {
            $choices = array(  );

            // from query?
            if ( isset( $field->query ) ) {
                foreach( $this->registry->model->queryLoad( $field->query ) as $object ) {
                    $choices[$object[$field->valueAttribute]] = $object[$field->displayAttribute];
                }
            }

            $field->choices = $choices;

            return true;
        }

        // handle date => now
        if ( isset( $field->date ) && $field->date == 'now' ) {
            $form[$name] = date( 'Y-m-d' );

            return true;
        }

        if ( isset( $field->widget ) ) {
            if ( $field->widget == 'file' && $this->request->protocol == 'http-post' ) {
                $uploadDir = APP_PATH . DIRECTORY_SEPARATOR . 'upload';

                $file = $this->request->files[str_replace( '.', '_', $form->name )][$name];

                if ( !$file->tmpPath ) { // check if a file was actually submitted
                    // todo: move to validate(  );
                    //if ( isset( $field->required ) && $field->required == true && !( isset( $form[$name] ) && $form[$name] ) ) {
                        //// create the error if this field is required
                        //$form->valid = false;
                        
                        //if ( !isset( $field->errors ) ) {
                            //$field->errors = new madModelObject(  );
                        //}

                        //$field->errors['required'] = 'no file';
                    //}

                    return true;
                }

                if ( !file_exists( $file->tmpPath ) ) { // check if a file was already moved
                    return true;
                }

                $relative = $file->name;
                $uploadTo = $uploadDir . DIRECTORY_SEPARATOR . $relative;
                
                $i = 1;
                while ( file_exists( $uploadTo ) ) {
                    $info = pathinfo( $uploadTo );
                    $relative = $info['filename'] . str_repeat( '_', $i ) . '.' . $info['extension'];
                    $uploadTo = $uploadDir . DIRECTORY_SEPARATOR . $relative;
                    $i++;
                }
                unset( $i );

                if ( !move_uploaded_file( $file->tmpPath, $uploadTo ) ) {
                    throw new Exception( "Could not move uploaded file to $uploadTo" );
                }

                $form[$name] = $relative;
                return true;
            }
        }
    }

    /**
     * Monkey fix formsets, multiFields, prepare fields, and call 
     * processFormFieldOptions() on every fields - be it normal form fields, 
     * formset fields or multipleFields.
     * 
     * @param madModelObject $form 
     * @return void
     */
    public function processOptions( madModelObject $form ) {
        foreach( $form->fields->options as $name => $field ) {
            $this->processFormFieldOptions( $form, $name, $field );
        }
        
        if ( isset( $form->formsets ) ) {
            foreach( $form->formsets->options as $name => $formset ) {
                if ( isset( $form[$name] ) && $form[$name]->isEntity ) {
                    // there is only one related object, and the model couldn't 
                    // know that it is supposed to be an M2M relation. 
                    // Monkey-fix it.
                    $form[$name] = new madModelObject( array( $form[$name] ) );
                }

                if ( !isset( $form[$name] ) || !$form[$name] ) {
                    // there is no data bound to the formset
                    // create an empty formset
                    $emptyFormset = new madModelObject(  );
                    $emptyFormset->empty = true;
                    $form[$name]  = new madModelObject( array( $emptyFormset ) );
                }

                foreach( $form[$name] as $boundFormset ) {  
                    // copy formset options to bound formset
                    $boundFormset->setOptions( $formset->options );

                    foreach( $boundFormset->fields->options as $name => $field ) {
                        $this->processFormFieldOptions( $boundFormset, $name, $field );
                    }
                }
            }
        }

        if ( isset( $form->multipleFields ) ) {
            foreach( $form->multipleFields->options as $name => $multipleField ) {
                if ( isset( $form[$name] ) && ! ( $form[$name] instanceof madModelObject && ! $form[$name]->isEntity ) ) {
                    // there is only one value, and the model couldn't 
                    // know that it is supposed to be a multi value field.
                    // Monkey-fix it.
                    $form[$name] = new madModelObject( array( $form[$name] ) );
                }

                if ( !isset( $form[$name] ) || !$form[$name] ) {
                    // there is no data in the multiple field
                    // create an empty one
                    $emptyValue  = '';
                    $form[$name] = new madModelObject( array( $emptyValue ) );
                }

                foreach( $form[$name] as $key => $value ) {
                    // make a field for each value
                    if ( !isset( $multipleField->fields ) ) {
                        $multipleField->fields = new madModelObject(  );
                    }

                    if ( !isset( $multipleField->fields->$key ) ) {
                        $multipleField->fields->$key = new madModelObject(  );
                    }

                    // copy options on the field
                    $multipleField->fields->$key->setOptions( $multipleField->options );
                    $this->processFormFieldOptions( $form[$name], $key, $multipleField->fields->$key );
                }
            }
        }
    }

    public function validate( madModelObject $form ) {
        // required fields
        foreach( $form->fields->options as $fieldName => $field ) {
            if ( isset( $field->required ) && $field->required == true ) {
                if ( !isset( $form[$fieldName] ) || !$form[$fieldName] ) {
                    $form->valid = false;

                    if ( !isset( $field->errors ) ) {
                        $field->errors = new madModelObject();
                    }

                    if ( !isset( $field->errors['required'] ) ) {
                        $field->errors['required'] = 'empty value';
                    }
                }
            }
        }
        if ( isset( $form->formsets ) ) {
            foreach( $form->formsets->options as $name => $formset ) {
                if ( isset( $form[$name] ) ) {
                    foreach( $form[$name] as $boundFormset ) {
                        if ( !$boundFormset->options ) {
                            $boundFormset->options =& $formset->options;
                        }

                        foreach( $boundFormset->fields->options as $fieldName => $field ) {
                            if ( isset( $field->required ) && $field->required == true ) {
                                if ( !isset( $boundFormset[$fieldName] ) || !$boundFormset[$fieldName] ) {
                                    $form->valid = false;
            
                                    if ( !isset( $field->errors ) ) {
                                        $field->errors = new madModelObject();
                                    }
            
                                    if ( !isset( $field->errors['required'] ) ) {
                                        $field->errors['required'] = 'empty value';
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
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

    public function clean( madModelObject $form ) {
        // do normal clean, to wipe out empty values
        $form->clean(  );

        // remove any formset which only has hard coded value,
        // thus: no input

        if ( isset( $form->formsets ) ) {
            foreach( $form->formsets->options as $name => $formset ) {
                $unst = array(  );

                foreach( $form[$name] as $boundFormsetKey => $boundFormset ) {
                    $kill = true;
                    foreach( $boundFormset as $key => $value ) {
                        if ( !isset( $formset->fields->$key ) || !isset( $formset->fields->$key->value ) ) {
                            $kill = false;
                        }
                    }
                    if ( $kill ) {
                        $unst[] = $boundFormsetKey;
                    }
                }

                foreach( $unst as $key ) {
                    unset( $form[$name][$key] );
                }
            }
        }

        // do normal clean, to wipe out empty formset containers
        $form->clean(  );
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

    public function cleanFormsets( madModelObject $form ) {
        // do nothing
    }
}

?>
