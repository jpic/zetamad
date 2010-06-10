<?php

class madCommentsController extends madFormController {
    public function process() {
        parent::process();

        if ( !empty( $this->relatedNamespace ) ) {
            $this->processedData[$this->relatedNamespace] = (int) $this->relatedId;
        }
    }

    public function doListValidate() {
        $table = 'comment';

        foreach( $this->ids as $id ) {
            madFramework::query(
                "insert into comment set id = :id, status = 'validated'",
                array(
                    'id' => $id,
                )
            );
        }

        $this->addMessage( 'listValidateSuccess', array( 'table' => $table ) );
        $this->redirectToReferer();
    }

    public function doListUnvalidate() {
        $table = 'comment';

        foreach( $this->ids as $id ) {
            madFramework::query(
                "insert into comment set id = :id, status = 'unvalidated'",
                array(
                    'id' => $id,
                )
            );
        }

        $this->addMessage( 'listValidateSuccess', array( 'table' => $table ) );
        $this->redirectToReferer();
    }
}

?>
