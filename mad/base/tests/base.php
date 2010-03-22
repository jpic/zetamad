<?php
/**
 * @package Base
 * @subpackage Tests
 */
class madBaseTest extends PHPUnit_Framework_TestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madBaseTest' );
    }

    public function dirtyAttributesProvider(  ) {
        return array( 
            array(
                new madBase( array( 
                    'foo' => 'bar',
                ) ),
                false,
            ),
            array(
                new madBase( array( 
                    'foo' => 'bar',
                    'fail' => array(  ),
                ) ),
                array( 
                    'fail',
                ),
            ),
            array( // test madBase with mixed keys
                new madBase( array( 
                    'foo' => 'bar',
                    'test'
                )),
                array( 
                    'foo',
                ),
            )
        );
    }

    /**
     * @dataProvider dirtyAttributesProvider
     */
    public function testDirtyAttributes( $fixture, $expected ) {
        $result = $fixture->dirtyAttributes(  );
        if ( $result ) {
            $this->assertEquals( $expected, array_keys( $result ) );
        } else {
            $this->assertEquals( $expected, $result );
        }
    }

    public function clearProvider(  ) {
        return array( 
            array(
                new madBase(array( 
                    'foo' => 'bar',
                )),
            ),
        );
    }

    /**
     * @dataProvider clearProvider
     */
    public function testClear( $fixture ) {
        $fixture->clear();

        $this->assertEquals( 0, count( $fixture ) );
    }

    static public function isEntityProvider( )  {
        return array( 
            array(
                'simpleEntity',
                new madBase(array( 
                   'foo' => 'bar',
                )),
                true,
            ),
            array( 
                'simpleMultiVal',
                new madBase(array( 
                    'bar',
                    'foo',
                )),
                false,
            ),
            array(
                'multiEntity',
                new madBase(array( 
                    new madBase(array( 
                        'example' => 'test',
                    )),
                    new madBase(array( 
                        'bar' => 'foo',
                    )),
                )),
                false,
            ),
            array( 
                'null',
                new madBase(),
                null,
            ),
        );
    }

    /**
     * @dataProvider isEntityProvider
     */
    public function testIsEntity( $scenario, $fixture, $expected ) {
        $this->assertEquals( $expected, $fixture->isEntity );
    }

    /**
     * @expectedException madBasePropertyNotFoundException
     */
    public function testGetterSanity(  ) {
        $fixture = new madBase(  );
        $fixture->aoeusthaoeusthoaeustaonehuoasnethu;
    }
}
