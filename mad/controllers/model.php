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

        $sql = "insert into $table set " . implode( ', ', $set );

        $framework = madFramework::instance(  );
        $insert = $framework->pdo->prepare( $sql );
        $result = $insert->execute( $row );

        $row['namespace'] = $table;
    }

    public function doListDelete() {
        $table = $this->framework->routeConfiguration['table'];
        foreach( $this->framework->pdo->schemalessTables[$table] as $attribute ) {
            $query = "delete from `{$table}_{$attribute}` where id in ('". implode("','", $this->ids)."')";
            madFramework::query($query);
        }
        $query = "delete from $table where id in ('". implode("','", $this->ids)."')";
        madFramework::query($query);

        $this->addMessage( 'listDeleteSuccess', array( 'table' => $table ) );
        $this->redirectToReferer();
    }

    public function doList() {       
        $query = $this->framework->routeConfiguration['query'];
        $paginate = isset( $this->framework->routeConfiguration['paginateBy'] ) ? intval( $this->framework->routeConfiguration['paginateBy'] ) : false;
        $pdo = madFramework::instance(  )->pdo;

        if ( $paginate ) {
            $totalObjectsQuery = $pdo->prepare( $this->framework->routeConfiguration['paginateTotal'] );
            $totalObjectsQuery->setFetchMode( PDO::FETCH_COLUMN, 0 );
            madFramework::pdoExecute( $totalObjectsQuery, $this->request->variables );
            $totalObjects = $totalObjectsQuery->fetchColumn();
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
        $objectList = madFramework::pdoExecute( $pdo->prepare( $query ), $this->request->variables )->fetchAll( PDO::FETCH_ASSOC );

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

    public function doDetails( $table = null ) {
        if (is_null($table )) {
            $table = $this->framework->routeConfiguration['table'];
        }

        $arguments = $where = array(  );
        foreach( explode( '/', $this->framework->routeConfiguration['rails'] ) as $part ) {
            if ( substr( $part, 0, 1 ) == ':' ) {
                $attributeName = substr( $part, 1 );
                $where[] = "$attributeName = :$attributeName";
                $arguments[$attributeName] = $this->request->variables[$attributeName];
                break;
            }
        }

        $pdo = madFramework::instance()->pdo;

        $sql = "select * from $table where " . implode( ' AND ', $where ) . " limit 0, 1";
        $rows = madFramework::query( $sql, $arguments );
        $row = $rows[0];

        $object = new madObject( $row );

        $object['namespace'] = $table;
        $this->result->variables['object'] = $object;

        if (!empty($this->framework->routeConfiguration['queries'])) {
            foreach($this->framework->routeConfiguration['queries'] as $name => $sql ) {
                $this->result->variables[$name] = madFramework::query( $sql, $object );

                if ( !empty( $row[$name] ) && is_numeric( $row[$name] ) ) {
                    // assume fk
                    $this->result->variables[$name] = $this->result->variables[$name][0];
                }
            }
        }

        $this->result->variables['contexts'][] = $table;
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
}
