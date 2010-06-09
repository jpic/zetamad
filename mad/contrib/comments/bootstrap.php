<?php

function createForm( $template ) {
    $framework = madFramework::instance();
    $form = madFormController::factory( 'comments.post' );
    $framework->view->send( 'commentForm', $form );
}
$this->connectSignal( 'preIncludeTemplate', 'createForm' );

function setResultComments( ezcMvcRequest $request, ezcMvcResult $result ) {
    if ( isset( $result->variables['object'] ) && isset( $result->variables['object']['comments'] ) ) {
        $result->variables['comments'] = $result->variables['object']['comments'];
    }
}

//$registry->signals->connect( 'postCreateResult', 'setResultComments' );


?>
