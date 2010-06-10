<?php
// authentication backend
function prestashopAuthentication( ezcMvcRequest $request, ezcMvcRouter $router ) {
    $framework = madFramework::instance(  );
    $cookie = new Cookie( 'ps' );
    
    if ( $cookie->isLogged(  ) ) {
        $users = madFramework::query(
            'select id, firstName, lastName, email, prestashopId, role from user where prestashopId = :prestashopId',
            array(
                'prestashopId' => (string)intval( $cookie->id_customer )
            )
        );
        
        if ( !count( $users ) ) {
            $user = array( 
                'firstName'    => $cookie->customer_firstname,
                'lastName'     => $cookie->customer_lastname,
                'email'        => $cookie->email,
                'prestashopId' => intval( $cookie->id_customer ),
                'namespace'    => 'user',
            );
            madModelController::saveArray( $user );
            $request->variables['user'] = $user;
        } else {
            $request->variables['user'] = current( $users );
        }
    }
}
$this->connectSignal( 'postCreateRouter', 'prestashopAuthentication' );

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
$this->connectSignal( 'preSetupDatabase', 'prestashopDatabaseSettings' );

function bootstrapPrestashop( $bootstrap ) {
    $smarty = $GLOBALS['smarty'];
    require PRESTASHOP_PATH . '/init.php';
    Configuration::loadConfiguration(  );
}
$this->connectSignal( 'postBootstrap', 'bootstrapPrestashop' );
