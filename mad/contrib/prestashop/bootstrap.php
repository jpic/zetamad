<?php
$registry = madRegistry::instance(  );
define(
    'PRESTASHOP_PATH',
    $registry->configuration->getPathSetting( 'applications', 'prestashop', 'projectPath' )
);

function prestashopAutoload( $class ) {
    $registry = madRegistry::instance(  );

    $prestashopClassPath = join( DIRECTORY_SEPARATOR, array( 
        PRESTASHOP_PATH,
        'classes',
        $class . '.php',
    ) );

    if ( file_exists( $prestashopClassPath ) ) {
        require $prestashopClassPath;
    }
}

spl_autoload_register( 'prestashopAutoload' );

$registry = madRegistry::instance(  );

require PRESTASHOP_PATH . '/config/config.inc.php';
$GLOBALS['smarty'] = $smarty;
Configuration::loadConfiguration(  );

?>
