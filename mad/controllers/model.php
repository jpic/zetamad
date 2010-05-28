<?php

class madModelController extends madFormController {
    static public function saveArray( &$row, $table = null ) {
        $set  = array(  );

        if ( is_null( $table ) ) {
            if ( !isset( $row['namespace'] ) ) {
                var_dump( $row );
                trigger_error( "Row has no namespace attribute, and no table argument was provided" );
            }
            $table = $row['namespace'];
            unset( $row['namespace'] );
        }

        foreach( $row as $column => $value ) {
            if ( is_array( $value ) ) {
                continue;
            }

            if ( is_object( $value ) ) {
                continue;
            }

            $set[] = "$column = :$column";
        }

        $sql = "insert into `$table` set " . implode( ', ', $set );

        $framework = madFramework::instance(  );
        $insert = $framework->pdo->prepare( $sql );
        $insert->execute( $row );

        $row['namespace'] = $table;
    }

    public function doList() {       
        $query = $this->framework->routeConfiguration['query'];
        $paginate = isset( $this->framework->routeConfiguration['paginate'] ) ? intval( $this->framework->routeConfiguration['paginate'] ) : false;
        $pdo = madFramework::instance(  )->pdo;

        if ( $paginate && false ) {
            $totalObjectsSql = preg_replace( '/^select (.*)? from/i', 'SELECT count(id) FROM', $query );
            $totalObjects = $this->framework->model->query( $totalObjectsSql )->fetchColumn(  );
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

            $this->result->variables['paginate']    = $paginate;
            $this->result->variables['currentPage'] = $currentPage;
            $this->result->variables['lastPage']    = $lastPage;
        } 
        $objectList = $pdo->query( $query )->fetchAll( PDO::FETCH_ASSOC );

        if ( $objectList ) {
            if ( empty( $this->framework->routeConfiguration['tableColumns'] ) ) {
                $this->result->variables['tableColumns'] = array(  );

                foreach( current( $objectList ) as $key => $value ) {
                    if ( $value instanceof madObject && $value->isEntity ) {
                        continue;
                    }

                    if ( $key == 'namespace' || $key == 'id' ) {
                        continue;
                    }

                    $this->result->variables['tableColumns'][$key] = $key;
                }
            } else {
                $this->result->variables['tableColumns'] = $this->framework->routeConfiguration['tableColumns'];
            }
        }
        
        $this->result->variables['objectList'] = $objectList;
    }

