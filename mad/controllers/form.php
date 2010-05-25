<?php

class madFormController extends madController {
    public $formName;
    public $data;
    public $requestFormName;
    public $routeConfiguration;
    public $processedData;
    public $formConfiguration;
    public $isValid = true;
    public $isSuccessfull = false;
    public $formMeta = array(  );
    public $isFormSet = false;
    public $currentFormSet = false;

    public function __construct( $action = null, ezcMvcRequest $request = null, &$routeConfiguration = null ) {
        parent::__construct( $action, $request, $routeConfiguration );

        if ( $action != 'form' ) {
            return true;
        }

        if ( !is_null( $routeConfiguration ) ) {
            $this->requestFormName = str_replace( '.', '_', $routeConfiguration['form'] );
            $this->formName = $routeConfiguration['form'];
            $this->routeConfiguration = $routeConfiguration;
        } else {
            $this->requestFormName = null;
            $this->formName = null;
            $this->routeConfiguration = null;
        }

        if ( $request instanceof ezcMvcRequest && isset( $request->variables[$this->requestFormName] ) ) {
            $this->data = new madObject( $request->variables[$this->requestFormName] );
        } else {
            $this->data = array(  );
        }

        $configuration = madFramework::instance()->configuration;
        if ( $this->formName && isset( $configuration['forms'][$this->formName] ) ) {
            $this->formConfiguration = $configuration['forms'][$this->formName];
            $this->formMeta = $this->formConfiguration['META'];
            unset( $this->formConfiguration['META'] );
        } else{
            $this->formConfiguration = array(  );
        }

        $this->processedData = new madObject(  );
    }

    static public function factory( $formName, $data ) {
        $controller = new madFormController( 'form' );
        $controller->data = $data;
        $controller->formName = $formName;
        return $controller;
    }

    static public function formsetFactory( $attribute, $data ) {
        $configuration = madFramework::instance()->configuration;
        
        $controller = new madFormController( 'form' );
        $controller->isFormSet = true;
        $controller->data = $data;

        if ( isset( $attribute['formName'] ) ) {
            $controller->formName = $attribute['formName'];
            $controller->formConfiguration = $configuration['forms'][$attribute['formName']];
            $controller->formMeta = $controller->formConfiguration['META'];
            unset( $controller->formConfiguration['META'] );
        } else {
            $name = $attribute['name'];
            $controller->formConfiguration = array(  );
            $controller->formConfiguration[$name] = $attribute;
            $controller->formConfiguration['namespace'] = array( 
                'value' => $attribute['namespace'],
                'name'  => 'namespace',
                'column' => 'namespace',
            );
            unset( $controller->formConfiguration[$name]['relation'] );
            $controller->formName = "multi_$name";
        }

        return $controller;
    }

    public function doForm(  ) {
        if ( $this->request->protocol == 'http-post' ) {
            $this->mergeRequestData(  );
            $this->process(  );

            if ( true /*$this->isValid*/ ) {
                $this->save(  );
            }
        } else {
            $this->process(  );
        }

    }

    public function setContexts(  ) {
        foreach( $this->formConfiguration as &$attribute ) {
            if ( !isset( $attribute['contexts'] ) ) {
                $attribute['contexts'] = array(  );
            }
            if ( $attribute['form'] != $attribute['parentForm'] ) {
                $attribute['contexts'][] = "{$attribute['parentForm']->formName}.{$attribute['form']->formName}.{$attribute['name']}";
                $attribute['contexts'][] = "{$attribute['parentForm']->formName}.{$attribute['form']->formName}";
            }
            $attribute['contexts'][] = "{$attribute['form']->formName}.{$attribute['name']}";
            $attribute['contexts'][] = $attribute['form']->formName;
            if ( isset( $attribute['form']->processedData['namespace'] ) ) {
                $attribute['contexts'][] = $attribute['form']->processedData['namespace'];
            }

            if ( $attribute['form'] !== $this ) {
                $attribute['form']->setContexts(  );
            }
        }
    }

    public function postCreateResult(  ) {
        if ( $this->action != 'form' ) {
            return true;
        }

        if ( !$this->isSuccessfull ) {
            $this->setContexts(  );
        } else {
            if ( isset( $this->request->variables['popup'] ) ) {
                $this->result->variables['responseBody'] = sprintf( 
                    '<script type="text/javascript">opener.dismissAddAnotherPopup( window, "%s", "%s" );</script>',
                    $this[$this->request->variables['valueAttribute']],
                    $this[$this->request->variables['displayAttribute']]
                );
            } else {
                $this->result->status = new ezcMvcExternalRedirect( madFramework::url(
                        $this->routeConfiguration['successRoute'],
                        $this->data
                ) );
            }
        }
    }

