<?php
define( 'ENTRY_APP_PATH', realpath( 
    join( DIRECTORY_SEPARATOR, array(
        dirname( __FILE__ ),
) ) ) );

require ENTRY_APP_PATH . '/../mad/bootstrapper.php';

$bootstraper = new madBootstrapper( ENTRY_APP_PATH );
$bootstraper->run(  );

?>
