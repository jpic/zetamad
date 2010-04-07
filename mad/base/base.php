<?php
/**
 * File containing the madBase class.
 * 
 * @package MadBase
 * @version //autogen//
 * @copyright Copyright (C) 2010 MadeleineMarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
/**
 * madBase is a data container.
 *
 * Rules:
 * - a madBase with a numeric attribute key is a relation,
 * - a madBase with no numeric attribute key is an entity,
 *
 * A madBase with only numeric attribute keys is considered a list of entities
 * that must not be saved as is, but as the value of a parent madBase 
 * attribute.
 *
 * A madBase with only string attribute keys is considered a proper entity
 * which must be saved as is and attributed an id.
 *
 * The magical read only property, $isEntity, allows to determin wether the 
 * madBase should be considered an entity or not.
 *
 * The dirtyAttributes() method checks the attributes keys and reports the
 * mix.
 *
 * @property-read $isEntity True if the first key is not numeric.
 *
 * @package MadBase
 * @version //autogen//
 * @copyright Copyright (C) 2010 MadeleineMarket.com. All rights reserved.
 * @author James Pic <jamespic@gmail.com> 
 * @author Christophe Biarrotte <jamespic@gmail.com> 
 * @license http://madeleinemarket.com/code/license
 */
class madBase extends ArrayObject {
    protected $options = null;

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
                $dirty[$key] = new madBaseValueException( $key, $value, 'madBase', 'attribute value' );
            }
        }
        
        // ensure that string and numeric keys are not mixed
        if ( count( array_unique( $numericTests ) ) > 1 ) {
            foreach( $numericTests as $key => $value ) {
                if ( !$value ) {
                    $dirty[$key] = new madBaseMixedKeysException( $key );
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
            if ( $value instanceof madBase ) {
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
            throw new madBasePropertyNotFoundException( $key );
        }
    }

    public function __set( $name, $value ) {
        if ( is_null( $this->options ) ) {
            $this->options = new madBase(  );
        }

        $this->options[$name] = $value;
    }

    public function __isset( $name ) {
        return isset( $this->options[$name] );
    }

    public function setOptions( array $options ) {
        foreach( $options as $key => $value ) {
            if ( is_array( $value ) ) {
                $this->options[$key] = new madBase();
                $this->options[$key]->setOptions( $value );
            } else {
                $this->options[$key] = $value;
            }
        }
    }

    public function merge( array $data ) {
        foreach( $data as $key => $value ) {
            if ( is_array( $value ) ) {
                if ( !isset( $this[$key] ) ) {
                    $this[$key] = new madBase();
                }
                $this[$key]->merge( $value );
            } else {
                $this[$key] = $value;
            }
        }
    }

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

            if ( $value instanceof madBase ) {
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
    }

    public function cleanSubitems(  ) {
        $unst = array(  );

        foreach( $this as $key => $value ) {
            if ( $value instanceof madBase ) {
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
}
