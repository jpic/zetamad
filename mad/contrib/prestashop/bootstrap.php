<?php
$registry = madRegistry::instance(  );

// authentication backend
function prestashopAuthentication( ezcMvcRequest $request ) {
    $registry = madRegistry::instance(  );
    $cookie = new Cookie( 'ps' );
    
    if ( $cookie->isLogged(  ) ) {
        $users = $registry->model->queryLoad( 
            'select id from %(user_index)s where prestashopId = :id', 
            array( 'id' => $cookie->id_customer )
        );
        
        if ( !count( $users ) ) {
            $result = madModelController::routeFormData(
                // ideally we'd use authentication.register but we dont have it 
                // defined yet
                'authentication.userCreate', 
                array( 
                    'firstName'    => $cookie->customer_firstname,
                    'lastName'     => $cookie->customer_lastname,
                    'email'        => $cookie->email,
                    'password'     => $cookie->passwd,
                    'prestashopId' => intval( $cookie->id_customer ),
                    'namespace'    => 'user',
                )
            );

            $request->variables['user'] = $result['form'];
        } else {
            $request->variables['user'] = current( $users );
        }
    }
}
$registry->signals->connect( 'requestParsed', 'prestashopAuthentication' );

// fix autoload
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

function prestashopDatabaseSettings( $bootstrap ) {
    define( 'PRESTASHOP_PATH', $bootstrap->configuration['prestashop']['projectPath'] );
    require PRESTASHOP_PATH . '/config/config.inc.php';

    // set the database with prestashop settings
    $database = new PDO( 'mysql:host=' . _DB_SERVER_ . ';dbname=' . _DB_NAME_, _DB_USER_, _DB_PASSWD_ );
    madRegistry::instance(  )->database = $database;

    return false; // will prevent normal setting of $registery->database
}
$registry->signals->connect( 'preSetupDatabase', 'prestashopDatabaseSettings' );

function bootstrapPrestashop( $bootstrap ) {
    $GLOBALS['smarty'] = $smarty;
    Configuration::loadConfiguration(  );
}

$registry->signals->connect( 'postBootstrap', 'bootstrapPrestashop' );
?>
