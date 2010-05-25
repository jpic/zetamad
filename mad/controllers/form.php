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
}

?>
