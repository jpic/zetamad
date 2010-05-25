<?php
$framework = madFramework::instance(  );

// authentication backend
function prestashopAuthentication( ezcMvcRequest $request, ezcMvcRouter $router ) {
    $framework = madFramework::instance(  );
    $cookie = new Cookie( 'ps' );
    
    if ( $cookie->isLogged(  ) ) {
        $users = $framework->pdo->query( 
            'select id from users where prestashopId = ' . intval( $cookie->id_customer )
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

            $request->variables['user'] = $result->variables['form'];
        } else {
            $request->variables['user'] = current( $users );
        }
    }
}
$framework->signals->connect( 'postCreateRouter', 'prestashopAuthentication' );

// fix autoload
function prestashopAutoload( $class ) {
    $framework = madFramework::instance(  );

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

function prestashopDatabaseSettings( $framework ) {
    define( 'PRESTASHOP_PATH', $framework->configuration->getPathSetting( 'applications', 'prestashop', 'projectPath' ) );
    require PRESTASHOP_PATH . '/config/config.inc.php';
    $GLOBALS['smarty'] = $smarty;

    // set the database with prestashop settings
    $framework->pdo = new madPDOFramework( 'mysql:host=' . _DB_SERVER_ . ';dbname=' . _DB_NAME_, _DB_USER_, _DB_PASSWD_ );

    return false; // will prevent normal setting of $registery->database
}
$framework->signals->connect( 'preSetupDatabase', 'prestashopDatabaseSettings' );

function bootstrapPrestashop( $bootstrap ) {
    $smarty = $GLOBALS['smarty'];
    require PRESTASHOP_PATH . '/init.php';
    Configuration::loadConfiguration(  );
}
$framework->signals->connect( 'postBootstrap', 'bootstrapPrestashop' );
?>
