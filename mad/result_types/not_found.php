<?php
class madNotFoundStatus implements ezcMvcResultStatusObject {
    public function process( ezcMvcResponseWriter $writer ) {
        if ( $writer instanceof ezcMvcHttpResponseWriter ) {
            header("HTTP/1.0 404 Not Found");
        }
    }
}
?>
