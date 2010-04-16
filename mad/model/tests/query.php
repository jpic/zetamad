<?php

class madQueryTest extends PHPUnit_Framework_TestCase {
    public static function suite(  ) {
        return new PHPUnit_Framework_TestSuite( __CLASS__ );
    }

    public function testSelect(  ) {
        $query = new madQuery(  );
        $query->comma = ', ';

        $query = $query->select( 'foo' );
        $this->assertEquals( 
            'SELECT `foo`',
            $query->getSql(  )
        );
    }
    
    public function testSelectAlias(  ) {
        $query = new madQuery(  );
        $query->comma = ', ';
        
        $query = $query->select( 'bar', 'barAlias' );
        $this->assertEquals( 
            'SELECT `bar` AS `barAlias`',
            $query->getSql(  )
        );
    }

    public function testSelectMixed(  ) {
        $query = new madQuery(  );
        $query->comma = ', ';
        
        $query = $query->select( 'foo' )->select( 'bar', 'barAlias' );
        $this->assertEquals( 
            'SELECT `foo`, `bar` AS `barAlias`',
            $query->getSql(  )
        );
    }

    public function testFrom(  ) {
        $query = new madQuery(  );
        $query->comma = ', ';
        
        $query = $query->select( 'foo' )->from( 'bar' );

        $this->assertEquals( 
            'SELECT `foo` FROM `bar`',
            $query->getSql(  )
        );
    }

    public function testFromAlias(  ) {
        $query = new madQuery(  );
        $query->comma = ', ';
        $query = $query->select( 'foo' );

        $query = $query->from( 'bar', 'barAlias' );
        $this->assertEquals( 
            'SELECT `foo` FROM `bar` AS `barAlias`',
            $query->getSql(  )
        );
    }

    public function testFromSubselect(  ) {
        $query = new madQuery(  );
        $query->comma = ', ';
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
        $query = new madQuery(  );
        $query->comma = ', ';
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
        $query = new madQuery(  );
        $query->comma = ', ';
        $query = $query->select( '*' )->from( 'bar' )->order( 'id' );
        $this->assertEquals( 
            "SELECT * FROM `bar` ORDER BY `id` ASC",
            $query->getSql(  )
        );
    }

    public function testOrderDesc(  ) {
        $query = new madQuery(  );
        $query->comma = ', ';
        $query = $query->select( '*' )->from( 'bar' )->order( 'id', 'desc' );
        $this->assertEquals( 
            "SELECT * FROM `bar` ORDER BY `id` DESC",
            $query->getSql(  )
        );
    }

    public function testLimit(  ) {
        $query = new madQuery(  );
        $query->comma = ', ';
        $query = $query->select( '*' )->from( 'bar' )->limit( 0, 100 );
        $this->assertEquals( 
            "SELECT * FROM `bar` LIMIT 0, 100",
            $query->getSql(  )
        );
    }
}

?>
