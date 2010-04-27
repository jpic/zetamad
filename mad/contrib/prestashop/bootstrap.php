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

if ( $registry->configuration->getSetting( 'applications', 'prestashop', 'instanciatePdo', false ) ) {
    $database = new PDO( 'mysql:host=' . _DB_SERVER_ ';dbname=' . _DB_NAME_, _DB_USER_, _DB_PASSWD_ );
    $registry->database = $database;
}

?>
