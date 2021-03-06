<?php

class madFormController extends madController {
    public $formName;
    public $data;
    public $requestFormName;
    public $routeConfiguration;
    public $processedData = array();
    public $requestData = array();
    public $persistentData = array();
    public $deletedData = array();
    public $formConfiguration;
    public $isValid = true;
    public $isSuccessfull = false;
    public $formMeta = array(  );
    public $isFormSet = false;
    public $currentFormSet = false;
    public $errors = array();

    public function __construct( $framework ) {
        parent::__construct( $framework );
        $this->processedData = new madObject(  );
        $this->data = new madObject();
        $framework->connectSignal( 'preProcessAttributeView', array( $this, 'setAttributeContext' ) );
    }

    public function preCreateResult(  ) {
        parent::preCreateResult();
       
        if ( !empty( $this->framework->routeConfiguration['form'] ) ) {
            $this->initFormConfiguration();
        }
    }

    public function initFormConfiguration() {
        if ( !$this->formName ) {
            $this->formName = $this->framework->routeConfiguration['form'];            
        }
        
        if ( !$this->requestFormName ) {
            $this->requestFormName = str_replace( '.', '_', $this->formName );
        }

        if ( !count( $this->formConfiguration ) && !empty( $this->framework->configuration['forms'][$this->formName] ) ) {
            $this->formConfiguration = $this->framework->configuration['forms'][$this->formName];
        } elseif ( !count( $this->formConfiguration ) ) {
            trigger_error( "Cannot find form configuration", E_USER_ERROR );
        }

        if ( isset( $this->formConfiguration['META'] ) ) {
            $this->formMeta = $this->formConfiguration['META'];
            unset( $this->formConfiguration['META'] );
        }
        
        foreach( $this->formConfiguration as $name => &$attribute ) {
            if ( isset( $attribute['relation'] ) && $attribute['relation'] == 'reverseFk' ) {
                $attribute['form'] = madFormController::formsetFactory(
                    $attribute,
                    isset( $this->data[$name] ) ? $this->data[$name] : array()
                );
                $attribute['form']->requestFormName = sprintf( '%s[%s]', $this->requestFormName, $attribute['name'] );
                $attribute['parentForm'] = $this;
            } else {
                $attribute['form'] = $this;
                $attribute['parentForm'] = $this;
            }
        }
    }

    static public function factory( $formName, $data = array() ) {
        $framework = madFramework::instance();
        $controller = new madFormController( $framework );
        $controller->data = is_array( $data ) ? new madObject( $data ) : $data;
        $controller->formName = $formName;
        $controller->formConfiguration = $framework->configuration['forms'][$formName];
        $controller->initFormConfiguration();
        return $controller;
    }

