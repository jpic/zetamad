<?php

require_once 'PHPUnit/Extensions/Database/TestCase.php';

/**
 * @package MadModel
 * @subpackage Tests
 */
class madModelTest extends PHPUnit_Framework_TestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madModelTest' );
    }

    public $model = null;

    public function setUp() {
        $this->db = new PDO( 'mysql:host=localhost;dbname=madmodel' );
        $this->model = new madModel( $this->db );
        $this->db->query( 'truncate mad_model' );
    }

    /**
     * @expectedException madBaseValueException
     */
    public function testConstructorSanity(  ) {
        new madModel( 'fail' );
    }

    static public function fixtureProvider( ) {
        return array( 
            array(
                'simple',
                new madBase( array( // initial
                    'title'    => 'Mojito',
                    'category' => 'Drinks',
                    'origin'   => 'Carabians',
                ) ),
            ),
            array(
                'fk',
                new madBase( array( // initial
                    'title'    => 'Mojito',
                    'category' => 'Drinks',
                    'origin'   => 'Carabians',
                    'author'   => new madBase( array( 
                        'name'  => 'james',
                        'email' => 'jamespic@example.com',
                    ) ),
                ) ),
            ),
            array( 
                'multiVal',
                new madBase ( array(
                    'title'       => 'Ti\'Punch',
                    'category'    => 'Drinks',
                    'origin'      => 'DOMTOM',
                    'short_desc'  => 'Efficiant cocktail.',
                    'comment'     => 'James loves it!',
                    'preparation' => 'Do this an that and this',
                    'product_ids' => new madBase(array( 
                        2,
                        3,
                        4000
                    ) ),
                ) )
            ),
            array( 
                'reverseFk',
                new madBase ( array(
                    'title'       => 'Ti\'Punch',
                    'category'    => 'Drinks',
                    'origin'      => 'DOMTOM',
                    'short_desc'  => 'Efficiant cocktail.',
                    'comment'     => 'James loves it!',
                    'preparation' => 'Do this an that and this',
                    'comments'    => new madBase(array( 
                        new madBase( array( 
                            'author' => 'chris',
                            'post'   => 'I love it too!'
                        ) ),
                        new madBase( array( 
                            'author' => 'derick',
                            'post'   => 'Rhum is the best!'
                        ) ),
                    ) ),
                ) )
            ), // mutation tests
            array( // VERSION 1
                'mutation1',
                new madBase ( array(
                    'title'       => 'Ti\'Punch',
                    'category'    => 'Drinks',
                    'origin'      => 'DOMTOM',
                    'short_desc'  => 'Efficiant cocktail.',
                    'comment'     => 'James loves it!',
                    'preparation' => 'Do this an that and this',
                    'comments'    => new madBase(array(  // comments are simple strings
                        'i love it!',
                        'me too!'
                    ) ),
                    'product_ids' => new madBase(array( 
                        2,
                        3,
                        4000
                    ) ),
                ) )
            ),
            array( // VERSION 2
                'mutation2',
                new madBase ( array( // post mutation
                    'title'       => 'Ti\'Punch',
                    'category'    => 'Drinks',
                    'origin'      => 'DOMTOM',
                    'short_desc'  => 'Efficiant cocktail.',
                    'comment'     => 'James loves it!',
                    'preparation' => 'Do this an that and this',
                    'comments'    => new madBase(array( 
                        // comments from v1
                        'i love it!',
                        'me too!',
                        // comments from v2 ( string->related entity mutation )
                        new madBase( array(
                            'author' => 'chris',
                            'post'   => 'I love it too!'
                        ) ),
                        new madBase( array(
                            'author' => 'derick',
                            'post'   => 'rhum is the best'
                        ) ),
                    ) ),
                    'product_ids' => new madBase(array( 
                        2,
                        3,
                        4000,
                        123, //more products
                    ) ),
                ) )
            ),
            array( // VERSION 3
                'mutation3',
                new madBase ( array( // post mutation
                    'title'       => 'Ti\'Punch',
                    'category'    => 'Drinks',
                    'origin'      => 'DOMTOM',
                    'short_desc'  => 'Efficiant cocktail.',
                    'comment'     => 'James loves it!',
                    'preparation' => 'Do this an that and this',
                    'comments'    => new madBase(array( 
                        // comments from v1
                        'i love it!',
                        'me too!',
                        // comments from v2 ( string->related entity mutation )
                        new madBase( array(
                            'author' => 'chris',
                            'post'   => 'I love it too!'
                        ) ),
                        new madBase( array(
                            'author' => 'derick',
                            'post'   => 'rhum is the best'
                        ) ),
                        // comments from v3, ( nested string->related entity mutation )
                        new madBase( array(
                            'author' => new madBase( array(
                                'name' => 'james',
                                'email' => 'james@example.com',
                            ) ),
                            'post'   => 'Rhum is best from martinica!'
                        ) ),
                        new madBase( array(
                            'author' => new madBase( array(
                                'name' => 'michel',
                                'email' => 'michel@example.com',
                            ) ),
                            'post'   => 'LIAAAAR ITS BEST FROM CUBA!'
                        ) ),
                    ) ),
                    'product_ids' => new madBase(array( 
                        2,
                        3,
                        4000,
                        123,
                        245, // more product
                    ) ),
                ) )
            ),
        );
    }

    /**
     * @dataProvider fixtureProvider
     */
    public function testSave( $scenario, $fixture ) {
        $this->assertFalse( array_key_exists( 'id', $fixture ) );
        $this->model->save( $fixture );
        $this->assertFalse( $fixture['id'] === null, '$fixture should have an $id' );
    }

    /**
     * @dataProvider fixtureProvider
     */
    public function testRefresh( $scenario, $fixture ) {
        $this->model->save( $fixture );

        $result = new madBase( array(  
            'id' => $fixture['id'],
        ) );
        $this->model->refresh( $result );
        $this->assertEquals( $fixture, $result );
    }

    static public function saveForUpdateProvider(  ) {
        return array( 
            array( 
                'simplePropertyChange',
                new madBase( array( 
                    'author' => 'james',
                    'title'  => 'rhum',
                )),
                array( 
                    'title' => 'Mojito',
                ),
                new madBase( array( 
                    'author' => 'james',
                    'title' => 'Mojito',
                ) ),
            ),
            array( 
                'propertyAdd',
                new madBase( array( 
                    'author' => 'james',
                    'title'  => 'rhum',
                )),
                array( 
                    'subtitle' => 'Mojito',
                ),
                new madBase( array( 
                    'author' => 'james',
                    'title' => 'rhum',
                    'subtitle' => 'Mojito',
                ) ),
            ),
            array( 
                'simplePropertyChange+propertyAdd',
                new madBase( array( 
                    'author' => 'james',
                    'title'  => 'rhum',
                )),
                array( 
                    'title' => 'Mojito',
                    'alcohol' => 'a lot',
                ),
                new madBase( array( 
                    'author' => 'james',
                    'title' => 'Mojito',
                    'alcohol' => 'a lot',
                ) ),
            ),
        );
    }

    /**
     * @dataProvider saveForUpdateProvider
     */
    public function testSaveForUpdate( $scenario, $fixture, $changes, $expected ) {
        $this->model->save( $fixture );

        foreach( $changes as $key => $value ) {
            $fixture[$key] = $value;
        }
        $this->model->save( $fixture );
    
        foreach( $fixture as $key => $value ) {
            if ( $key == 'id' ) {
                continue;
            }

            $this->assertEquals( $expected[$key], $fixture[$key] );
        }
    }

    /**
     * @expectedException madModelExceptedId
     */
    public function testRefreshSanity(  ) {
        $this->model->refresh( new madBase(  ) );
    }


    static public function reduceProvider(  )   {
        return array( 
            array( 
                array(   
                     array(
                         'id'       => 12,
                         'attribute_key'   => 'origin',
                         'attribute_value' => 'france'
                     ),
                     array(
                         'id'       => 12,
                         'attribute_key'   => 'creator_email',
                         'attribute_value' => 'chris@mad.com',
                     ),
                     array(
                         'id'       => 13,
                         'attribute_key'   => 'origin',
                         'attribute_value' => 'spain'
                     ),
                     array(
                         'id'       => 13,
                         'attribute_key'   => 'creator_email',
                         'attribute_value' => 'james@mad.com',
                     ),
                ),
                array( 
                    12 => new madBase( array( 
                        'id'     => 12,
                        'origin' => 'france',
                        'creator_email' => 'chris@mad.com',
                    ) ),
                    13 => new madBase( array( 
                        'id'     => 13,
                        'origin' => 'spain',
                        'creator_email' => 'james@mad.com',
                    ) ),
                ),
            ),
        );
    }
      
    /**
     * @dataProvider reduceProvider
     */
    public function testReduce( $rows, $expected ) {
        $result = $this->model->reduce( $rows );
        $this->assertEquals( $expected, $result );
    }

    static public function loadProvider(  ) {
        return array( 
            array(
                array(
                    new madBase( array( 
                        'origin' => 'france',
                        'withRhum' => 'no',
                    ) ),
                    new madBase( array( 
                        'origin' => 'france',
                        'withRhum' => 'yes',
                    ) ),
                    new madBase( array( 
                        'origin' => 'spain',
                        'withRhum' => 'yes',
                    ) ),
                    new madBase( array( 
                        'origin' => 'spain',
                        'withRhum' => 'no',
                    ) ),
                ),
                new madBase( array( 
                    'origin' => 'spain',
                ) ),
                array(
                    2,
                    3,
                ),
            ),
            array(
                array(
                    new madBase( array( 
                        'origin' => 'france',
                        'withRhum' => 'no',
                    ) ),
                    new madBase( array( 
                        'origin' => 'france',
                        'withRhum' => 'yes',
                    ) ),
                    new madBase( array( 
                        'origin' => 'spain',
                        'withRhum' => 'yes',
                    ) ),
                    new madBase( array( 
                        'origin' => 'spain',
                        'withRhum' => 'no',
                    ) ),
                ),
                new madBase( array( 
                    'withRhum' => 'no',
                ) ),
                array(
                    0,
                    3,
                ),
            ),
            array(
                array(
                    new madBase( array( 
                        'origin' => 'france',
                        'withRhum' => 'no',
                    ) ),
                    new madBase( array( 
                        'origin' => 'france',
                        'withRhum' => 'yes',
                    ) ),
                    new madBase( array( 
                        'origin' => 'spain',
                        'withRhum' => 'yes',
                    ) ),
                    new madBase( array( 
                        'origin' => 'spain',
                        'withRhum' => 'no',
                    ) ),
                ),
                new madBase( array( 
                    'origin' => 'spain',
                    'withRhum' => 'no',
                ) ),
                array(
                    3,
                ),
            ),
        );
    }

    /**
     * @dataProvider loadProvider
     */
    public function testLoad( $fixtures, $test, $expected ) {
        foreach( $fixtures as $fixture ) {
            $this->model->save( $fixture );
        }

        $result = $this->model->load( $test );

        foreach( $expected as $key ) {
            $expectedObj = $fixtures[$key];
            $this->assertTrue( in_array( $expectedObj, $result ) );
        }
    }

    static public function getAttributeValuesProvider(  ) {
        return array( 
            array(
                'origin',
                array(
                    new madBase( array(
                        'origin' => 'france',
                    ) ),
                    new madBase( array(
                        'origin' => 'france',
                    ) ),
                    new madBase( array(
                        'origin' => 'spain',
                    ) ),
                ),
                array( 
                    'france',
                    'spain',
                )
            ),
        );
    }

    /**
     * @dataProvider getAttributeValuesProvider
     */
    public function testGetAttributeValues( $scenario, $fixtures, $expected ) {
        foreach( $fixtures as $fixture ) {
            $this->model->save( $fixture );
        }

        $result = $this->model->getAttributeValues( $scenario );
        $this->assertEquals( $expected, $result );
    }

    /**
     * Implicit foreign key relation is when an attribute value is non unique.
     *
     * It is already tested but this test is a concrete example.
     * 
     * @return void
     */
    public function testImplicitFK(  ) {
        // create a recipe with multiple values in a key
        $recipe = new madBase();
        $recipe['title'] = 'This recipe promotes multiple products';
        $recipe['productIds'] = new madBase( array(
            12,
            12
        ) );
        $recipe['productIds'][] = 14;
        $this->model->save( $recipe );

        // lets fetch this recipe and ensure that it was saved properly
        $freshRecipe = new madBase( array( 'id' => $recipe['id'] ) );
        $this->model->refresh( $freshRecipe );

        // now to assert
        $this->assertEquals( $recipe['id'], $freshRecipe['id'] );
        $this->assertEquals( $recipe['title'], $freshRecipe['title'] );
        $this->assertEquals( $recipe['productIds'], $freshRecipe['productIds'] );
    }

    /**
     * Implicit many to many relation is when an attribute can have multiple 
     * values which are non unique.
     * 
     * This is not yet even designed so this test *must* fail.
     *
     * @return void
     */
    public function testImplicitM2M(  ) {
        // create a recipe
        $recipe = new madBase();
        $recipe['title'] = 'Ti\'Punch';

        // add some related objects
        $recipe['ingredientQuantities'] = new madBase();
        $recipe['ingredientQuantities'][] = new madBase( array( 
            'name' => 'lime',
            'quantity' => '1 slice',
        ) );
        $recipe['ingredientQuantities'][] = new madBase( array( 
            'name' => 'rhum',
            'quantity' => '8 cl',
        ) );
        $recipe['ingredientQuantities'][] = new madBase( array( 
            'name' => 'sugar',
            'quantity' => '1 cl',
        ) );

        // save ( should be recursive by default )
        $this->model->save( $recipe );
 
        // lets fetch this recipe and ensure that it was saved properly
        $freshRecipe = new madBase( array( 'id' => $recipe['id'] ) );
        $this->model->refresh( $freshRecipe );

        // now to assert
        $this->assertEquals( $recipe['id'], $freshRecipe['id'] );
        $this->assertEquals( $recipe['title'], $freshRecipe['title'] );
        $this->assertEquals( $recipe['ingredientQuantities'], $freshRecipe['ingredientQuantities'] );
    }
}
