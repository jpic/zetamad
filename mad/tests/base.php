<?php
/**
 * @package Base
 * @subpackage Tests
 */
class madObjectTest extends PHPUnit_Framework_TestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madObjectTest' );
    }

    /**
     * @expectedException madObjectPropertyNotFoundException
     */
    public function testGetterSanity(  ) {
        $fixture = new madObject(  );
        $fixture->aoeusthaoeusthoaeustaonehuoasnethu;
    }

    public function testSetOptions(  ) {
        $fixture = new madObject( array( 'foo' => 'fooVal' ) );
        $fixture->setOptions( array( 'foo' => 'fooOpt' ) );
        $this->assertEquals( 'fooVal', $fixture['foo'] );
        $this->assertEquals( 'fooOpt', $fixture->foo );
    }

    public function testSetOptionsNested(  ) {
        $fixture = new madObject( array( 
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
        $fixture = new madObject( array( 
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
        $fixture = new madObject( );
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
                new madObject( array( 
                    'foo' => 'bar',
                ) ),
                array( 
                    'foo' => 'test',
                ),
                new madObject( array( 
                    'foo' => 'test',
                ) ),
            ),
            array(
                'fk',
                new madObject( array( 
                    'foo' => 'bar',
                ) ),
                array( 
                    'foo' => 'test',
                    'fk'  => array( 
                        'nosql' => 'kiss',
                    ),
                ),
                new madObject( array( 
                    'foo' => 'test',
                    'fk'  => new madObject( array( 
                        'nosql' => 'kiss',
                    ) ),
                ) ),
            ),
            array(
                'relatedAdd',
                new madObject( array( 
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
                new madObject( array( 
                    'foo' => 'test',
                    'rel'  => new madObject( array( 
                        new madObject( array(  
                            'nosql' => 'kiss',
                        ) ),
                        new madObject( array(  
                            'oop' => 'ok',
                        ) ),
                    ) ),
                ) ),
            ),
            array(
                'relatedEdit',
                new madObject( array( 
                    'foo' => 'bar',
                    'rel'  => new madObject( array( 
                        new madObject( array(  
                            'nosql' => 'sucks',
                        ) ),
                        new madObject( array(  
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
                new madObject( array( 
                    'foo' => 'test',
                    'rel'  => new madObject( array( 
                        new madObject( array(  
                            'nosql' => 'kiss',
                        ) ),
                        new madObject( array(  
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
                new madObject( array(  
                    'foo' => 'bar',
                ) ),
                new madObject( array(  
                    'foo' => 'bar',
                ) ),
            ),
            array( 
                'simple',
                new madObject( array(  
                    'foo' => 'bar',
                    'empty' => '',
                ) ),
                new madObject( array(  
                    'foo' => 'bar',
                ) ),
            ),
            array( 
                'multival',
                new madObject( array(  
                    'foo' => 'bar',
                    'test' => new madObject( array(  
                        123,
                        456,
                        ''
                    ) ),
                ) ),
                new madObject( array(  
                    'foo' => 'bar',
                    'test' => new madObject( array(  
                        123,
                        456,
                    ) ),
                ) ),
            ),
            array( 
                'fk',
                new madObject( array(  
                    'foo' => 'bar',
                    'empty' => '',
                    'related' => new madObject( array( 
                        'rfoo' => 'rbar',
                        'rempty' => '',
                    ) ),
                ) ),
                new madObject( array(  
                    'foo' => 'bar',
                    'related' => new madObject( array( 
                        'rfoo' => 'rbar',
                    ) ),
                ) ),
            ),
            array( 
                'emptyfk',
                new madObject( array(  
                    'foo' => 'bar',
                    'empty' => '',
                    'related' => new madObject( array( 
                        'rempty' => '',
                    ) ),
                ) ),
                new madObject( array(  
                    'foo' => 'bar',
                ) ),
            ),
            array( 
                'relations',
                new madObject( array(  
                    'foo' => 'bar',
                    'empty' => '',
                    'relations' => new madObject( array( 
                        new madObject( array( 
                            'foo' => 'bar',
                            'empty' => '',
                        ) ),
                        new madObject( array( 
                            'empty'  => '',
                            'empty2' => '',
                        ) ),
                    ) ),
                ) ),
                new madObject( array(  
                    'foo' => 'bar',
                    'relations' => new madObject( array( 
                        new madObject( array( 
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
                new madObject( array( 
                    'foo' => 'bar',
                ) ),
                false,
            ),
            array(
                new madObject( array( 
                    'foo' => 'bar',
                    'fail' => array(  ),
                ) ),
                array( 
                    'fail',
                ),
            ),
            array( // test madObject with mixed keys
                new madObject( array( 
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
                new madObject(array( 
                    'foo' => 'bar',
                )),
                new madObject(  ),
            ),
            array(
                'fk',
                new madObject(array( 
                    'foo' => 'bar',
                    'fk' => new madObject( array(  
                        'foo' => 'bar'
                    ) ),
                )),
                new madObject( array( 
                    'fk' => new madObject( array(  
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
                new madObject(array( 
                   'foo' => 'bar',
                )),
                true,
            ),
            array( 
                'simpleMultiVal',
                new madObject(array( 
                    'bar',
                    'foo',
                )),
                false,
            ),
            array(
                'multiEntity',
                new madObject(array( 
                    new madObject(array( 
                        'example' => 'test',
                    )),
                    new madObject(array( 
                        'bar' => 'foo',
                    )),
                )),
                false,
            ),
            array( 
                'null',
                new madObject(),
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