    public function save() {
        // for some reason this doesn't work:
        // $processedData =& $this->isFormSet ? $this->processedData : array( &$this->processedData );
        if ( $this->isFormSet ) {
            $processedData = $this->processedData;
        } else {
            $processedData = array( &$this->processedData );
        }

        // save this to get pk for relations
        foreach( $processedData as $key => &$row ) {
            if ( !$row ) {
                continue;
            }
            
            madModelController::saveArray( $row );
            var_dump( $row );

            // set the id to reverseFks
            foreach( $this->formConfiguration as $attribute ) {
                if ( empty( $attribute['relation'] ) ) {
                    continue;
                }
                
                if ( !isset( $this->processedData[$attribute['name']] ) ) {
                    continue;
                }
        
                if ( $attribute['relation'] == 'reverseFk' ) {
                    if ( $attribute['form']->isFormSet ) {
                        foreach( $attribute['form']->processedData as $subKey => &$subRow ) {
                            $subRow[$attribute['fkName']] = $row['id'];
                        }
                    } else {
                        $attribute['form']->processedData[$attribute['fkName']] = $row['id'];
                    }

                    $attribute['form']->save(  );
                }

                if ( $attribute['relation'] == 'manyToMany' ) {
                    foreach( $row[$attribute['name']] as $relatedId ) {
                        $relation = array( 
                            'namespace' => $attribute['relationNamespace'],
                            $attribute['leftRelationAttribute'] => $row['id'],
                            $attribute['rightRelationAttribute'] => $relatedId,
                        );

                        madModelController::saveArray( $relation );
                    }
                }
            }
        }

        $this->isSuccessfull = true;

        if ( $this->formName == 'recipe.recipe' ) die( "DOne saving recipe" );
    }

    public function mergeRequestData(  ) {
        $this->data->merge( $this->request->variables[$this->requestFormName] );

        if ( isset( $this->request->files[$this->requestFormName] ) ) {
            $files = new madObject( $this->request->files[$this->requestFormName] );
            $files->clean(  );
            $this->data->merge( $files );
        }

        $this->data->clean();
    }

    public function process(  ) {
        foreach( $this->formConfiguration as $name => &$attribute ) {
            if ( isset( $attribute['relation'] ) && $attribute['relation'] == 'reverseFk' ) {
                $attribute['form'] = madFormController::formsetFactory( 
                    $attribute,
                    isset( $this->data[$name] ) ? $this->data[$name] : array()
                );
                $attribute['form']->requestFormName = sprintf( '%s[%s]', $this->requestFormName, $attribute['name'] );
                $attribute['form']->process(  );
                $attribute['parentForm'] = $this;

                $this->processedData[$name] = $attribute['form']->processedData;
                $this->isValid = $attribute['form']->isValid ? $this->isValid : false;
                continue;
            } else {
                $attribute['form'] = $this;
                $attribute['parentForm'] = $this;
            }

            if ( $this->isFormSet ) {
                foreach( $this->data as $key => $row ) {
                    $value = isset( $row[$attribute['column']] ) ? $row[$attribute['column']] : null;
                    $this->currentFormSet = $key;
                    $this->processAttribute( $attribute, $value );
                }
                $this->currentFormSet = false;
            } else {
                $value = isset( $this->data[$attribute['name']] ) ? $this->data[$attribute['name']] : null;
               $this->processAttribute( $attribute, $value );
            }
        }
        
        $this->processedData->clean();
    }

