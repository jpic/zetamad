<?php
require_once 'PHPUnit/Extensions/Database/DataSet/DataSetFilter.php';
require_once 'PHPUnit/Extensions/Database/DB/DataSet.php';

class madModelTable extends PHPUnit_Extensions_Database_DB_Table {
    /**
     * Creates a new database table object.
     *
     * @param PHPUnit_Extensions_Database_DataSet_ITableMetaData $tableMetaData
     * @param PHPUnit_Extensions_Database_DB_IDatabaseConnection $databaseConnection
     */
    public function __construct(PHPUnit_Extensions_Database_DataSet_ITableMetaData $tableMetaData, PHPUnit_Extensions_Database_DB_IDatabaseConnection $databaseConnection)
    {
        $this->setTableMetaData($tableMetaData);

        $pdoStatement = $databaseConnection->getConnection()->prepare(sprintf( '
            select
                %s as id,
                attribute_key,
                attribute_value
            from
                mad_model
        ', madModel::DECODE_ID_ENTITY));
        $pdoStatement->execute();
        $this->data = $pdoStatement->fetchAll(PDO::FETCH_ASSOC);
    }
}

class madModelDataSet extends PHPUnit_Extensions_Database_DB_DataSet {
    /**
     * Returns a table object for the given table.
     *
     * @param string $tableName
     * @return PHPUnit_Extensions_Database_DB_Table
     */
    public function getTable($tableName)
    {
        if (!in_array($tableName, $this->getTableNames())) {
            throw new InvalidArgumentException("$tableName is not a table in the current database.");
        }

        if (empty($this->tables[$tableName])) {
            if ( $tableName == 'mad_model' ) {
                $this->tables[$tableName] = new madModelTable($this->getTableMetaData($tableName), $this->databaseConnection);
            } else {
                $this->tables[$tableName] = new PHPUnit_Extensions_Database_DB_Table($this->getTableMetaData($tableName), $this->databaseConnection);
            }
        }

        return $this->tables[$tableName];
    }
}

class madModelControllerMock extends madModelController {
    public $options;

    protected function getFormOptions( $form ) {
        return $this->options;
    }
}

class madModelMock extends madModel {
    public $ids = array(
        '0FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '1FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '2FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '3FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '4FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '5FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '6FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '7FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '8FDB6574-3E40-11DF-8BB4-1B969F5BE980',
        '9FDB6574-3E40-11DF-8BB4-1B969F5BE980',
    );

    /**
     * Return ids in a predictable order
     * 
     * @return void
     */
    public function getNextEntityId(  ) {
        return next( $this->ids );
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
        $registry->model = new madModelMock( $this->db );
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
            $arguments[] = $test . DIRECTORY_SEPARATOR . 'setup.php';
            
            $scenarios[] = $arguments;
        }

        return $scenarios;
    }

    protected function filterDataset( $dataset ) {
        $dataset = new PHPUnit_Extensions_Database_DataSet_DataSetFilter( $dataset );
        $dataset->setExcludeColumnsForTable( 'mad_model', array( 'id_attribute' ) );
        return $dataset;
    }

    /**
     * @dataProvider formProvider
     */
    public function testForm( $scenario, $options, $request, $expectedForm, $expectedDatasetFile, $setup ) {

        // reset predictable uuid pointer
        reset( madRegistry::instance()->model->ids );

        include $setup;

        // get result
        $controller = new madModelControllerMock( 'form', $request );
        $controller->options = $options;
        $result = $controller->createResult(  );
        $actualForm = $result->variables['form'];

        // test result relevance
        $expectedForm->ksort(  );
        $actualForm->ksort(  );
        $this->assertEquals( $expectedForm, $actualForm );

        // test database relevane
        $expectedDataset = $this->createFlatXMLDataSet($expectedDatasetFile);
        $expectedDataset = $this->filterDataset( $expectedDataset );

        $actualDataset   = new madModelDataSet( $this->getConnection() );
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
                    'filter' => array( 
                        'origin' => 'spain',
                    ),
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
                    'distinct' => 'origin',
                ),
                new madBase( array( 
                ) ),
                array(
                    0,
                    1,
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

        $this->assertEquals( count( $expected ), count( $result->variables['objectList'] ) );

        foreach( $expected as $key ) {
            $expectedObj = $fixtures[$key];
            $this->assertTrue( in_array( $expectedObj, $result->variables['objectList'] ) );
        }
    }
}