    static public function formsetFactory( $attribute, $data ) {
        $framework = madFramework::instance();
        
        $controller = new madFormController( $framework );
        $controller->isFormSet = true;
        $controller->data = is_array( $data ) ? new madObject( $data ) : $data;

        if ( isset( $attribute['formName'] ) ) {
            $controller->formName = $attribute['formName'];
            $controller->formConfiguration = $framework->configuration['forms'][$attribute['formName']];
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

        $controller->initFormConfiguration();

        return $controller;
    }

    public function doForm(  ) {
        if ( isset( $this->id ) )  {
            // edit mode
            if ( !$this->mergePersistentData() ) {
                return;
            }
        }

        if ( $this->request->protocol == 'http-post' ) {
            $this->mergeRequestData(  );
            $this->process(  );

            if ( $this->isValid ) {
                $this->save(  );
            }
        } else {
            $this->process(  );
        }
    }

    public function mergePersistentData( $relationAttribute = null ) {
        $table = $this->formConfiguration['namespace']['value'];
        if ( is_null( $relationAttribute ) || !isset( $relationAttribute['relation'] ) ) {
            // @todo: sql rewriter still doesn't rewrite id in where clause
            $sql = "select * from $table where $table.id = :id";
            $arguments = $this->request->variables;
        } elseif ( $relationAttribute['relation'] == 'reverseFk' ) {
            $fk = $relationAttribute['fkName'];
            $sql = "select * from $table where $fk = :id";
            $arguments = $relationAttribute['parentForm']->data;
        } else {
            trigger_error( "What relation is this attribute?");
        }

        $rows = madFramework::query( $sql, $arguments );

        if ( empty( $rows ) ) {
            return $this->do404( 'objectNotFound' );
        }

        $this->persistentData = $this->isFormSet ? $rows : $rows[0];
        $this->data->merge( $this->persistentData );

        if ( $this->isFormSet ) {
            foreach( $this->data as $key => $row ) {
                if ( !$row ) {
                    continue;
                }
                $this->processedData[$key]['id'] = $row['id'];
            }
        } else {
            $this->processedData['id'] = $this->data['id'];
        }

        foreach( $this->formConfiguration as $name => &$attribute ) {
            if ( empty( $attribute['relation'] ) ) {
                continue;
            }

            if ( $attribute['relation'] == 'reverseFk' ) {
                $attribute['form']->mergePersistentData( $attribute );

                $this->data[$attribute['name']] = $attribute['form']->data;
            }

            if ( $attribute['relation'] == 'manyToMany' && isset( $this->id ) ) {
                $q = $this->framework->pdo->prepare( "select $attribute[rightRelationAttribute] from $attribute[relationNamespace] where $attribute[leftRelationAttribute] = :id" );
                $q->setFetchMode( PDO::FETCH_COLUMN, 0 );
                $s = $q->execute( array( 'id' => $this->id ) );
                $ids = $q->fetchAll() or array();
                $this->persistentData[$name] = $ids;
                $this->data[$name] = $ids;
            }
        }

        return true;
    }

    public function setAttributeContext( &$attribute ) {
        if ( !isset( $attribute['contexts'] ) ) {
            $attribute['contexts'] = array(  );
        } else {
            return;
        }

        if ( $attribute['form'] != $attribute['parentForm'] ) {
            $attribute['contexts'][] = "{$attribute['parentForm']->formName}.{$attribute['form']->formName}.{$attribute['name']}";
            $attribute['contexts'][] = "{$attribute['parentForm']->formName}.{$attribute['form']->formName}";
        }

        $attribute['contexts'][] = "{$attribute['form']->formName}.{$attribute['name']}";
        
        $attribute['contexts'][] = $attribute['form']->formName;

        if ( isset( $attribute['form']->formConfiguration['namespace']['value'] ) ) {
            $attribute['contexts'][] = $attribute['form']->formConfiguration['namespace']['value'];
        }

        $formApplicationName = substr( $attribute['form']->formName, 0, strpos( $attribute['form']->formName , '.' ) );
        if ( !$formApplicationName && !empty( $attribute['parentForm'] ) ) {
            $formApplicationName = substr( $attribute['parentForm']->formName, 0, strpos( $attribute['parentForm']->formName , '.' ) );
        }

        if ( !in_array( $formApplicationName, $attribute['contexts'] ) ) {
            $attribute['contexts'][] = $formApplicationName;
        }
    }

    public function postCreateResult(  ) {
        if ( ! $this->formName ) {
            return true;
        }

        if ( $this->result->status !== 0 ) {
            return;
        }

        array_unshift( $this->result->variables['contexts'], $this->formConfiguration['namespace']['value'] );
        array_unshift( $this->result->variables['contexts'], $this->formName );

        $this->result->variables['form'] = $this;

        if ( $this->isSuccessfull ) {
            if ( isset( $this->request->variables['popup'] ) ) {
                $this->result->variables['responseBody'] = sprintf( 
                    '<script type="text/javascript">opener.dismissAddAnotherPopup( window, "%s", "%s" );</script>',
                    $this->processedData[$this->valueAttribute],
                    $this->processedData[$this->displayAttribute]
                );
            } else {
                $this->addMessage( 'saveSuccess', $this->processedData, $this->formConfiguration['namespace']['value'] );

                if ( !empty( $this->framework->routeConfiguration['successRoute'] ) ) {
                    $this->result->status = new ezcMvcExternalRedirect( madFramework::url(
                        $this->framework->routeConfiguration['successRoute'],
                        $this->processedData->flatten()
                    ) );
                } elseif ( !empty( $this->next ) ) {
                    $this->result->status = new ezcMvcExternalRedirect( $this->next );
                }
            }
        }
    }

    public function mergeRequestData(  ) {
        if ( isset( $this->request->variables[$this->requestFormName] ) ) {
            $this->requestData = $this->request->variables[$this->requestFormName];
        } else {
            $this->requestData = array();
        }

        $this->data->merge( $this->requestData );

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
                if ( !empty( $this->data[$name] ) ) {
                    $attribute['form']->data = $this->data[$name];
                }
                if ( !empty( $this->requestData[$name] ) ) {
                    $attribute['form']->requestData = $this->requestData[$name];
                }
                if ( !empty( $this->persistentData[$name] ) ) {
                    $attribute['form']->persistentData = $this->persistentData[$name];
                }
                $attribute['form']->process(  );

                $this->processedData[$name] = $attribute['form']->processedData;
                $this->isValid = $attribute['form']->isValid ? $this->isValid : false;
                continue;
            }

            if ( $this->isFormSet ) {
                foreach( $this->data as $key => $row ) {
                    $this->currentFormSet = $key;
                    $value = isset( $row[$attribute['column']] ) ? $row[$attribute['column']] : null;
                    $this->processAttribute( $attribute, $value );
                }
                $this->currentFormSet = false;
            } else {
               $value = isset( $this->data[$attribute['name']] ) ? $this->data[$attribute['name']] : null;
               $this->processAttribute( $attribute, $value );
            }
        }

