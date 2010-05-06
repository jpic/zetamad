<?php

class madCommentsController extends madController {
    public function doPost(  ) {
        $comment = new madModelObject( array(
            'updated'   => date( 'Y-m-d' ),
            'user'      => $this->user['id'],
            'comment'   => $this->comment,
            'object'    => $this->object,
            'namespace' => 'comment',
        ) );

        $this->registry->model->save( $comment );

        $result = new ezcMvcResult;
        $result->variables['comment'] = $comment;
        return $result;
    }
}

?>
