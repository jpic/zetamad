<?php
define( 'ENTRY_APP_PATH', realpath( 
    join( DIRECTORY_SEPARATOR, array(
        dirname( __FILE__ ),
) ) ) );

require ENTRY_APP_PATH . '/../mad/framework.php';

$bootstraper = new madFramework( ENTRY_APP_PATH );
$bootstraper->run(  );

?>
