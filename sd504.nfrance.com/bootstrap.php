<?php
define( 'ENTRY_APP_PATH', realpath( 
    join( DIRECTORY_SEPARATOR, array(
        dirname( __FILE__ ),
) ) ) );

require ENTRY_APP_PATH . '/../mad/bootstrapper.php';

$bootstraper = new madFramework( require 'cache/etc/core.php' );
$bootstraper->run(  );

?>
