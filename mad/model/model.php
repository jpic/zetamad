<?php
/**
 * File containing the madModel class.
 * 
 * @package MadModel
 * @version //autogen//
 * @copyright Copyright (C) 2010 MadeleineMarket.com. All rights reserved.
 * @license http://madeleinemarket.com/code/license
 */

/**
 * madModel is the main runtime interface for manipulation of persistent 
 * madBase objects.
 * 
 * @package MadModel
 * @version //autogen//
 * @copyright Copyright (C) 2010 MadeleineMarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
class madModel {
    /**
     * The database instane.
     * 
     * @var PDO
     */
    private $pdo = null;

    const DECODE_ID_ENTITY = 'id';

    const ENCODE_ID_ENTITY = ':id';

    public $coreConfiguration = array(  );
    public $schemaConfiguration = array(  );
    public $databaseTables = array(  );
    public $configurationTables = array(  );
    public $namespaceTableNames = array(  );

    /**
     * Set the database instance private property.
     * 
     * @param PDO $pdo
     * @throws madBaseValueException If the $pdo parameter is not given an 
     *                               PDO
     * @return void
     */
    public function __construct( PDO $pdo, $schemaConfiguration = null, $coreConfiguration = null ) {
        $this->pdo = $pdo;
        $this->schemaConfiguration = $schemaConfiguration;
        $this->coreConfiguration   = $coreConfiguration;
        $this->readConfiguration(  );
    }

    public function query( $sql, array $arguments = array(  ) ) {
        //$args = func_get_args(  );
        //$final = $sql;
        //foreach ( $arguments as $key => $value ) {
            //$final = str_replace( "$key", "'$value'", $final );
        //}
        //$final = str_replace( "'", "\'", $final );
        //echo $final;
        //$final = str_replace( "(", "\(", $final );
        //$final = str_replace( ")", "\)", $final );
        
        $statement = $this->pdo->prepare( $sql );
        $statement->execute( $arguments );
        
        return $statement;
    }

    /**
     * Returns an acceptable new entity id.
     * 
     * Uses mysql function uuid().
     *
     * @return int
     */
    public function getNextEntityId(  ) {
        $sql = 'select uuid( );';
        $statement = $this->query( $sql );
        $id = strtoupper( $statement->fetchColumn( 0 ) );
        return $id;
    }

    /**
     * Saves a model in the database. This method uses a transaction.
     *
     * If $data['id'] is not set, then getNextEntityId() is called to get an id. 
     * ( Is that really thread-safe? )
     *
     * If $data['id'] is set, then all attributes will be removed from the 
     * database, recursively, in a transaction.
     *
     * If $data['namespace'] is configured to have an index table, then it will 
     * be updated as well.
     * 
     * @param madBase $data Model instance to save.
     * @return madBase
     */
    public function save( madBase $data, $useTransaction = true ) {
        $args = func_get_args(  );

        if( $useTransaction ) {
            $this->pdo->beginTransaction();
        }

        if ( array_key_exists( 'id', $data ) ) {
            $this->delete( $data, false );
        } else {
            $data['id'] = $this->getNextEntityId();
        }

        foreach( $data as $key => $value ) {
            if ( $key == 'id' ) {
                continue;
            }

            $this->saveAttribute( 
                $data,
                $key,
                $value
            );

        }

        if ( $useTransaction ) {
            if ( !$this->pdo->commit() ) {
                throw new Exception( "Unable to commit" );
            }
        }
            
        if ( isset( $this->namespaceTableNames[$data['namespace']] ) ) {
            $tableName = $this->namespaceTableNames[$data['namespace']];

            $updateParts = array(  );
            foreach( $this->configurationTables[$tableName] as $name => $column ) {
                $updateParts[$keys] = "$key = :$key";
            }

            $cacheSql = "INSERT INTO `$tableName` SET ";
            $cacheSql.= implode( ', ', $updateParts );
            $cacheSql.= "ON DUPLICATE KEY UPDATE ";
            unset( $updateParts['id'] );
            $cacheSql.= implode( ', ', $updateParts );
        }

        return $data;
    }

    /**
     * Wraps around insertAttribute() to save related objects.
     *
     * Like insertAttribute(), the purpose of this function is to save an 
     * attribute key and value in the database.
     *
     * In addition to insertAttribute(), it is able to manage attribute values 
     * with *are* related object, by pre-saving them.
     * 
     * @param madBase $data 
     * @param string $key 
     * @param mixed $value 
     * @return void
     */
    private function saveAttribute( madBase $data, $key, $value ) {
        // handle simple attributes
        if ( ! ( $value instanceof madBase ) ) {
            return $this->insertAttribute( $data, $key, $value );
        }

        // handle foreign keys (n:1)
        if ( $value->isEntity && !isset( $value['id'] ) ) {
            $this->save( $value, false );
            return $this->insertAttribute( $data, $key, $value['id'] );
        }

        // handle multi value
        foreach( $value as $subvalue ) {
            if ( ! ( $subvalue instanceof madBase ) ) { // handle simple multiVal
                $this->insertAttribute( $data, $key, $subvalue );
            } else { // handle m2m
                $this->save( $subvalue, false );
                $this->insertAttribute( $data, $key, $subvalue['id'] );
            }
        }
    }

    /**
     * Insert an attribute in the database.
     * 
     * @param madBase $data   Model instance
     * @param string   $key     Attribute key
     * @param mixed    $value   Attribute value
     * @return void
     */
    private function insertAttribute( madBase $data, $key, $value ) {
        $sql = sprintf( 
            'insert into mad_model set 
                attribute_key = :attribute_key
                , attribute_value = :attribute_value
                , id = %s',
            self::ENCODE_ID_ENTITY
        );
        
        $arguments = array( 
            ':id'       => $data['id'],
            ':attribute_key'   => $key,
            ':attribute_value' => $value,
        );

        $statement = $this->query( $sql, $arguments );

    }

    /**
     * Load all persistent objects with id in the 'id' returned by the query 
     * sql.
     * 
     * @param string $sql SQL query string which returns the id in first column.
     * @param array $arguments Array arguments of the query.
     * @return array madBase instances
     */
    public function queryLoad( $sql, array $arguments = array(  ) ) {
        $statement = $this->pdo->prepare( $sql );
        $statement->setFetchMode( PDO::FETCH_COLUMN );
        $statement->execute( $arguments );

        $ids = array();
        while( $id = $statement->fetchColumn(  ) ) {
            $ids[] = $id;
        }

        return $this->loadFromIds( $ids );
    }

    /**
     * Load all persistent objects which id is in $ids.
     * 
     * @param array $ids Array of ids.
     * @return array madBase instances
     */
    public function loadFromIds( array $ids ) {
        if ( !$ids ) {
            return array(  );
        }

        $sql = sprintf( '
            select 
                %s as id
                , attribute_key
                , attribute_value
            from mad_model 
            where id in ( %s )',
            self::DECODE_ID_ENTITY,
            join( ', ', $ids )
        );
        
        $statement = $this->query( $sql );

        return $this->reduce( $statement->fetchAll(  ), $data );
    }

    /**
     * Returns an array with all models matching $data. $data['id'] is ignored.
     *
     * $data['id'] is unique, it makes no sense to use it to filter a result
     * set. If you want $data['id'] support, see refresh().
     *
     * For example:
     * <code>
     * $allRecipes = $model->loadMatching( new myRecipeModel );
     * // $allRecipes will contain the list of all recipes
     *
     * $drinks = $model->loadMatching( new myRecipeModel( array( 
     *     'category' => 'Drink'
     * ) ) );
     * // $drinks will contain the list of all recipes in the 'Drink' category.
     * </code>
     * 
     * @param madBase $data 
     * @return void
     */
    public function loadMatching( madBase $data ) {
        $arguments = array( );

        // part 1: fetch ids
        $sql = sprintf( '
            select 
                %s as id
            from mad_model 
            where ',
            self::DECODE_ID_ENTITY
        );

        foreach( $data as $key => $value ) {
            $sql .= " ( attribute_key = '$key' and attribute_value = :$key ) or ";
        }

        $sql = substr( $sql, 0, -4 );

        $statement = $this->query( $sql, (array) $data );

        $ids = array();
        while( $row = $statement->fetch(  ) ) {
            $ids[] = str_replace( ':id', "'{$row['id']}'", self::ENCODE_ID_ENTITY );
        }

        return $this->loadFromIds( $ids );
    }

    /**
     * Takes an array of attributes as argument, and return an array of 
     * entities.
     * 
     * For example, with such an array (typically rows from an SQL query):
     * <code>
     * array(   
     *      array(
     *          'class'           => 'myRecipeModel',
     *          'id'       => 12,
     *          'attribute_key'   => 'origin',
     *          'attribute_value' => 'france'
     *      ),
     *      array(
     *          'class'           => 'myRecipeModel',
     *          'id'       => 12,
     *          'attribute_key'   => 'author',
     *          'attribute_value' => 'chris',
     *      ),
     *      array(
     *          'class'           => 'myRecipeModel',
     *          'id'       => 13,
     *          'attribute_key'   => 'origin',
     *          'attribute_value' => 'spain'
     *      ),
     *      array(
     *          'class'           => 'myRecipeModel',
     *          'id'       => 13,
     *          'attribute_key'   => 'author',
     *          'attribute_value' => 'james',
     *      ),
     * )
     * </code>
     *
     * It will return a set of entities with all their attributes:
     * <code>
     * array(  
     *      12 => new myRecipeModel( array( 
     *          'id'     => 12,
     *          'origin' => 'france',
     *          'author' => 'chris',
     *      ) ),
     *      13 => new myRecipeModel( array( 
     *          'id'     => 13,
     *          'origin' => 'spain',
     *          'author' => 'james',
     *      ) ),
     * )
     * </code>
     *
     * @param array $rows 
     * @return array
     */
    public function reduce( $rows ) {
        $return = array(  );

        foreach( $rows as $row ) {
            // hacks arround php poor array syntax support
            $id    = $row['id'];
            $key   = $row['attribute_key'];
            $value = $row['attribute_value'];
            
            if ( !array_key_exists( $id, $return ) ) {
                $return[$id] = new madBase( array(  
                    'id' => $id,
                ) );
            }

            $this->contributeAttribute( $return[$id], $key, $value );
        }

        return $return;
    }

    /**
     * Adds an attribute value to the given model with the given key.
     *
     * This private function appends the value if the attribute is an array, or 
     * set it normally otherwise.
     * 
     * @param madBase $data 
     * @param string $key 
     * @param mixed $value 
     * @return void
     */
    private function contributeAttribute( madBase $data, $key, $value ) {
        // strip slashes
        $value = stripslashes( $value );

        // if the value is an uuid, fetch the object and replace $value with it
        if ( preg_match( '/[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}/', $value ) ) {
            $value = new madBase( array(  
                'id' => $value,
            ) );
            $this->refresh( $value );
        }

        if ( array_key_exists( $key, $data ) ) {
            if( ! $data[$key] instanceof madBase or isset( $data[$key]['id'] ) ) {
                $backup = is_object( $data[$key] ) ? clone $data[$key] : $data[$key];
                $data[$key] = new madBase( array( 
                    $backup,
                ) );
            }
            $data[$key][] = $value;
        } else {
            $data[$key] = $value;
        }
    }

    /**
     * Refresh a model state from the database.
     *
     * This method can be used for two purposes:
     * - loading a model by uuid,
     * - refreshing a model from the database,
     *
     * For example:
     * <code>
     * $data = new myRecipeModel( array( 
     *     id = 'BD05DD82-2C2A-11DF-933A-63BF95AB9C0A',
     * ) );
     * $model->refresh( $data );
     * // state of $data is completely loaded
     * </code>
     * 
     * @throw madModelExceptedId If $data['id'] is not set.
     * @param madBase $data 
     * @return madBase
     */
    public function refresh( madBase $data ) {
        if ( ! array_key_exists( 'id', $data ) ) {
            throw new madModelExceptedId(  );
        }

        $arguments = array();

        $sql = sprintf( '
            select 
                %s as id
                , attribute_key
                , attribute_value
            from mad_model 
            where
                :id = %s and ',
            self::DECODE_ID_ENTITY,
            self::DECODE_ID_ENTITY
        );

        $arguments[':id'] = $data['id'];

        $sql .= ' 1;';

        $statement = $this->query( $sql, $arguments );

        $data->clear();

        while( $row = $statement->fetch(  ) ) {
            $this->contributeAttribute(
                $data,
                $row['attribute_key'],
                $row['attribute_value']
            );
            
            if ( !isset( $data['id'] ) ) {
                $data['id'] = $row['id'];
            }
        }
        
        return $data;
    }

    public function delete( madBase $data, $cascade = true ) {
        if ( !isset( $data['id'] ) ) {
            throw new madModelExceptedId(  );
        }
        
        if ( $cascade ) {
            $sql = 'delete from mad_model where id = ' . self::ENCODE_ID_ENTITY . 
                ' or attribute_value = :id';
        } else {
            $sql = 'delete from mad_model where id = ' . self::ENCODE_ID_ENTITY;
        }
        
        $statement = $this->query( $sql, array( 
            ':id' => $data['id'],
        ) );
    }

    public function readDatabase(  ) {
        // get existing table names
        $statement = $this->pdo->prepare( 'show tables' );
        $statement->setFetchMode( PDO::FETCH_NUM );
        $statement->execute();

        foreach( $statement->fetchAll(  ) as $row ) {
            $this->databaseTables[$row[0]] = array(  );
        }

        foreach( array_keys( $this->databaseTables ) as $table ) {
            if ( strpos( $table, $this->coreConfiguration['prefix'] ) !== 0 ) {
                continue;
            }

            foreach( $this->query( 'describe ' . $table )->fetchAll(  ) as $row ) {
                $fieldNotNull = false;
                if ( strlen( $row['Null'] ) == 0 || $row['Null'][0] != 'Y' )
                {
                    $fieldNotNull = true;
                }
    
                $fieldDefault = null;
    
                if ( strlen( $row['Default'] ) != 0 )
                {
                    if ( $fieldType == 'boolean' )
                    {
                        $fieldDefault = ( $row['Default'] == '0' ) ? false : true;
                    }
                    else
                    {
                        $fieldDefault = $row['Default'];
                    }
                }
    
                $fieldIndex = false;
                switch( $row['Key'] ) {
                    case 'PRI':
                        $fieldIndex = 'primary';
                        break;
                    case 'MUL':
                        $fieldIndex = 'index';
                        break;
                    case 'UNI':
                        $fieldIndex = 'unique';
                        break;
                }
    
                $this->databaseTables[$table][$row['Field']]['type'] = $row['Type'];
                $this->databaseTables[$table][$row['Field']]['null'] = !$fieldNotNull;
                $this->databaseTables[$table][$row['Field']]['default'] = $fieldDefault;
                $this->databaseTables[$table][$row['Field']]['index'] = $fieldIndex;

            }
        }

        return false;
    }

    public function readConfiguration(  ) {
        foreach( $this->schemaConfiguration as $name => $table ) {
            $tableName = $this->coreConfiguration['prefix'] . str_replace( '.', '_', $name );
            $namespace = substr( $name, strpos( $name, '.' ) );
            $this->namespaceTableNames[$namespace] = $tableName;

            foreach( $table as $fieldName => $field ) {
                $this->configurationTables[$tableName][$fieldName] = $field;

                if ( !isset( $this->configurationTables[$tableName][$fieldName]['null'] ) ) {
                    $this->configurationTables[$tableName][$fieldName]['null'] = true;
                }

                if ( !isset( $this->configurationTables[$tableName][$fieldName]['default'] ) ) {
                    $this->configurationTables[$tableName][$fieldName]['default'] = false;
                }

                if ( !isset( $this->configurationTables[$tableName][$fieldName]['index'] ) ) {
                    $this->configurationTables[$tableName][$fieldName]['index'] = false;
                }
            }

            if ( !isset( $this->configurationTables[$tableName]['id_index'] ) ) {
                $this->configurationTables[$tableName]['id_index'] = array( 
                    'type'    => 'int(12)',
                    'null'    => false,
                    'default' => false,
                    'index'   => 'primary',
                );
            }

            if ( !isset( $this->configurationTables[$tableName]['id'] ) ) {
                $this->configurationTables[$tableName]['id'] = array( 
                    'type'    => 'varchar(44)',
                    'null'    => false,
                    'default' => false,
                    'index'   => 'unique',
                );
            }
        }
    }

    public function applyConfiguration(  ) {
        $this->readDatabase(  );

        foreach( $this->configurationTables as $tableName => $columns ) {
            if ( !in_array( $tableName, array_keys( $this->databaseTables ) ) ) {
                $this->query( $this->createTableSql( $tableName ) );
                continue;
            }

            foreach( $columns as $columnName => $column ) {
                if ( !in_array( $columnName, array_keys( $this->databaseTables[$tableName] ) ) ) {
                    $this->query( $this->addColumnSql( $tableName, $columnName ) );
                    continue;
                }

                $alter = false;

                foreach( $column as $key => $value ) {
                    if ( $value != $this->databaseTables[$tableName][$columnName][$key] ) {
                        if ( $key == 'index' ) {
                            # index change
                            if ( $this->databaseTables[$tableName][$columnName][$key] != false ) {
                                # drop previous index
                                $this->query( $this->dropIndexSql( $tableName, $columnName ) );
                            }
                            if ( $value != false ) {
                                # add new index
                                $this->query( $this->addIndexSql( $tableName, $columnName ) );
                            }
                        } else {
                            $alter = true;
                        }
                    }
                }
                
                if ( $alter ) {
                    $this->query( $this->alterColumnSql( $tableName, $columnName, $key ) );
                }
            }
        }
    }

    public function createTableSql( $tableName ) {
        $columnsSql = array(  );
        $unique     = array(  );
        $index      = array(  );

        $sql = "CREATE TABLE `$tableName` ( ";

        foreach( $this->configurationTables[$tableName] as $columnName => $column ) {
            $columnsSql[] = $this->columnSql( $tableName, $columnName );

            if ( $column['primary'] == 'unique' ) {
                $unique[] = "`$columnName`";
            }

            if ( $column['primary'] == 'index' ) {
                $index[] = "`$columnName`";
            }
        }
        
        $sql.= implode( ', ', $columnsSql );

        if ( $unique ) {
            $sql .= ', UNIQUE( ' . implode( ',', $unique ) . ' ) ';
        }

        if ( $index ) {
            $sql .= ', INDEX( ' . implode( ',', $index ) . ' ) ';
        }

        $sql.= ' ) ENGINE=InnoDB DEFAULT CHARSET=UTF8';

        return $sql;
    }

    public function addColumnSql( $tableName, $columnName ) {
        $sql = "ALTER TABLE `$tableName` ADD " . $this->columnSql( $tableName, $columnName );
        return $sql;
    }

    public function alterColumnSql( $tableName, $columnName, $key ) {
        $sql = "ALTER TABLE `$tableName` MODIFY " . $this->columnSql( $tableName, $columnName );
        return $sql;
    }

    public function columnSql( $tableName, $columnName ) {
        $column    = $this->configurationTables[$tableName][$columnName];
        $columnSql = "`$columnName` {$column['type']} ";

        if ( !$column['null'] ) {
            $columnSql .= 'NOT ';
        }
        $columnSql .= 'NULL ';

        if ( $column['default'] ) {
            $columnSql .= "DEFAULT \"{$column['default']}\" ";
        }

        if ( $column['index'] == 'primary' ) {
            $columnSql .= "PRIMARY KEY AUTO_INCREMENT ";
        }

        return $columnSql;
    }

    public function dropIndexSql( $tableName, $columnName ) {
        $sql = "ALTER TABLE `$tableName` DROP INDEX $columnName";
        return $sql;
    }

    public function addIndexSql( $tableName, $columnName ) {
        $index = strtoupper( $this->configurationTables[$tableName][$columnName]['primary'] );
        $sql = "ALTER TABLE `$tableName` ADD $index $columnName";
        return $sql;
    }
}
