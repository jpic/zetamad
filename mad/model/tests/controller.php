<?php
require_once 'PHPUnit/Extensions/Database/DataSet/DataSetFilter.php';

class madModelControllerMock extends madModelController {
    public $options;

    protected function getFormOptions( $form ) {
        return $this->options;
    }
}

/**
 * @package ModelController
 * @subpackage Tests
 */
class madModelControllerTest extends PHPUnit_Extensions_Database_TestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( 'madModelControllerTest' );
    }

    public $model = null;

    public function setUp() {
        $registry = madRegistry::instance();
        $registry->router = $this->getMock( 'madCoreRouter', array(  ), array( new ezcMvcrequest(  ), array(  ) ));
        $registry->router->expects( $this->any(  ) )
                         ->method( 'generateUrl' )
                         ->will( $this->returnValue( '/bar' ) );

        $this->db = $registry->database;
        $this->model = $registry->model;

        $this->db->query( 'truncate mad_model' );
    }

    protected function getConnection()
    {
        $registry = madRegistry::instance();
        $this->db = $registry->database;
        return $this->createDefaultDBConnection($this->db, '');
    }
 
    protected function getDataSet()
    {
        return $this->createFlatXMLDataSet(dirname(__FILE__) . DIRECTORY_SEPARATOR . 'controller_dataset.xml');
    }

    static public function formProvider ( ) {
        $scenarios = array();

        $fixtures = join( DIRECTORY_SEPARATOR, array(
            dirname( __FILE__ ),
            'controller_fixtures',
            '*',
        ) );

        foreach( glob( $fixtures ) as $test ) {
            $arguments = array();

            $name = substr( $test, strrpos( $test, DIRECTORY_SEPARATOR ) + 1 );
            list( $options, $request, $form ) = include $test . DIRECTORY_SEPARATOR . 'fixtures.php';

            $arguments[] = $name;
            $arguments[] = $options;
            $arguments[] = $request;
            $arguments[] = $form;
            $arguments[] = $test . DIRECTORY_SEPARATOR . 'expected_dataset.xml';
            $arguments[] = $test . DIRECTORY_SEPARATOR . 'initial_dataset.xml';
            
            $scenarios[] = $arguments;
        }

        return $scenarios;
    }

    protected function filterDataset( $dataset ) {
        $dataset = new PHPUnit_Extensions_Database_DataSet_DataSetFilter( $dataset );
        $dataset->setExcludeColumnsForTable( 'mad_model', array( 'id_attribute', 'id' ) );
        return $dataset;
    }

    /**
     * @dataProvider formProvider
     */
    public function testForm( $scenario, $options, $request, $expectedForm, $expectedDatasetFile, $initialDataset ) {
        // set up initial dataset
        $this->getDatabaseTester()->setDataSet( $this->createFlatXMLDataSet(
            $initialDataset
        ) );

        // get result
        $controller = new madModelControllerMock( 'form', $request );
        $controller->options = $options;
        $result = $controller->createResult(  );
        $actualForm = $result->variables['form'];

        // hard set the expected form id, for "create" tests
        if ( $expectedForm['id'] == 'NOTEST' ) {
            $expectedForm['id'] = $actualForm['id'];
        }
        
        // test result relevance
        $expectedForm->ksort(  );
        $actualForm->ksort(  );
        $this->assertEquals( $expectedForm, $actualForm );

        // test database relevane
        $expectedDataset = $this->createFlatXMLDataSet($expectedDatasetFile);
        $expectedDataset = $this->filterDataset( $expectedDataset );

        $actualDataset   = $this->getConnection()->createDataSet();
        $actualDataset   = $this->filterDataset( $actualDataset );
        
        $this->assertDataSetsEqual($expectedDataset, $actualDataset );
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
