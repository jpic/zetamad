<?php

class madFatalController extends madController {
    public function doFatal(  ) {
        $result = new ezcMvcResult;
        
        if ( isset( $_SESSION['fatalRequest'] ) ) {
            $result->variables['fatalRequest'] = $_SESSION['fatalRequest'];
            unset( $_SESSION['fatalRequest'] );
        }

        return $result;
    }
}

?>
