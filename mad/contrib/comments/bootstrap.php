<?php

$registry = madFramework::instance(  );

function setResultComments( ezcMvcRequest $request, ezcMvcResult $result ) {
    if ( isset( $result->variables['object'] ) && isset( $result->variables['object']['comments'] ) ) {
        $result->variables['comments'] = $result->variables['object']['comments'];
    }
}

//$registry->signals->connect( 'postCreateResult', 'setResultComments' );

?>
