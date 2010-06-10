<?php
/**
 * File containing the mad exceptions.
 * 
 * @todo move madObject exceptions to a madbase app
 * @package MadBase
 * @version //autogen//
 * @copyright Copyright (C) 2010 MadeleineMarket.com. All rights reserved.
 * @license http://madeleinemarket.com/code/license
 */
/**
 * madException is a container from which all other exceptions in the Mad
 * packages descent.
 * 
 * @package MadBase
 * @version //autogen//
 */
class madException extends Exception {}

class madApplicationPathNotFound extends madException {
    public function __construct( $application ) {
        $msg = "$application[name] has no path defined. Please make sure that $application[name] is installed and readable by the server";
        parent::__construct( $msg );
    }
}

/**
 * madObjectValueException is thrown whenever the type or value of the given
 * variable is not as expected.
 *
 * @package MadBase
 * @version //autogen//
 */
class madObjectValueException extends madException {
    /**
     * Constructs a new madObjectValueException on the $name variable.
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
 * madObjectPropertyNotFoundException is thrown whenever a non existent property
 * is accessed in the mad library.
 *
 * @package MadBase
 * @version //autogen//
 */
class madObjectPropertyNotFoundException extends madException
{
    /**
     * Constructs a new madObjectPropertyNotFoundException for the property
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
 * madObjectMixedKeysException is thrown whenever a madObject has mixed keys.
 *
 * For example, this bad madObject:
 * <code>
 * new madObject( array( 
 *    'foo',
 *    'bar',
 *    'example' => 'test',
 * ) );
 * </code>
 *
 * @package MadBase
 * @version //autogen//
 */
class madObjectMixedKeysException extends madException
{
    /**
     * Constructs a new madObjectMixedKeysException for the key $key.
     *
     * @param string $name The name of the property
     */
    function __construct( $key )
    {
        parent::__construct( 
            "'$key' is a string attribute key which shouldn't be in a non-entity madObject'"
        );
    }
}

/**
 * madModelException is a container from which all other exceptions in the 
 * MadModel package descent.
 * 
 * @package MadModel
 * @version //autogen//
 */
class madModelException extends madException {}

/**
 * madModelExceptedId is thrown when runtime needs a madObject object needs an id 
 * attribute value to continue.
 * 
 * @package MadModel
 * @version //autogen//
 */
class madModelExceptedId extends madModelException {}

