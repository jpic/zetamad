<?php

class madFormController extends madController {

    public function setFormOptions( madObject $form, $merged ) {
        $options = $this->registry->configuration['forms'][$form->name];
        $form->setOptions( $options );
    }

    public function doForm(  ) {
        $result       = new ezcMvcResult(  );

        $form         = new madModelObject(  );
        $form->name   = $this->configuration['form'];
        $form->action = $this->request->uri;
        $form->model  = $this->registry->model;
        $form->valid  = true;
        
        // add the form to result variables for reuse in the template
        $result->variables['form'] = $form;
        
        // get and set the form configuration
        $this->setFormOptions( $form, false );

        // process options
        $this->processOptions( $form );

        // save the form
        if ( $this->request->protocol == 'http-post' ) {
            $form->merge( $this->request->variables[str_replace( '.', '_', $form->name)] );

            // process options again with the new data, autocomplete, hard 
            // coded values, slugs ...
            $this->processOptions( $form, true );

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
                $this->formSuccess( $result, $form );
            }
        }

        return $result;
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
     * copied to ENTRY_APP_PATH/upload, and its relative path will be set to $form[$name]. 
     * If a file with that name already exists, it will append an underscore to 
     * its basename.
     *
     * @param madObject $form 
     * @param mixed $name 
     * @param madObject $field 
     * @return void
     */
    public function processFormFieldOptions( madObject $form, $name, madObject $field ) {
        // hard set default values unless an input widget was specified
        if ( isset( $field->default ) && !isset( $form[$name] ) && !isset( $field->widget ) ) {
            $form[$name] = $field->default;
        }

        // hard coded values
        if ( isset( $field->value ) ) {
            $form[$name] = $field->value;
            return;
        }

        if ( isset( $field->slugify ) && ( !isset( $form[$name] ) || !strlen( $form[$name] ) ) ) {
            
            if ( $field->slugify instanceof Traversable || is_array( $field->slugify ) ) {
                $parts = array(  );
                foreach( $field->slugify->options as $attribute ) {
                    if ( !isset( $form[$attribute] ) ) {
                        continue;
                    }

                    $parts[] = $form[$attribute];
                }

                $string = join( ' ', $parts );
            } else {
                if ( isset( $form[$field->slugify] ) ) {
                    $string = $form[$field->slugify];
                }
            }

            if ( isset( $string ) && trim( $string ) ) {
                $form[$name] = $this->slugify( $string, $name );
            }

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
            if ( $field->widget == 'file' ) {

                if ( $this->request->protocol == 'http-post' ) {
                    $uploadDir = ENTRY_APP_PATH . DIRECTORY_SEPARATOR . 'upload';
    
                    $file = $this->request->files[str_replace( '.', '_', $form->name )][$name];
    
                    if ( !$file->tmpPath ) { // check if a file was actually submitted
    
                        // todo: move to validate(  );
                        //if ( isset( $field->required ) && $field->required == true && !( isset( $form[$name] ) && $form[$name] ) ) {
                            //// create the error if this field is required
                            //$form->valid = false;
                            
                            //if ( !isset( $field->errors ) ) {
                                //$field->errors = new madObject(  );
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
    }

    /**
     * Monkey fix formsets, multiFields, prepare fields, and call 
     * processFormFieldOptions() on every fields - be it normal form fields, 
     * formset fields or multipleFields.
     * 
     * @param madObject $form 
     * @return void
     */
    public function processOptions( madObject $form ) {
        foreach( $form->fields->options as $name => $field ) {
            $this->processFormFieldOptions( $form, $name, $field );
        }
        
        if ( isset( $form->formsets ) ) {
            foreach( $form->formsets->options as $name => $formset ) {
                if ( isset( $form[$name] ) && $form[$name]->isEntity ) {
                    // there is only one related object, and the model couldn't 
                    // know that it is supposed to be an M2M relation. 
                    // Monkey-fix it.
                    $form[$name] = new madObject( array( $form[$name] ) );
                }

                if ( !isset( $form[$name] ) || !$form[$name] ) {
                    // there is no data bound to the formset
                    // create an empty formset
                    $emptyFormset = new madObject(  );
                    $emptyFormset->empty = true;
                    $form[$name]  = new madObject( array( $emptyFormset ) );
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
                if ( isset( $form[$name] ) && ! ( $form[$name] instanceof madObject && ! $form[$name]->isEntity ) ) {
                    // there is only one value, and the model couldn't 
                    // know that it is supposed to be a multi value field.
                    // Monkey-fix it.
                    $form[$name] = new madObject( array( $form[$name] ) );
                }

                if ( !isset( $form[$name] ) || !$form[$name] ) {
                    // there is no data in the multiple field
                    // create an empty one
                    $emptyValue  = '';
                    $form[$name] = new madObject( array( $emptyValue ) );
                }

                foreach( $form[$name] as $key => $value ) {
                    // make a field for each value
                    if ( !isset( $multipleField->fields ) ) {
                        $multipleField->fields = new madObject(  );
                    }

                    if ( !isset( $multipleField->fields->$key ) ) {
                        $multipleField->fields->$key = new madObject(  );
                    }

                    // copy options on the field
                    $multipleField->fields->$key->setOptions( $multipleField->options );
                    $this->processFormFieldOptions( $form[$name], $key, $multipleField->fields->$key );
                }
            }
        }
    }

    public function validate( madObject $form ) {
        // required fields
        foreach( $form->fields->options as $fieldName => $field ) {
            if ( isset( $field->required ) && $field->required == true ) {
                if ( !isset( $form[$fieldName] ) || !$form[$fieldName] ) {
                    $form->valid = false;

                    if ( !isset( $field->errors ) ) {
                        $field->errors = new madObject();
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
                                        $field->errors = new madObject();
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

    public function clean( madObject $form ) {
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

    public function slugify( $string, $name ) {
        $slug = preg_replace('~[^\\pL\d]+~u', '-', $string );
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

        return $slug;
    }
}

?>
