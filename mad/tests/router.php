<?php

class fooConfigurationManagerMock extends ezcConfigurationManager {
    public function __construct(  ) {

    }
}

class madCoreRouterTest extends ezcTestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madCoreRouterTest' );
    }

    static public function getRoutingInformationProvider(  ) {
        $scenarios = array();

        $fixtures = join( DIRECTORY_SEPARATOR, array(
            dirname( __FILE__ ),
            'fixtures',
            '*',
        ) );

        foreach( glob( $fixtures ) as $test ) {
            $arguments = array();

            $arguments[] = substr( $test, strrpos( $test, DIRECTORY_SEPARATOR ) + 1 );

            if ( file_exists( $test . DIRECTORY_SEPARATOR . 'routes.php' ) ) {
                // old, simple tests
                $arguments[] = require $test . DIRECTORY_SEPARATOR . 'routes.php';
                $arguments[] = require $test . DIRECTORY_SEPARATOR . 'request.php';
            } else { // badass tests with environment emulation
                // we're going to generate the conf cache of MASTER if necessarry
                // second pass to ensure MASTER is first
                // because its config should not be overwritten by the config of 
                // required apps
                $routesPath = join( DIRECTORY_SEPARATOR, array( 
                        $test,
                        'MASTER',
                        'cache',
                        'conf',
                        'routes.php'
                     ) );

                if ( !file_exists( $routesPath ) ) {
                    // do cache
                    $paths = array( 
                        $test . DIRECTORY_SEPARATOR . 'MASTER' . DIRECTORY_SEPARATOR . 'conf',
                    );
                    foreach( glob( $test . DIRECTORY_SEPARATOR . '*' ) as $app ) {
                        if ( strpos( $app, 'MASTER' ) ) {
                            continue;
                        } else {
                            $paths[] = $app . DIRECTORY_SEPARATOR . 'conf';
                        }
                    }
                    $confCachePath = join( DIRECTORY_SEPARATOR, array(  
                        $test,
                        'MASTER',
                        'cache',
                        'conf',
                    ) );
                    shell_exec( "mkdir -p $confCachePath" );
                    $conf = new madCoreConfiguration( $paths );
                    $conf->clean(  );
                    $conf->prefixRoutes(  );
                    $conf->write( $confCachePath );
                }
                
                if ( !file_exists( $routesPath ) ) {
                    trigger_error(  "NO $routesPath? incomplete fixture or bug?" );
                    continue;
                }

                $arguments[] = require $routesPath;
                $arguments[] = require $test . DIRECTORY_SEPARATOR . 'request.php';

            }
            
            $expected = $test . DIRECTORY_SEPARATOR . 'expected.php';
            if( file_exists( $expected ) ) {
                $arguments[] = require $expected;
                $arguments[] = false; // don't overwrite
            } else {
                $arguments[] = $expected;
                $arguments[] = true;
            }

            $scenarios[] = $arguments;
        }

        return $scenarios;
    }

    /**
     * @dataProvider getRoutingInformationProvider
     */
    public function testGetRoutingInformation( $scenario, $config, $request, $expected, $write ) {
        $fixture = new madCoreRouter( $request, $config['settings'] );
        $routeInfo = $fixture->getRoutingInformation();
        $requestVariables = $request->variables;

        if ( $write ) {
            // hack because the router is not serializable
            $routeInfo->router = null;
            
            file_put_contents( $expected, sprintf( 
                "<?php \$routeInfo = %s; \n\$requestVariables = %s; \nreturn array( \$routeInfo, \$requestVariables ) ?>",
                var_export( $routeInfo, true ) ,
                var_export( $requestVariables, true ) 
            ) );
        } else {
            // hack because the router is not serializable
            $expected[0]->router = $fixture;
            
            $this->assertEquals( $expected[0], $routeInfo );
            $this->assertEquals( $expected[1], $requestVariables );
        }
    }
}
?>
