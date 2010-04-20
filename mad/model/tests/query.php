<?php

class madBaseQueryTest extends PHPUnit_Framework_TestCase {
    public static function suite(  ) {
        return new PHPUnit_Framework_TestSuite( __CLASS__ );
    }

    public $query = null;
    public function setUp(  ) {
        $registry = madRegistry::instance();
        $registry->router = $this->getMock( 'madCoreRouter', array(  ), array( new ezcMvcrequest(  ), array(  ) ));
        $registry->router->expects( $this->any(  ) )
                         ->method( 'generateUrl' )
                         ->will( $this->returnValue( '/bar' ) );

        $this->db = $registry->database;
        $registry->model = new madModelMock( $this->db );

        $this->model = $registry->model;
        $this->db->query( 'truncate mad_model' );
        $this->query = new madBaseQuery( $this->db );
        $this->query->comma = ', ';
    }

    public function testSelect(  ) {
        $query = clone $this->query;

        $query = $query->select( 'foo' );
        $this->assertEquals( 
            'SELECT `foo`',
            $query->getSql(  )
        );
    }
    
    public function testSelectAlias(  ) {
        $query = clone $this->query;

        $query = $query->select( 'bar', 'barAlias' );
        $this->assertEquals( 
            'SELECT `bar` AS `barAlias`',
            $query->getSql(  )
        );
    }

    public function testSelectMixed(  ) {
        $query = clone $this->query;

        $query = $query->select( 'foo' )->select( 'bar', 'barAlias' );
        $this->assertEquals( 
            'SELECT `foo`, `bar` AS `barAlias`',
            $query->getSql(  )
        );
    }

    public function testFrom(  ) {
        $query = clone $this->query;
        
        $query = $query->select( 'foo' )->from( 'bar' );

        $this->assertEquals( 
            'SELECT `foo` FROM `bar`',
            $query->getSql(  )
        );
    }

    public function testFromAlias(  ) {
        $query = clone $this->query;
        $query = $query->select( 'foo' );

        $query = $query->from( 'bar', 'barAlias' );
        $this->assertEquals( 
            'SELECT `foo` FROM `bar` AS `barAlias`',
            $query->getSql(  )
        );
    }

    public function testFromSubselect(  ) {
        $query = clone $this->query;
        $query = $query->select( 'foo_T.foo', 'foo' )
                       ->from( $query->factory(  )
                                     ->select( 'foo' )
                                     ->from( 'fooTable' ),
                            'foo_T'
                        );

        $this->assertEquals( 
            'SELECT `foo_T`.`foo` AS `foo` FROM ( SELECT `foo` FROM `fooTable` ) AS `foo_T`',
            $query->getSql(  )
        );
    }

    public function testFromMixed(  ) {
        $query = clone $this->query;
        $query = $query->select( 'foo_T.foo', 'foo' )
                       ->from( $query->factory(  )
                                     ->select( 'foo' )
                                     ->from( 'fooTable' ),
                            'foo_T'
                        )
                       ->from( 'barTable' )
                       ->from( 'testTable', 'testAlias' );

        $this->assertEquals( 
            "SELECT `foo_T`.`foo` AS `foo` FROM ( SELECT `foo` FROM `fooTable` ) AS `foo_T`, `barTable`, `testTable` AS `testAlias`",
            $query->getSql(  )
        );
    }

    public function testOrder(  ) {
        $query = clone $this->query;
        $query = $query->select( '*' )->from( 'bar' )->order( 'id' );
        $this->assertEquals( 
            "SELECT * FROM `bar` ORDER BY `id` ASC",
            $query->getSql(  )
        );
    }

    public function testOrderDesc(  ) {
        $query = clone $this->query;

        $query = $query->select( '*' )->from( 'bar' )->order( 'id', 'desc' );
        $this->assertEquals( 
            "SELECT * FROM `bar` ORDER BY `id` DESC",
            $query->getSql(  )
        );
    }

    public function testLimit(  ) {
        $query = clone $this->query;
        $query = $query->select( '*' )->from( 'bar' )->limit( 0, 100 );
        $this->assertEquals( 
            "SELECT * FROM `bar` LIMIT 0, 100",
            $query->getSql(  )
        );
    }

    //public function testShowTables(  ) {
        //$model = new madModel( $this->query->pdo );
        //$model->createTable(  );

        //$query = $this->query->showTables(  );
        //$query->execute(  );
        //var_dump( $query->rows, $query->executed );
    //}
}

class madQueryTest extends PHPUnit_Framework_TestCase {
    static public function suite(  ) {
        return new PHPUnit_Framework_TestSuite( __CLASS__ );
    }

    public $query = null;
    
    public function __construct(  ) {

    }

    public function setUp(  ) {
        $registry = madRegistry::instance();
        $registry->router = $this->getMock( 'madCoreRouter', array(  ), array( new ezcMvcrequest(  ), array(  ) ));
        $registry->router->expects( $this->any(  ) )
                         ->method( 'generateUrl' )
                         ->will( $this->returnValue( '/bar' ) );

        $this->db = $registry->database;
        $registry->model = new madModelMock( $this->db );
        $this->model = $registry->model;


        $query = new madBaseQuery( $this->db );
        $query = $query->showTables(  );
        foreach(  )
        $this->db->query( 'truncate mad_model' );
    }

    public function testCreateIndex(  ) {
        #$query = $this->query->createIndexTables(  );
    }
}

?>
