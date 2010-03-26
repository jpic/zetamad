<?php
/**
 * @package Base
 * @subpackage Tests
 */
class madBaseTest extends PHPUnit_Framework_TestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madBaseTest' );
    }

    /**
     * @expectedException madBasePropertyNotFoundException
     */
    public function testGetterSanity(  ) {
        $fixture = new madBase(  );
        $fixture->aoeusthaoeusthoaeustaonehuoasnethu;
    }

    public function testSetOptions(  ) {
        $fixture = new madBase( array( 'foo' => 'fooVal' ) );
        $fixture->setOptions( array( 'foo' => 'fooOpt' ) );
        $this->assertEquals( 'fooVal', $fixture['foo'] );
        $this->assertEquals( 'fooOpt', $fixture->foo );
    }

    public function testSetOptionsNested(  ) {
        $fixture = new madBase( array( 
            'foo' => array( 
                'bar' => 'barVal',
            ),
        ) );
        $fixture->setOptions( array( 
            'foo' => array( 
                'bar' => 'barOpt',
            ),
        ) );

        $this->assertEquals( 'barVal', $fixture['foo']['bar'] );
        $this->assertEquals( 'barOpt', $fixture->foo->bar );
    }

    public function testSetOptionsNestedMore(  ) {
        $fixture = new madBase( array( 
            'foo' => array( 
                'bar' => array( 
                    'test' => 'testVal',
                )
            ),
        ) );
        $fixture->setOptions( array( 
            'foo' => array( 
                'bar' => array( 
                    'test' => 'testOpt',
                )
            ),
        ) );

        $this->assertEquals( 'testVal', $fixture['foo']['bar']['test'] );
        $this->assertEquals( 'testOpt', $fixture->foo->bar->test );
    }

    public function testSetOptionsWithFormConfig(  ) {
        $fixture = new madBase( );
        $fixture->setOptions( array( 
            'fields' => array( 
                'foo' => array( 
                    'label' => 'foo label',
                )
            ),
        ) );

        $this->assertEquals( 'foo label', $fixture->fields->foo->label );
    }

    static public function mergeProvider(  ) {
        return array(
            array(
                'simple',
                new madBase( array( 
                    'foo' => 'bar',
                ) ),
                array( 
                    'foo' => 'test',
                ),
                new madBase( array( 
                    'foo' => 'test',
                ) ),
            ),
            array(
                'fk',
                new madBase( array( 
                    'foo' => 'bar',
                ) ),
                array( 
                    'foo' => 'test',
                    'fk'  => array( 
                        'nosql' => 'kiss',
                    ),
                ),
                new madBase( array( 
                    'foo' => 'test',
                    'fk'  => new madBase( array( 
                        'nosql' => 'kiss',
                    ) ),
                ) ),
            ),
            array(
                'relatedAdd',
                new madBase( array( 
                    'foo' => 'bar',
                ) ),
                array( 
                    'foo' => 'test',
                    'rel'  => array( 
                        array( 
                            'nosql' => 'kiss',
                        ),
                        array( 
                            'oop' => 'ok',
                        ),
                    ),
                ),
                new madBase( array( 
                    'foo' => 'test',
                    'rel'  => new madBase( array( 
                        new madBase( array(  
                            'nosql' => 'kiss',
                        ) ),
                        new madBase( array(  
                            'oop' => 'ok',
                        ) ),
                    ) ),
                ) ),
            ),
            array(
                'relatedEdit',
                new madBase( array( 
                    'foo' => 'bar',
                    'rel'  => new madBase( array( 
                        new madBase( array(  
                            'nosql' => 'sucks',
                        ) ),
                        new madBase( array(  
                            'oop' => 'bad',
                            'rhum' => 'good',
                        ) ),
                    ) ),

                ) ),
                array( 
                    'foo' => 'test',
                    'rel'  => array( 
                        array( 
                            'nosql' => 'kiss',
                        ),
                        array( 
                            'oop' => 'ok',
                        ),
                    ),
                ),
                new madBase( array( 
                    'foo' => 'test',
                    'rel'  => new madBase( array( 
                        new madBase( array(  
                            'nosql' => 'kiss',
                        ) ),
                        new madBase( array(  
                            'oop' => 'ok',
                            'rhum' => 'good',
                        ) ),
                    ) ),
                ) ),
            ),
        );
    }

    /**
     * @dataProvider mergeProvider
     */
    public function testMerge( $scenario, $fixture, $merge, $expected ) {
        $fixture->merge( $merge );
        $this->assertEquals( $expected, $fixture );
    }

    /**
     * @dataProvider mergeProvider
     */
    public function testDoubleMerge( $scenario, $fixture, $merge, $expected ) {
        $fixture->merge( $merge );
        $fixture->merge( $merge );
        $this->assertEquals( $expected, $fixture );
    }

    /**
     * @dataProvider mergeProvider
     */
    public function testTripleMerge( $scenario, $fixture, $merge, $expected ) {
        $fixture->merge( $merge );
        $fixture->merge( $merge );
        $fixture->merge( $merge );
        $this->assertEquals( $expected, $fixture );
    }

    static public function cleanProvider(  ) {
        return array( 
            array( 
                'idle',
                new madBase( array(  
                    'foo' => 'bar',
                ) ),
                new madBase( array(  
                    'foo' => 'bar',
                ) ),
            ),
            array( 
                'simple',
                new madBase( array(  
                    'foo' => 'bar',
                    'empty' => '',
                ) ),
                new madBase( array(  
                    'foo' => 'bar',
                ) ),
            ),
            array( 
                'fk',
                new madBase( array(  
                    'foo' => 'bar',
                    'empty' => '',
                    'related' => new madBase( array( 
                        'rfoo' => 'rbar',
                        'rempty' => '',
                    ) ),
                ) ),
                new madBase( array(  
                    'foo' => 'bar',
                    'related' => new madBase( array( 
                        'rfoo' => 'rbar',
                    ) ),
                ) ),
            ),
            array( 
                'emptyfk',
                new madBase( array(  
                    'foo' => 'bar',
                    'empty' => '',
                    'related' => new madBase( array( 
                        'rempty' => '',
                    ) ),
                ) ),
                new madBase( array(  
                    'foo' => 'bar',
                ) ),
            ),
            array( 
                'relations',
                new madBase( array(  
                    'foo' => 'bar',
                    'empty' => '',
                    'relations' => new madBase( array( 
                        new madBase( array( 
                            'foo' => 'bar',
                            'empty' => '',
                        ) ),
                        new madBase( array( 
                            'empty'  => '',
                            'empty2' => '',
                        ) ),
                    ) ),
                ) ),
                new madBase( array(  
                    'foo' => 'bar',
                    'relations' => new madBase( array( 
                        new madBase( array( 
                            'foo' => 'bar',
                        ) ),
                    ) ),
                ) ),
            ),
        );
    }

    /**
     * @dataProvider cleanProvider
     */
    public function testClean( $scenario, $fixture, $expected ) {
        $fixture->clean( );
        $this->assertEquals( $expected, $fixture );
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
                'simple',
                new madBase(array( 
                    'foo' => 'bar',
                )),
                new madBase(  ),
            ),
            array(
                'fk',
                new madBase(array( 
                    'foo' => 'bar',
                    'fk' => new madBase( array(  
                        'foo' => 'bar'
                    ) ),
                )),
                new madBase( array( 
                    'fk' => new madBase( array(  
                    ) ),
                ) ),
            ),
        );
    }

    /**
     * @dataProvider clearProvider
     */
    public function testClear( $scenario, $fixture, $expected ) {
        $fixture->clear();
        $this->assertEquals( $expected, $fixture );
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
}
