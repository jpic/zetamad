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

    public function processFormFieldOptions( madBase $form, $name, madBase $field ) {
        // hard coded values
        if ( isset( $field->value ) ) {
            $form[$name] = $field->value;
            return;
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

                return true;
            }

            if ( $field->widget->class == 'file' ) {
                $uploadDir = APP_PATH . DIRECTORY_SEPARATOR . 'upload';

                $file = $this->request->files[str_replace( '.', '_', $form->name )][$name];

                if ( !$file->tmpPath ) { // check if a file was actually submitted
                    if ( isset( $field->required ) && $field->required == true && !( isset( $form[$name] ) && $form[$name] ) ) {
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

                $form[$name] = $relative;
                return true;
            }
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
        }
    }

    public function processOptions( madBase $form ) {
        foreach( $form->fields->options as $name => $field ) {
            $this->processFormFieldOptions( $form, $name, $field );
        }
        
        if ( isset( $form->formsets ) ) {
            foreach( $form->formsets->options as $name => $formset ) {
                if ( isset( $form[$name] ) && $form[$name]->isEntity ) {
                    // there is only one related object, and the model couldn't 
                    // know that it is supposed to be an M2M relation. 
                    // Monkey-fix it.
                    $form[$name] = new madBase( array( $form[$name] ) );
                }

                if ( !isset( $form[$name] ) || !$form[$name] ) {
                    // there is no data bound to the formset
                    // create an empty formset
                    $emptyFormset = new madBase(  );
                    $form[$name]  = new madBase( array( $emptyFormset ) );
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
                if ( isset( $form[$name] ) && ! ( $form[$name] instanceof madBase && ! $form[$name]->isEntity ) ) {
                    // there is only one value, and the model couldn't 
                    // know that it is supposed to be a multi value field.
                    // Monkey-fix it.
                    $form[$name] = new madBase( array( $form[$name] ) );
                }

                if ( !isset( $form[$name] ) || !$form[$name] ) {
                    // there is no data in the multiple field
                    // create an empty one
                    $emptyValue  = '';
                    $form[$name] = new madBase( array( $emptyValue ) );
                }

                foreach( $form[$name] as $key => $value ) {
                    // make a field for each value
                    if ( !isset( $multipleField->fields ) ) {
                        $multipleField->fields = new madBase(  );
                    }

                    if ( !isset( $multipleField->fields->$key ) ) {
                        $multipleField->fields->$key = new madBase(  );
                    }

                    // copy options on the field
                    $multipleField->fields->$key->setOptions( $multipleField->options );
                    $this->processFormFieldOptions( $form[$name], $key, $multipleField->fields->$key );
                }
            }
        }
    }

    public function validate( madBase $form ) {
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
                    foreach( $form[$name] as $boundFormset ) {
                        if ( !$boundFormset->options ) {
                            $boundFormset->options =& $formset->options;
                        }

                        foreach( $boundFormset->fields->options as $fieldName => $field ) {
                            if ( isset( $field->required ) && $field->required == true ) {
                                if ( !isset( $boundFormset[$fieldName] ) || !$boundFormset[$fieldName] ) {
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
                    }
                }
            }
        }
    }

    public function processDeleteFields( madBase $form ) {
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
        $this->processOptions( $form );

        // save the form
        if ( $this->request->protocol == 'http-post' ) {
            $form->merge( $this->request->variables[str_replace( '.', '_', $form->name)] );

            // handle special field names with "DELETE"
            $this->processDeleteFields( $form );

            // clean empty/null values
            $form->clean();

            // check for errors
            $this->validate( $form );

            // process options again with the new data, autocomplete, hard 
            // coded values, slugs ...
            $this->processOptions( $form );

            // check if something is *really* wrong ( prorgamming error )
            $dirty = $form->dirtyAttributes(  );
            if ( $dirty !== false ) {
                var_dump( $dirty );

            } elseif( $form->valid ) { // save if there is no errors
                $this->registry->model->save( $form );

                // redirect to successRoute
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

        $object = new madBase( array(
            'id' => $id,
        ) );
        $this->registry->model->refresh( $object );

        $result = new ezcMvcResult(  );
        $result->variables['object'] = $object;
        return $result;
    }

    public function cleanFormsets( madBase $form ) {
        // do nothing
    }
}

?>
