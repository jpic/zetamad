<?php

class madCommentsController extends madController {
    public function doPost(  ) {
        $comment = new madModelObject( array( 
            'updated' => date( 'Y-m-d' ),
            'user'    => $this->user,
            'comment' => htmlentities( $this->comment, ENT_COMPAT, 'UTF-8' ),
            'object'  => $this->object,
        ) );

        $this->registry->save( $comment );
    }
}

?>
