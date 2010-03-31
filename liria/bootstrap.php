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

if ( PHP_OS == 'Linux' ) {
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

if ( PHP_OS == 'Linux' ) {
    $ocwd = getcwd();
    chdir( dirname( __FILE__ ) );
    # regenerate bin
    chdir( 'bin' );
    shell_exec( './generate-bin ../../' );
    chdir( $ocwd );
}

$registry = madRegistry::instance();

# regenerate conf
if ( PHP_OS == 'Linux' ) {
    $registry->configuration = madCoreConfiguration::factory( APP_PATH, true );
} else {
    $registry->configuration = madCoreConfiguration::factory( APP_PATH );
}
$registry->database = new PDO( 'mysql:host=localhost;dbname=madmodel', 'root' ); #, null, array( PDO::MYSQLI_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\'')); 
$registry->database->setAttribute( PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
$registry->model = new madModel( $registry->database );

unset( $registry );
?>
