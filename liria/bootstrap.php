<?php
define( 'APP_PATH', realpath( 
    join( DIRECTORY_SEPARATOR, array(
        dirname( __FILE__ ),
) ) ) );

define( 'PRESTASHOP_PATH', realpath( 
    join( DIRECTORY_SEPARATOR, array(
        dirname( __FILE__ ),
        '..',
        '..'
) ) ) );

define( 'APPS_PATH', realpath( 
    join( DIRECTORY_SEPARATOR, array(
        dirname( __FILE__ ),
        '..',
) ) ) );

set_include_path( join( PATH_SEPARATOR, array( 
    get_include_path(  ),
    APPS_PATH,
    APP_PATH,
    PRESTASHOP_PATH,
) ) );

//require 'mad/ezc/Base/base.php';
//require 'mad/ezc/Base/options.php';

error_reporting( E_ALL|E_STRICT );

define( 'CACHE_REGEN', PHP_OS == 'Linux' && !strpos( $_SERVER['REQUEST_URI'], 'static' ) );
define( 'MODEL_REGEN', !strpos( $_SERVER['REQUEST_URI'], 'static' ) );

if ( CACHE_REGEN ) {
    $ocwd = getcwd();
    chdir( dirname( __FILE__ ) );
    # regenerate autoload cache
    shell_exec( 'bin/generate-autoload-file ../ > cache/autoload.php' );
    chdir( $ocwd );
}

$autoloadArray = require APP_PATH . DIRECTORY_SEPARATOR . 'cache' . DIRECTORY_SEPARATOR . 'autoload.php';

function __autoload( $class ) {
    global $autoloadArray;

    $prestashopClassPath = join( DIRECTORY_SEPARATOR, array( 
        PRESTASHOP_PATH,
        'classes',
        $class . '.php',
    ) );

    if( isset( $autoloadArray[$class] ) ) {
        $path = realpath( join( DIRECTORY_SEPARATOR, array( 
            APP_PATH,
            $autoloadArray[$class]
        ) ) );
        require $path;
    } elseif( file_exists( $prestashopClassPath ) ) {
        require $prestashopClassPath;
    } else {
        trigger_error( "Autoload can't load class '$class'" );
    }
}

if ( CACHE_REGEN ) {
    $ocwd = getcwd();
    chdir( dirname( __FILE__ ) );
    # regenerate bin
    chdir( 'bin' );
    shell_exec( './generate-bin ../../' );
    chdir( $ocwd );
}

$registry = madRegistry::instance();

# regenerate conf
if ( PHP_OS == 'Linux' && !strpos( $_SERVER['REQUEST_URI'], 'static' ) ) {
    $registry->configuration = madCoreConfiguration::factory( APP_PATH, true );
} else {
    $registry->configuration = madCoreConfiguration::factory( APP_PATH );
}
$registry->database = new PDO( 'mysql:host=localhost;dbname=madmodel', 'root'); # , null, array( PDO::MYSQLI_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\'')); 
$registry->database->query( 'set names "UTF-8"' );
$registry->database->setAttribute( PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
$registry->model = new madModel( $registry->database, $registry->configuration->settings['model'], $registry->configuration->settings['core']['model'] );

if ( MODEL_REGEN ) {
    $registry->model->applyConfiguration(  );
}

unset( $registry );

// prestashop compat
require PRESTASHOP_PATH . '/config/config.inc.php';
$GLOBALS['smarty'] = $smarty;
Configuration::loadConfiguration(  );
?>
