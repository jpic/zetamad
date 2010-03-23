<?php

class madCiController extends ezcMvcController {
    public function doRuntests(  ) {
        chdir( realpath( join( DIRECTORY_SEPARATOR, array( 
            dirname( __FILE__ ),
            '..'
        ) ) ) );

        $bootstrap = realpath( join( DIRECTORY_SEPARATOR, array( 
            '..',
            'liria',
            'bootstrap.php'
        ) ) );


        $out = shell_exec( 'MAD_BOOTSTRAP="'.$bootstrap.'" ci/bin/runtests' );

        $result = new ezcMvcResult(  );
        $result->variables['consoleOutput'] = $out;
        return $result;
    }
}

?>
