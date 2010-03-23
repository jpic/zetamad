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
    private $db = null;

    const DECODE_ID_ENTITY = '
        CONCAT(
            HEX(LEFT(id,4))
            , "-"
            , HEX(MID(id,5,2))
            , "-"
            , HEX(MID(id,7,2))
            , "-"
            , HEX(MID(id,9,2))
            , "-"
            , HEX(RIGHT(id,6))
         )
    ';

    const ENCODE_ID_ENTITY = '
        CONCAT(
            UNHEX(LEFT(:id,8))
            , UNHEX(MID(:id,10,4))
            , UNHEX(MID(:id,15,4))
            , UNHEX(MID(:id,20,4))
            , UNHEX(RIGHT(:id,12))
        )
    ';

    /**
     * Set the database instance private property.
     * 
     * @param PDO $db
     * @throws madBaseValueException If the $db parameter is not given an 
     *                               PDO
     * @return void
     */
    public function __construct( $db ) {
        if ( !$db instanceof PDO ) {
            throw new madBaseValueException( 'db', $db, 
                'instance of PDO', 'constructor argument' );
        }

        $this->db = $db;
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
        $statement = $this->db->query( $sql );
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
     * database.
     *
     * $data->getState() is called and all attributes are inserted in the 
     * database.
     *
     * $data['id'] is set and $data is returned.
     * 
     * @param madBase $data Model instance to save.
     * @return madBase
     */
    public function save( madBase $data ) {
        //$this->db->beginTransaction();

        if ( array_key_exists( 'id', $data ) ) {
            $sql = 'delete from mad_model where ' . self::DECODE_ID_ENTITY;

            $statement = $this->db->prepare( $sql );
            $statement->execute( array( 
                ':id' => $data['id'],
            ) );

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

        //$this->db->commit();
        
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
            $this->save( $value );
            return $this->insertAttribute( $data, $key, $value['id'] );
        }

        // handle multi value
        foreach( $value as $subvalue ) {
            if ( ! ( $subvalue instanceof madBase ) ) { // handle simple multiVal
                $this->insertAttribute( $data, $key, $subvalue );
            } else { // handle m2m
                $this->save( $subvalue );
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

        $statement = $this->db->prepare( $sql );
        $statement->execute( $arguments );
    }

    /**
     * Returns an array with all models matching $data. $data['id'] is ignored.
     *
     * $data['id'] is unique, it makes no sense to use it to filter a result
     * set. If you want $data['id'] support, see refresh().
     *
     * For example:
     * <code>
     * $allRecipes = $model->load( new myRecipeModel );
     * // $allRecipes will contain the list of all recipes
     *
     * $drinks = $model->load( new myRecipeModel( array( 
     *     'category' => 'Drink'
     * ) ) );
     * // $drinks will contain the list of all recipes in the 'Drink' category.
     * </code>
     * 
     * @param madBase $data 
     * @return void
     */
    public function load( madBase $data ) {
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
            $sql .= " attribute_key = :$key and attribute_value = :$value or ";
            $arguments[$key] = $key;
            $arguments[$value] = $value;
        }

        $sql = substr( $sql, 0, -4 );

        $statement = $this->db->prepare( $sql );
        $statement->execute( $arguments );

        $ids = array();
        while( $row = $statement->fetch(  ) ) {
            $ids[] = str_replace( ':id', "'{$row['id']}'", self::ENCODE_ID_ENTITY );
        }

        if ( !$ids ) {
            return array();
        }

        // part 2: fetch objects
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
        
        $statement = $this->db->prepare( $sql );
        $statement->execute();

        return $this->reduce( $statement->fetchAll(  ), $data );
    }

    /**
     * Return an array with all existing values for an arbitary attribute name.
     * 
     * Example:
     * <code>
     * $origins = $model->getAttributeValues( 'origin' );
     * </code>
     *
     * @param string $attributeName 
     * @return array
     */
    public function getAttributeValues( $attributeName ) {
        $sql = 'select distinct attribute_value from mad_model where attribute_key = :key';
        
        $statement = $this->db->prepare( $sql );
        $statement->execute( array( 
            'key' => $attributeName,
        ) );

        $return = array(  );

        foreach( $statement->fetchAll(  ) as $row ) {
            $return[] = $row[0];
        }

        return $return;
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

        $statement = $this->db->prepare( $sql );
        $statement->execute( $arguments );

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
}
