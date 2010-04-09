<?php

class madModelController extends ezcMvcController {
    public $registry = null;
    
    public function __construct( $action, ezcMvcRequest $request ) {
        parent::__construct( $action, $request );
        $this->registry = madRegistry::instance(  );
    }

    public function doList() {
        $filter = new madBase();

        if ( isset( $this->request->variables['filter'] ) ) {
            foreach( $this->request->variables['filter'] as $key => $value ) {
                $filter[$key] = $value;
            }
        }
        
        $objectList = $this->registry->model->load( $filter );

        if ( isset( $this->request->variables['distinct'] ) ) {
            $attribute = $this->request->variables['distinct'];
            $unst = array(  );
            $seen = array(  );

            foreach( $objectList as $key => $object ) {
                if ( !in_array( $object[$attribute], $seen ) ) {
                    $seen[] = $object[$attribute];
                } else {
                    $unst[] = $key;
                }
            }

            foreach( $unst as $key ) {
                unset( $objectList[$key] );
            }
        }

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
        $form->valid  = true;
        
        // get and set the form configuration
        $form->setOptions( $this->getFormOptions( $form ) );

        // get the object
        if ( isset( $this->id ) ) {
            $form['id'] = $this->id;
            $this->registry->model->refresh( $form );
        }

        // process options
        foreach( $form->fields->options as $name => $field ) {
            // hard coded values
            if ( isset( $field->value ) ) {
                $form[$name] = $field->value;
                continue;
            }

            // autocomplete have an "hidden" value
            if ( isset( $field->widget ) && isset( $field->widget->class ) ) {
                if ( $field->widget->class == 'autocomplete' ) {
                    if ( !isset( $form[$name] ) ) {
                        $field->widget->actualValue  = '';
                        $field->widget->displayValue = '';
                    } else {
                        if ( isset( $field->widget->attribute ) ) {
                            $field->widget->actualValue  = $form[$name];
                            $field->widget->displayValue = $form[$name];
                        } else { // assume relation
                            $field->widget->actualValue  = $form[$name][$field->widget->actualAttribute];
                            $field->widget->displayValue = $form[$name][$field->widget->displayAttribute];
                        }
                    }
                }
            }
        }
        
        if ( isset( $form->formsets ) ) {
            foreach( $form->formsets->options as $name => $formset ) {
                if ( isset( $form[$name] ) && $form[$name]->isEntity ) {
                    // there is only one related object, and the model couldn't 
                    // know that it is supposed to be an M2M relation. 
                    // Monkey-fix it.
                    $form[$name] = new madBase( array( $form[$name] ) );
                }
            }
        }

        if ( isset( $form->multipleFields ) ) {
            foreach( $form->multipleFields->options as $name => $multipleField ) {
                if ( isset( $form[$name] ) && ! $form[$name] instanceof madBase ) {
                    // there is only one value, and the model couldn't 
                    // know that it is supposed to be a multi value field.
                    // Monkey-fix it.
                    $form[$name] = new madBase( array( $form[$name] ) );
                }
            }
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

            // handle file uploads, the dirty way, which does not support files 
            // in formsets
            $uploadDir = APP_PATH . DIRECTORY_SEPARATOR . 'upload';
            if ( !is_dir( $uploadDir ) ) {
                mkdir( $uploadDir, 0750, true );
            }

            foreach( $form->fields->options as $fieldName => $field ) {
                if ( !isset( $field->widget ) )        continue;
                if ( !isset( $field->widget->class ) ) continue;
                if ( $field->widget->class != 'file' ) continue;
                
                $file     = $this->request->files[str_replace( '.', '_', $form->name )][$fieldName];

                if ( !$file->tmpPath ) { // check if a file was actually submitted
                    if ( isset( $field->required ) && $field->required == true ) {
                        // create the error if this field is required
                        $form->valid = false;
                        
                        if ( !isset( $field->errors ) ) {
                            $field->errors = new madBase(  );
                        }

                        $field->errors['required'] = 'no file';
                    }

                    continue;
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

                $form[$fieldName] = $relative;
            }
            
            $form->clean();

            // required fields
            foreach( $form->fields->options as $fieldName => $field ) {
                if ( isset( $field->required ) && $field->required == true ) {
                    if ( !isset( $form[$fieldName] ) || !$form[$fieldName] ) {
                        $form->valid = false;

                        if ( !isset( $field->errors ) ) {
                            $field->errors = new madBase();
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
                        foreach( $form[$name] as $formsetKey => $formsetForm ) {
                            foreach( $formset->fields->options as $fieldName => $field ) {
                                if ( isset( $field->required ) && $field->required == true ) {
                                    if ( !isset( $formsetForm[$fieldName] ) || !$formsetForm[$fieldName] ) {
                                        $form->valid = false;

                                        if ( !isset( $field->errors ) ) {
                                            $field->errors = new madBase;
                                        }

                                        if ( !isset( $field->errors[$formsetKey] ) ) {
                                            $field->errors[$formsetKey] = new madBase;
                                        }
                                        
                                        $field->errors[$formsetKey]['required'] = 'empty value';
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // check if something is *really* wrong ( prorgamming error )
            $dirty = $form->dirtyAttributes(  );
            if ( $dirty !== false ) {
                var_dump( $dirty );

            } elseif( $form->valid ) { // save if there is no errors
                $this->registry->model->save( $form );
                $prefix = $this->registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );

                $result->status = new ezcMvcExternalRedirect( 
                    $prefix . $this->registry->router->generateUrl( 
                        $this->successRoute,
                        (array) $form
                    ) 
                );
            }
        }

        // add the form to result variables for reuse in the template
        $result->variables['form'] = $form;
        return $result;
    }

    public function doAttributeAutocomplete(  ) {
        $result = $this->doList();
        $values = array(  );
        
        $attributeName = $this->request->variables['attribute'];

        foreach( $result->variables['objectList'] as $object ) {
            if ( !isset( $object[$attributeName] ) ) {
                continue;
            }

            if ( in_array( $object[$attributeName], $values ) ) {
                continue;
            }

            $values[] = $object[$attributeName];
        }

        $result->variables['autocompleteValues'] = $values;
        return $result;
    }

    public function doAutocomplete(  ) {
        $result = $this->doList(  );

        $result->variables['valueAttribute'] = $this->request->variables['valueAttribute'];
        $result->variables['displayAttribute'] = $this->request->variables['displayAttribute'];

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
