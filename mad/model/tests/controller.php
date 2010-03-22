<?php
/**
 * @package ModelController
 * @subpackage Tests
 */
class madModelControllerTest extends PHPUnit_Framework_TestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madModelControllerTest' );
    }

    public $model = null;

    public function setUp() {
        $registry = madRegistry::instance();
        $this->db = $registry->database;
        $this->model = $registry->model;
        $this->db->query( 'truncate mad_model' );
    }

    static public function listProvider(  ) {
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
                array(
                    'filter__origin' => 'spain',
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
                array(
                    'filter__origin' => 'spain',
                    'filter__withRhum' => 'no',
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
     * @dataProvider listProvider
     */
    public function testList( $fixtures, $test, $expectedFilter, $expected ) {
        foreach( $fixtures as $fixture ) {
            $this->model->save( $fixture );
        }

        $request = new ezcMvcRequest(  );
        $request->variables = $test;
        $crud = new madModelController( 'list', $request );
        $result = $crud->doList(  );

        $this->assertEquals( $expectedFilter, $result->variables['filter'] );

        foreach( $expected as $key ) {
            $expectedObj = $fixtures[$key];
            $this->assertTrue( in_array( $expectedObj, $result->variables['objectList'] ) );
            $this->assertEquals( count( $expected ), count( $result->variables['objectList'] ) );
        }
    }
}