    public function processAttribute( &$attribute, $value ) {
        if ( isset( $attribute['value'] ) ) {
            $this->processedData( $attribute, $attribute['value'] );
        } elseif ( isset( $attribute['autoNow'] ) ) {
            $this->processedData( $attribute, date( 'Y-m-d' ) );
        } elseif ( isset( $attribute['slugify'] ) ) {
            $phrase = madFramework::dictionnaryReplace(
                $attribute['slugify'],
                $this->processedData
            );
            
            $slug = madFramework::slugify( $phrase );

            $this->processedData( $attribute, $slug );
        } elseif ( $attribute['widget'] == 'file' && $value instanceof ezcMvcRequestFile ) {
            $fileName = iconv( 'utf-8', 'us-ascii//TRANSLIT', $value->name );

            $uploadDir = madFramework::getPath( 'applications', 'mad', 'uploadDir' );
            $uploadTo = "$uploadDir/$fileName";
            
            $i = 1;
            while ( file_exists( $uploadTo ) ) {
                $info = pathinfo( $uploadTo );
                $fileName = $info['filename'] . str_repeat( '_', $i ) . '.' . $info['extension'];
                $uploadTo = "$uploadDir/$fileName";
                $i++;
            }
            unset( $i );
    
            if ( move_uploaded_file( $value->tmpPath, $uploadTo ) ) {
                $this->processedData( $attribute, $fileName );
            } else {
                $this->attributeError( $attribute, 'move uploaded file failed' );
            }
        } elseif ( isset( $attribute['query'] ) ) {
            $attribute['rows'] = madFramework::query( $attribute['query'] );
            $attribute['choices'] = array(  );
            
            foreach( $attribute['rows'] as $key => $row ) {
                $attribute['choices'][$row[$attribute['valueAttribute']]] = $row[$attribute['displayAttribute']];
            }

            if ( empty( $value ) ) {
                return;
            }

            $values = empty( $attribute['multiple'] ) ? array( $value ) : $value;

            foreach ( $values as $check ) {
                if ( !isset( $attribute['choices'][$check] ) ) {
                    return $this->attributeError( $attribute, 'value not in query' );
                }
            }

            $this->processedData( $attribute, $value );
        } else {
            $this->processedData( $attribute, $value );
        }
    }

    public function processedData( $attribute, $value ) {
        $attribute['displayValue'] = $value;

        if ( $this->isFormSet ) {
            if ( !isset( $this->processedData[$this->currentFormSet] ) ) {
                $this->processedData[$this->currentFormSet] = array(  );
            }
            $this->processedData[$this->currentFormSet][$attribute['column']] = $value;
        } else {
            $this->processedData[$attribute['column']] = $value;
        }
    }

    public function attributeError( $attribute, $error ) {
        if ( !isset( $attribute['errors'] ) ) {
            $attribute['errors'] = array(  );
        }

        $attribute['errors'][] = $error;
        $this->isValid = false;
    }

    public function cleanAttribute( $name, $attribute ) {

    }

    public function setFormOptions( madObject $form, $merged ) {
        $options = $this->registry->configuration['forms'][$form->name];
        $form->setOptions( $options );
    }

    public function doOldForm(  ) {
        $form         = new madModelObject(  );
        $form->name   = $this->configuration['form'];
        $form->action = $this->request->uri;
        $form->model  = $this->registry->model;
        $form->valid  = true;
        
        // add the form to result variables for reuse in the template
        $this->result->variables['form'] = $form;

        // get and set the form configuration
        $this->setFormOptions( $form, false );

        // process options
        $this->processOptions( $form );

        // save the form
        if ( $this->request->protocol == 'http-post' ) {
            $form->merge( $this->request->variables[str_replace( '.', '_', $form->name)] );
            if ( isset( $this->request->files[str_replace( '.', '_', $form->name)] ) ) {
                $files = new madObject( $this->request->files[str_replace( '.', '_', $form->name)] );
                $files->clean(  );
                $form->merge( $files );
            }

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
                $this->formSuccess( $form );
            }
        }
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

                    if ( !isset( $form[$name] ) || !$form[$name] ) {
                        return true;
                    }

                    $file = $form[$name];

                    if ( !$file instanceof ezcMvcRequestFile ) {
                        return true;
                    }
    
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
    
                        $form[$name] = '';
                        return true;
                    }
    
                    if ( !file_exists( $file->tmpPath ) ) { // check if a file was already moved
                        $form[$name] = '';
                        return true;
                    }
    
                    $relative = $file->name;
                    $uploadTo = $uploadDir . DIRECTORY_SEPARATOR . $relative;
                    $uploadTo = iconv('utf-8', 'us-ascii//TRANSLIT', $uploadTo);
                    
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

                $form[$name]->name = $name;

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
                    $field = $multipleField->fields->$key;
                    $this->processFormFieldOptions( $form[$name], $key, $field );
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
        $slug = iconv('utf-8', 'us-ascii//TRANSLIT', $slug);
        // lowercase
        $slug = strtolower($slug);
        // remove unwanted characters
        $slug = preg_replace('~[^-\w]+~', '', $slug);

        if ( strlen( $slug ) > 100 ) {
            $slug = substr( $slug, 0, 100 );
        }

        return $slug;
    }
}

?>
