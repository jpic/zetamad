<?php

class madFatalController extends madController {
    public function doFatal(  ) {
        if ( isset( $_SESSION['fatalRequest'] ) ) {
            $this->result->variables['fatalRequest'] = $_SESSION['fatalRequest'];
            unset( $_SESSION['fatalRequest'] );
        }
    }
}

?>