        $this->processedData->clean();
        return $this;
    }

    public function processAttribute( &$attribute, $value ) {
        if ( isset( $attribute['value'] ) ) {
            $this->processedData( $attribute, $attribute['value'] );
        } elseif ( !empty( $attribute['autoNow'] ) ) {
            $this->processedData( $attribute, date( 'Y-m-d' ) );
        } elseif ( !empty( $attribute['autoNowAdd'] ) ) {
            if ( !isset( $this->persistentData[$attribute['column']] ) ) {
                $this->processedData( $attribute, date( 'Y-m-d' ) );
            } else {
                $this->processedData( $attribute, $this->persistentData[$attribute['column']] );
            }
        } elseif ( !empty( $attribute['slugify'] ) ) {
            if ( isset( $this->persistentData[$attribute['name']] ) ) {
                $this->processedData( $attribute, $this->persistentData[$attribute['name']] );
                return;
            }

            $slugify = $attribute['slugify'];
            $phrase = madFramework::dictionnaryReplace(
                $slugify,
                $this->processedData
            );
            
            $slug = madFramework::slugify( $phrase );

            $this->processedData( $attribute, $slug );
        } elseif ( !empty( $attribute['autoMe'] ) ) {
            $this->processedData( $attribute, $this->request->variables['user']['id'] );
        } elseif ( empty( $attribute['widget'] ) ) {
            var_dump( $attribute );
            trigger_error( "Dunno what to do with this attribute that doesn't have a widget", E_USER_ERROR);
        } elseif ( in_array( $attribute['widget'], array( 'file', 'image' ) ) && $value instanceof ezcMvcRequestFile ) {
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
                $this->attributeError( $attribute, $value, 'move uploaded file failed' );
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
                    return $this->attributeError( $attribute, $value, 'value not in query' );
                }
            }

            $this->processedData( $attribute, $value );
        } else {
            $this->processedData( $attribute, $value );
        }
    }

    public function processedData( &$attribute, $value ) {
        if ( $this->isFormSet ) {
            if ( !isset( $this->processedData[$this->currentFormSet] ) ) {
                $this->processedData[$this->currentFormSet] = array(  );
            }
            $this->processedData[$this->currentFormSet][$attribute['column']] = $value;
        } else {
            $this->processedData[$attribute['column']] = $value;
        }
    }

    public function attributeError( &$attribute, $value, $error ) {
        if ( $this->isFormSet ) {
            if ( !isset( $this->errors[$this->currentFormSet] ) ) {
                $this->errors[$this->currentFormSet] = array();
            }

            $this->errors[$this->currentFormSet][$attribute['name']] = $error;
        } else {
            $this->errors[$attribute['name']] = $error;
        }

        $this->isValid = false;
    }

    public function save( $doTransaction = true ) {
        if ( $doTransaction ) {
            $this->framework->pdo->beginTransaction();
        }

        // delete all rows, will reinsert later in posted order
        if ( $this->isFormSet ) {
            $delete = array();
            foreach( $this->persistentData as $key => $persistentRow ) {
                $delete[] = $persistentRow['id'];

                // unprocess persistent data not in request data
                if ( !array_key_exists( $key, $this->requestData ) ) {
                    unset( $this->processedData[$key] );
                }
            }

            if ( $delete ) {
                madFramework::delete( $this->formConfiguration['namespace']['value'], $delete );
            }
        }

        // for some reason this doesn't work:
        // $processedData =& $this->isFormSet ? $this->processedData : array( &$this->processedData );
        if ( $this->isFormSet ) {
            foreach( $this->requestData as $key => $value ) {
                $processedData[$key] = $this->processedData[$key];
            }
        } else {
            $processedData = array( &$this->processedData );
        }

        // save this to get pk for relations
        foreach( $processedData as $key => &$row ) {
            if ( !$row ) {
                continue;
            }

            if ( array_key_exists( 'id', $row ) && $this->isFormSet ) {
                unset( $row['id'] );
            }
            
            madModelController::saveArray( $row );

            // set the id to reverseFks
            foreach( $this->formConfiguration as $name => $attribute ) {
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

                    $attribute['form']->save( false );
                }

                if ( $attribute['relation'] == 'manyToMany' ) {
                    $q = $this->framework->pdo->prepare( "select id from $attribute[relationNamespace] where $attribute[leftRelationAttribute] = :id" );
                    $q->setFetchMode( PDO::FETCH_COLUMN, 0 );
                    $s = $q->execute( array( 'id' => $row['id'] ) );
                    $ids = $q->fetchAll() or array();

                    if ( $ids ) {
                        madFramework::delete( $attribute['relationNamespace'], $ids );
                    }

                    if ( empty( $this->requestData[$attribute['name']] ) ) {
                        continue;
                    }

                    $processedRequestData = array();
                    foreach( $this->requestData[$attribute['name']] as $key => $value ) {
                        $processedRequestData[] = $value;
                    }

                    foreach( $processedRequestData as $relatedId ) {
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

        if ( $doTransaction ) {
            $this->framework->pdo->commit();
        }
    }
}