    public function processDeleteFields( madModelObject $form ) {
        if ( isset( $form->formsets ) ) {
            foreach( $form->formsets->options as $name => $formset ) {
                $deletes = array(  );

                if ( isset( $form[$name] ) ) {
                    $form->forceListAttribute( $name );

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
                        $this->framework->model->delete( $delete );
                        // delete from object
                        unset( $form[$name][$key] );
                    }
                }
            }
        }
    }

    public function slugify( $string, $name ) {
        $slug = parent::slugify( $string, $name );

        // ensure it is unique
        $stmt = $this->framework->database->query( "select id from mad_model where attribute_key = '" . $name . "' and attribute_value = '" . $slug . "'" );
        while( intval( $stmt->rowCount(  ) ) > 0 ) {
            $slug .= '-';
            $stmt = $this->framework->database->query( "select id from mad_model where attribute_key = '" . $name . "' and attribute_value = '" . $slug . "'" );
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
    public function setFormOptions( madObject $form, $merged ) {
        parent::setFormOptions( $form, $merged );

        if ( isset( $this->id ) ) {
            $form['id'] = $this->id;
            $this->framework->model->refresh( $form );

            if ( $this->request->protocol == 'http-post' && !$merged ) {
                // drop all multival
                if ( isset( $form->multipleFields ) ) {
                    foreach( $form->multipleFields as $name => $field ) {
                        unset( $form[$name] );
                    }
                }

                // @todo: drop all relations
            }
        }
    }

    public function processOptions( madObject $form ) {
        if ( $this->request->protocol == 'http-post' ) {
            $this->processDeleteFields( $form );
        }

        parent::processOptions( $form );
    }

    public function formSuccess( $form ) {
        $this->framework->model->save( $form );

        // redirect to successRoute
        $prefix = $this->framework->configuration->getSetting( 'applications', 'mad', 'urlPrefix' );

        if ( isset( $this->request->variables['popup'] ) ) {
            $this->result->variables['responseBody'] = sprintf( 
                '<script type="text/javascript">opener.dismissAddAnotherPopup( window, "%s", "%s" );</script>',
                $form[$this->request->variables['valueAttribute']],
                $form[$this->request->variables['displayAttribute']]
            );
        } else {
            $this->result->status = new ezcMvcExternalRedirect( 
                $prefix . $this->framework->router->generateUrl(
                    $this->framework->routeConfiguration['successRoute'],
                    (array) $form
                ) 
            );
        }
    }

    public function doAutocomplete(  ) {
        if ( isset( $this->framework->routeConfiguration['column'] ) ) {
            // simple query case
            $this->result->variables['objectList'] = array(  );

            $statement = $this->framework->model->query( $this->framework->routeConfiguration['query'] );
            foreach( $statement->fetch(  ) as $row ) {
                $this->result->variables['objectList'][] = $row;
            }
        } else {
            $this->result = $this->doList(  );
        }

        if ( isset( $this->framework->routeConfiguration['column'] ) ) {
            $this->result->variables['valueAttribute'] = $this->framework->routeConfiguration['column'];
            $this->result->variables['displayAttribute'] = $this->framework->routeConfiguration['column'];
        } elseif ( isset( $this->framework->routeConfiguration['attribute'] ) ) {
            $this->result->variables['valueAttribute'] = $this->framework->routeConfiguration['attribute'];
            $this->result->variables['displayAttribute'] = $this->framework->routeConfiguration['attribute'];
        } else {
            $this->result->variables['valueAttribute'] = $this->request->variables['valueAttribute'];
            $this->result->variables['displayAttribute'] = $this->request->variables['displayAttribute'];
        }
    }

    public function doDetails(  ) {
        $arguments = $where = array(  );
        foreach( explode( '/', $this->framework->routeConfiguration['rails'] ) as $part ) {
            if ( substr( $part, 0, 1 ) == ':' ) {
                $attributeName = substr( $part, 1 );
                $where[] = "$attributeName = :$attributeName";
                $arguments[$attributeName] = $this->request->variables[$attributeName];
                break;
            }
        }

        $sql = "select * from {$this->framework->routeConfiguration['table']} where " . implode( ' AND ', $where ) . " limit 0, 1";
        $select = madFramework::instance()->pdo->prepare( $sql );
        $select->execute( $arguments );
        $row = $select->fetch( PDO::FETCH_ASSOC );

        $object = new madModelObject( $row );
        $object['namespace'] = $table;
        $this->result->variables['object'] = $object;
        $this->result->variables['contexts'][] = $object['namespace'];
    }

    public function doDelete(  ) {
        $this->doDetails(  );
        
        $prefix = $this->framework->configuration->getSetting( 'applications', 'mad', 'urlPrefix' );

        $object = $this->result->variables['object'];

        if ( isset( $this->request->variables['confirmDelete'] ) ) {
            $this->framework->model->delete( $object );
            
            $_SESSION['messages'][] = $this->t( 'deleteMessage', $object );

            $this->result->status = new ezcMvcExternalRedirect( 
                $prefix . $this->framework->router->generateUrl(
                    $this->framework->routeConfiguration['successRoute'],
                    (array) $object
                ) 
            );
        }
    }
    static public function routeFormData( $routeName, $data ) {
        $framework = madFramework::instance();

        $configuration = $framework->configuration['routes'][$routeName];

        $request = new ezcMvcRequest(  );
        $request->protocol = 'http-post';
        $request->variables[str_replace( '.', '_', $configuration['form'] )] = $data;

        $controller = $framework->dispatcher->createRouteController(
            $request,
            $configuration
        );

        $result = $controller->createResult(  );

        return $result;
    }
}

?>
