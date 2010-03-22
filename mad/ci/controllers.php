<?php

class madCiController extends ezcMvcController {
    public function doRuntests(  ) {
        chdir( realpath( join( DIRECTORY_SEPARATOR, array( 
            dirname( __FILE__ ),
            '..'
        ) ) ) );
        shell_exec( 'ci/bin/runtests' );
    }
}

?>
