<?php
require_once 'PHPUnit/Extensions/Database/TestCase.php';

class madCiTestCase extends PHPUnit_Extensions_Database_TestCase {
    protected function getConnection()
    {
        $registry = madRegistry::instance();
        $this->db = $registry->database;
        return $this->createDefaultDBConnection($this->db, '');
    }
 
    protected function getDataSet()
    {
        //return $this->createFlatXMLDataSet(dirname(__FILE__).'//bank-account-seed.xml');
    }

    static public function formProvider ( ) {

    }

    /**
     * @dataProvider formProvider
     */
    public function testForm( $scenario, $request, $options, $expectedForm, $expectedDatasetFile ) {
        $controller = $this->getMock( 'madModelController', array( 'form', $request ) );
        
        // stub getFormOptions
        $controller->expects( $this->any( ) )
                   ->method( 'getFormOptions' )
                   ->will( $this->returnValue( $options ) );

        $result = $controller->createResult(  );

        // test result relevance
        $this->assertEquals( $expectedForm, $result['form'] );

        // test database relevane
        $expectedDataset = $this->createFlatXMLDataSet($expectedDatasetFile);
        $this->assertDataSetsEqual($expectedDataset, $this->getConnection()->createDataSet());
    }
}

?>
