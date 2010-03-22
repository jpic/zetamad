<?php
define( 'EZC_TRUNK_PATH', realpath( 
    join( DIRECTORY_SEPARATOR, array(
        DIRECTORY_SEPARATOR . 'srv',
        'ezc',
        'trunk',
) ) ) );

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
    EZC_TRUNK_PATH,
    APPS_PATH,
    APP_PATH,
    PRESTASHOP_PATH,
) ) );

require 'Base/src/base.php';
ezcBase::setRunMode( ezcBase::MODE_DEVELOPMENT );
ezcBase::addClassRepository( APP_PATH, APP_PATH . DIRECTORY_SEPARATOR . 'cache' );

function __autoload( $class ) {
    try {
        ezcBase::autoload( $class );
    } catch( ezcBaseAutoloadException $e ) {
        require join( DIRECTORY_SEPARATOR, array( 
            PRESTASHOP_PATH,
            'classes',
            $class . '.php',
        ) );
    }
}

$options = new ezcBaseAutoloadOptions;
$options->debug = true;
ezcBase::setOptions( $options ); 

$ocwd = getcwd();
chdir( dirname( __FILE__ ) );
# regenerate bin
chdir( 'bin' );
shell_exec( './generate-bin ../../' );
chdir( '..' );
# regenerate autoload cache
shell_exec( 'bin/generate-autoload-file ../ > cache/autoload.php' );
chdir( $ocwd );

$registry = madRegistry::instance();

# regenerate conf
$registry->configuration = madCoreConfiguration::factory( APP_PATH, true );
$registry->database = ezcDbFactory::create( 'mysql://root@localhost/madmodel' );
$registry->model = new madModel( $registry->database );

unset( $registry );
?>
