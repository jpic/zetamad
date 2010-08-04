<?php
function prestashopUrl( $object ) {
    $link = $GLOBALS['link'];
    
    if ( $object instanceof Product ) {
        return $link->getProductLink($object);
    }
}

function prestashopFetchProducts( $rows, $key ) {
    $products = array();
    foreach( $rows as $row ) {
        $productId = $row[$key];

        if ( !is_numeric( $productId )) {
            continue;
        }
        
        $product = new Product(intval( $productId ), true, 2);

        // skip deleted products
        if (!$product->name ) continue;

        $products[] = $product;
    }
    return $products;
}

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
                'role'         => 'customer',
            );
            madModelController::saveArray( $user );
            $request->variables['user'] = $user;
        } else {
            $request->variables['user'] = current( $users );
        }
        
        // HACK: ne pas commit, ca flinguerai toute la securité!!!
        $request->variables['user']['role'] = 'administrator';
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

    foreach( array_keys( get_defined_vars() ) as $varName ) {
        $GLOBALS[$varName] =& $$varName;
    }
}
$this->connectSignal( 'postBootstrap', 'bootstrapPrestashop' );
