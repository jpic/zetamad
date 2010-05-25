<?php
/**
 * File containing the madObject class.
 * 
 * @package MadBase
 * @version //autogen//
 * @copyright Copyright (C) 2010 MadeleineMarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
/**
 * madObject is a multi purpose data container which allows any kind of options 
 * to be set.
 *
 * 
 * Options:
 * 
 * This feature makes use of PHP magical getter and setters as well as madObject 
 * itself.
 *
 * A non-array option can be directly set like this:
 * <code>
 * $obj = madObject;
 * $obj->someOption = $someValue;
 * </code>
 *
 * The method setOptions() should be used when setting an array of options, 
 * because it will automatically convert arrays to madObject, thus making option 
 * accessors more consistent and less error prone. For example:
 * <code>
 * $obj = new madObject;
 * $obj->setOptions( array( 
 *     'foo' => array( 
 *         'someOption' => 'some value',
 *     ),
 * ) );
 *
 * // BAD:
 * $obj->foo['someOption']; // undefined attribute
 *
 * // GOOD:
 * $obj->foo->someOption; // 'some value'
 * </code>
 *
 * It is possible to directly set $options to a value that already has been 
 * through setOptions() for performance reasons:
 * <code>
 * // BAD: not setting options that were already processed
 * $obj->options = array( 'foo' => 'bar' );
 *
 * // GOOD: setting options that were already parsed by reference:
 * $obj->options =& $otherObj->options;
 * </code>
 *
 * The property $options allows to get the list of options, for example:
 * <code>
 * foreach( $obj->options as $optionName => $optionValue ) {
 *     // do something ...
 * }
 * </code>
 *
 * 
 * Data containing:
 *
 * It can contain data for two purposes:
 * - an associative array of mixed values, including values of type 'madObject', 
 *   in which case it is an 'entity',
 * - a non associative list of values, in which case it is *not* an 'entity',
 *
 * Persistency:
 * 
 * A madObject which is *not* an entity should not be given an id when saved, 
 * wheras a madObject which *is* an entity should be given an id attribute when 
 * saved.
 *
 * Rules:
 * 
 * - a madObject with a numeric attribute key is *not* an entity,
 * - a madObject with string attribute keys *is* an entity,
 *
 * A madObject with only string attribute keys is considered a proper entity
 * which must be saved as is and attributed an id.
 *
 * For example:
 * <code>
 * // entity:
 * $obj = new madObject( array(
 *     'foo' => 'bar',
 * ) );
 * </code>
 *
 * A madObject with only numeric attribute keys is considered a list of entities
 * that must not be saved as is, but as the value of a parent madObject 
 * attribute.
 *
 * For example:
 * <code>
 * // no string key, so it is not entity, and thus not saveable as is:
 * $list = new madObject( array( 
 *     'A',
 *     2,
 *     'foo'
 * ) );
 *
 * // $list should be set as attribute of an entity in order to be saveable:
 * $obj = new madObject;
 * $obj['someList'] = $list; // $obj becomes an entity with the string key
 * </code>
 *
 * The magical read only property, $isEntity, allows to determin wether the 
 * madObject should be considered an entity or not.
 * The dirtyAttributes() method checks the attributes keys and reports the
 * mix.
 *
 *
 * Data handling methods:
 *
 * madObject provides various data handling methods:
 * - dirtyAttributes() which should check if the object is sane,
 * - merge( $otherdData ) which merges attributes from another madObject,
 * - clean() which removes attributes with irrelevant values,
 *
 * See the documentation of these methods for details.
 *
 * @package MadBase
 * @version //autogen//
 * @copyright Copyright (C) 2010 MadeleineMarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @author Christophe Biarrotte <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 * @property-read $isEntity True if the first key is not numeric.
 * @property $options  Associative madObject of options.
 */
class madObject extends ArrayObject {
    public $options = null;

     /**
     * Returns the list of dirty attributes, false otherwise.
     * 
     * @return bool|array
     */
    public function dirtyAttributes() {
        $dirty        = array();
        $numericTests = array();

        foreach( $this as $key => $value ) {
            // log key type
            $numericTests[$key] = is_numeric( $key );

            // ensure that there is no pre-SPL array as default attribute
            if ( is_array( $value ) ) {
                $dirty[$key] = new madObjectValueException( $key, $value, 'madObject', 'attribute value' );
            }
        }
        
        // ensure that string and numeric keys are not mixed
        if ( count( array_unique( $numericTests ) ) > 1 ) {
            foreach( $numericTests as $key => $value ) {
                if ( !$value ) {
                    $dirty[$key] = new madObjectMixedKeysException( $key );
                }
            }
        }

        return count( $dirty ) ? $dirty : false;
    }

    /**
     * Removes all attributes from the object.
     * 
     * @return void
     */
    public function clear() {
        $backup = array(  );
        foreach( $this as $key => $value ) {
            if ( $value instanceof madObject ) {
                $backup[$key] = $value;
                $value->clear();
            }
        }

        $this->exchangeArray( array(  ) );

        foreach( $backup as $key => $value ) {
            $this[$key] = $value;
        }
    }

