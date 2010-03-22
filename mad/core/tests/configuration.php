<?php
/**
 * @package MadConfiguration
 * @subpackage Tests
 */
class madCoreConfigurationTest extends ezcTestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madCoreConfigurationTest' );
    }

    static public function configCacheFunctionnalProvider(  ) {
        $scenarios = array();

        $fixtures = join( DIRECTORY_SEPARATOR, array(
            dirname( __FILE__ ),
            'configuration_fixtures',
            '*_source',
        ) );

        foreach( glob( $fixtures ) as $test ) {
            $arguments = array();

            $name = str_replace(
                '_source',
                '',
                substr( $test, strrpos( $test, DIRECTORY_SEPARATOR ) + 1 )
            );

            $arguments[] = $name;
            $arguments[] = glob( $test . DIRECTORY_SEPARATOR . '*' . DIRECTORY_SEPARATOR . 'conf' );
            $arguments[] = str_replace( '_source', '_expected', $test );
            
            if( is_dir( $arguments[2] ) ) {
                $arguments[] = false; // don't overwrite
            } else {
                shell_exec( "mkdir -p {$arguments[2]}" );
                $arguments[] = true;
            }

            $scenarios[] = $arguments;
        }

        // second pass to ensure MASTER is first
        // because its config should not be overwritten by the config of 
        // included apps
        $scenarios_final = array();
        foreach( $scenarios as $key => $scenario ) {
            $paths = $scenario[1];
            $master_key = $master_path = null;

            foreach( $paths as $key => $value ) {
                if ( strpos( $value, 'MASTER' ) ) {
                    $master_key = $key;
                    $master_path = $value;
                }
            }

            unset( $paths[$master_key] );
            array_unshift( $paths, $master_path );
            $scenarios_final[] = array( 
                $scenario[0],
                $paths,
                $scenario[2],
                $scenario[3],
            );
        }

        return $scenarios_final;
    }

    /**
     * @dataProvider configCacheFunctionnalProvider
     */
    public function testConfigCacheFunctionnal( $scenario, $paths, $expected, $write ) {
        $config = new madCoreConfiguration( $paths );
        if ( $write ) {
            $config->write( $expected );
            $this->markTestSkipped(  );
        } else {
            $this->createTempDir( '/tmp' );
            $result = $this->getTempDir(  );
            $config->write( $result );
            $equal = shell_exec( "diff $expected $result" ) == null;
            $this->assertTrue( $equal, "diff -u $expected $result" );
        }
    }
}
