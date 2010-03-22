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
        $this->exchangeArray( array(  ) );
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
            default:
                throw new madBasePropertyNotFoundException( $key );
        }
    }
}
