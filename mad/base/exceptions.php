<?php
/**
 * File containing the mad exceptions.
 * 
 * @todo move madBase exceptions to a madbase app
 * @package MadBase
 * @version //autogen//
 * @copyright Copyright (C) 2010 MadeleineMarket.com. All rights reserved.
 * @license http://madeleinemarket.com/code/license
 */
/**
 * madBaseException is a container from which all other exceptions in the Mad 
 * packages descent.
 * 
 * @package MadBase
 * @version //autogen//
 */
class madBaseException extends Exception {}

/**
 * madBaseValueException is thrown whenever the type or value of the given
 * variable is not as expected.
 *
 * @package MadBase
 * @version //autogen//
 */
class madBaseValueException extends madBaseException {
    /**
     * Constructs a new madBaseValueException on the $name variable.
     *
     * @param string  $settingName The name of the setting where something was
     *                wrong with.
     * @param mixed   $value The value that the option was tried to be set too.
     * @param string  $expectedValue A string explaining the allowed type and value range.
     * @param string  $variableType  What type of variable was tried to be set (setting, argument).
     */
    function __construct( $settingName, $value, $expectedValue = null, $variableType = 'setting' )
    {
        $type = gettype( $value );
        if ( in_array( $type, array( 'array', 'object', 'resource' ) ) )
        {
            $value = serialize( $value );
        }
        $msg = "The value '{$value}' that you were trying to assign to $variableType '{$settingName}' is invalid.";
        if ( $expectedValue )
        {
            $msg .= " Allowed values are: " . $expectedValue . '.';
        }
        parent::__construct( $msg );
    }
}

/**
 * madBasePropertyNotFoundException is thrown whenever a non existent property
 * is accessed in the mad library.
 *
 * @package MadBase
 * @version //autogen//
 */
class madBasePropertyNotFoundException extends madBaseException
{
    /**
     * Constructs a new madBasePropertyNotFoundException for the property
     * $name.
     *
     * @param string $name The name of the property
     */
    function __construct( $name )
    {
        parent::__construct( "No such property name '{$name}'." );
    }
}

/**
 * madBaseMixedKeysException is thrown whenever a madBase has mixed keys.
 *
 * For example, this bad madBase:
 * <code>
 * new madBase( array( 
 *    'foo',
 *    'bar',
 *    'example' => 'test',
 * ) );
 * </code>
 *
 * @package MadBase
 * @version //autogen//
 */
class madBaseMixedKeysException extends madBaseException
{
    /**
     * Constructs a new madBaseMixedKeysException for the key $key.
     *
     * @param string $name The name of the property
     */
    function __construct( $key )
    {
        parent::__construct( 
            "'$key' is a string attribute key which shouldn't be in a non-entity madBase'"
        );
    }
}

?>