    /**
     * Option getter.
     * 
     * @param string $key 
     * @return mixed
     */
    public function __get( $key ) {
        switch( $key ) {
            case 'isEntity':
                if ( !count( $this ) ) {
                    return null;
                }
                foreach( $this as $key => $value ) {
                    if ( is_numeric( $key ) ) {
                        return false;
                    }
                }
                return true;
            case 'options':
                return $this->options;
        }
        
        if ( isset( $this->options[$key] ) ) {
            return $this->options[$key];
        } else {
            throw new madObjectPropertyNotFoundException( $key );
        }
    }

    /**
     * Option setter.
     * 
     * @param string $name 
     * @param mixed $value 
     * @return void
     */
    public function __set( $name, $value ) {
        if ( is_null( $this->options ) ) {
            $this->options = new madObject(  );
        }

        $this->options[$name] = $value;
    }

    /**
     * Return true if an option is set.
     * 
     * @param string $name Option name
     * @return void
     */
    public function __isset( $name ) {
        return isset( $this->options[$name] );
    }

    /**
     * Set the option array.
     *
     * It will replace all sub arrays by instances of madObject.
     * 
     * Example:
     * <code>
     * $obj = new madObject;
     * $obj->setOptions( array( 
     *     'foo' => 'foo value',
     * ) );
     *
     * $obj->foo; # == 'foo value'
     *
     * $obj->setOptions( array( 
     *     'foo' => array(
     *         'bar' => 'bar value',
     *     ),
     * ) );
     *
     * $obj->foo->bar; # == 'bar value'
     * </code>
     *
     * @param array $options 
     * @return void
     */
    public function setOptions( array $options ) {
        foreach( $options as $key => $value ) {
            if ( is_array( $value ) ) {
                $this->options[$key] = new madObject();
                $this->options[$key]->setOptions( $value );
            } else {
                $this->options[$key] = $value;
            }
        }
    }

    /**
     * Merge values with another madObject, recursively.
     *
     * Example:
     * <code>
     * $objA = new madObject( array( 
     *     'foo' => 'foo',
     * ) );
     * $objB = new madObject( array( 
     *     'foo' => 'bar',
     * ) );
     *
     * $objA->merge( $objB );
     * $objA['foo']; # == 'bar'
     * </code>
     * 
     * @param array $data 
     * @return void
     */
    public function merge( $data ) {
        foreach( $data as $key => $value ) {
            if ( is_array( $value ) || $value instanceof madObject ) {
                // recursive merge required
            
                if ( is_array( $value ) ) {
                    $value = new madObject( $value );
                }

                if ( $value instanceof madObject && !isset( $this[$key] ) ) {
                    $this[$key] = $value;
                    continue;
                }

                if ( is_array( $this[$key] ) ) {
                    $this[$key] = new madObject( $this[$key] );
                }
                
                $this[$key]->merge( $value );
            } else {
                $this[$key] = $value;
            }
        }
    }

    /**
     * Clean the object values.
     * 
     * - remove any key which value is an empty string,
     * - call clean() on each value which is a madObject of type 'entity',
     * - call cleanSubitems() on each value which is madObject that is not an 'entity',
     * - remove any key which value is an empty madObject,
     *
     * @return void
     */
    public function clean( ) {
        // hack around the weak php: Array was modified outside object and 
        // internal position is no longer valid
        $unst = array(  );

        foreach( $this as $key => $value ) {
            // unset empty attributes
            if ( $value === '' ) {
                $unst[] = $key;
                continue;
            }

            if ( $value instanceof madObject ) {
                if ( $value->isEntity ) {
                    $value->clean(  );
                } else {
                    $value->cleanSubitems(  );
                }

                if ( !count( $value ) ) {
                    $unst[] = $key;
                }
            }
        }
        
        foreach( $unst as $key ) {
            unset( $this[$key] );
        }

        return $this;
    }

    /**
     * Call clean() on each value which is an entity, and removes any key which 
     * value is false, 0 or ''.
     * 
     * @return void
     */
    public function cleanSubitems(  ) {
        $unst = array(  );

        foreach( $this as $key => $value ) {
            if ( $value instanceof madObject ) {
                $value->clean();
                if ( !count( $value ) ) {
                    $unst[] = $key;
                }
            } elseif ( !$value ) {
                $unst[] = $key;
            }
        }

        foreach( $unst as $key ) {
            unset( $this[$key] );
        }
    }

    public function objectsToArray(  ) {
        foreach( $this as $key => $value ) {
            if ( is_object( $value ) ) {
                $this[$key] = $value->objectsToArray();
            }
        }

        return (array) $this;
    }
    public function forceListAttribute( $name ) {
        if ( !isset( $this[$name] ) ) {
            return false;
        }

        if ( $this[$name] instanceof madObject && $this[$name]->isEntity ) {
            $this[$name] = new madObject( array( $this[$name] ) );
        }

        return $this[$name];
    }

    public function flatten( $destructive = true ) {
        $unst = array(  );
        foreach( $this as $key => $value ) {
            if ( $value instanceof madObject ) {
                $unst[] = $key;

                if ( $destructive ) {
                    continue;
                }

                foreach( $value as $subKey => $subValue ) {
                    if ( $subValue instanceof madObject ) {
                        $this[$key.'.'.$subKey] = $subValue->flatten(  );
                    } else {
                        $this[$key.'.'.$subKey] = $subValue;
                    }
                }
            }
        }

        foreach( $unst as $key ) {
            unset( $this[$key] );
        }

        return $this;
    }
}
