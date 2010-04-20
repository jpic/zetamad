<?php

class madBaseQuery implements Iterator {
    public $type = '';
    public $select = array(  );
    public $from = array(  );
    public $order = array(  );
    public $offset = null;
    public $count = null;
    public $sql = '';
    public $comma = "\n\t, ";
    public $pdo = null;
    public $rows = array(  );
    public $argument = array(  );
    public $executed = false;
    public $fetchMode = PDO::FETCH_ASSOC;

    public function __construct( PDO $pdo ) {
        $this->pdo = $pdo;
    }

    public function select( $column, $alias = null ) {
        $query = clone $this;
        $query->type = 'SELECT';

        if ( is_null( $alias ) ) {
            $alias = $column;
        }
        
        $query->select[$alias] = $column;
        return $query;
    }

    public function from( $table, $alias = null ) {
        $query = clone $this;
        
        if ( is_null( $alias ) ) {
            $alias = $table;
        }
        
        $query->from[$alias] = $table;
        return $query;
    }

    public function order( $column, $type = 'asc' ) {
        $query                 = clone $this;
        $query->order[$column] = $type;
        return $query;
    }
    
    public function limit( $offset, $count ) {
        $query         = clone $this;
        $query->offset = $offset;
        $query->count  = $count;
        return $query;
    }

    public function escapeReference( $argument ) {
        if( $argument instanceof madQuery && $argument->type == 'SELECT') {
            // subquery
            return "( " . $argument->getSql(  ) . " )";
        } elseif( preg_match( '/^[a-zA-Z_]+$/', $argument ) ) {
            // quote standard sql reference
            return "`$argument`"; 
        } elseif( preg_match( '/^([a-zA-Z_]+).([a-zA-Z_]+)$/', $argument, $matches, PREG_OFFSET_CAPTURE ) ) {
            // quote standard sql reference
            return "`{$matches[1][0]}`.`{$matches[2][0]}`"; 
        } else {
            return $argument;
        }
    }

    public function showTables(  ) {
        $query = clone $this;
        switch( $query->pdo->getAttribute( PDO::ATTR_DRIVER_NAME ) ) {
            case 'sqlite':
                $query->sql = 'SELECT name FROM sqlite_master WHERE type="table"';
                break;
            case 'mysql':
                $query->sql = 'SHOW TABLES';
                $query->fetchMode = PDO::FETCH_NUM;
                break;
            default:
                trigger_error( "What pdo driver are you using?" );
        }
        return $query;
    }

    public function factory(  ) {
        $query = new madQuery( $this->pdo );
        $query->comma = $this->comma;
        return $query;
    }

    public function getSql(  ) {
        if ( $this->sql ) {
            return $this->sql;
        }

        $result = array( $this->type );
        switch( $this->type ) {
            case 'SELECT':
                $select = array(  );
                
                foreach( $this->select as $alias => $column ) {
                    if ( $alias == $column ) {
                        $select[] = $this->escapeReference( $column );
                    } else {
                        $select[] = $this->escapeReference( $column )
                            . ' AS '
                            . $this->escapeReference( $alias );
                    }
                }
                $result[] = implode( $this->comma, $select );
                
                break;
        }

        if ( $this->from ) {
            $from = array(  );

            foreach( $this->from as $alias => $table ) {
                if ( $alias == $table ) {
                    $from[] = $this->escapeReference( $table );
                } else {
                    $from[] = $this->escapeReference( $table ) 
                        . ' AS ' 
                        . $this->escapeReference( $alias );
                }
            }
            
            $result[] = 'FROM';
            $result[] = implode( $this->comma, $from );
        }

        if ( $this->order ) {
            $order = array(  );

            foreach( $this->order as $column => $type ) {
                $order[] = $this->escapeReference( $column ) 
                    . ' ' 
                    . strtoupper( $type );
            }
            
            $result[] = 'ORDER BY';
            $result[] = implode( $this->comma, $order );
        }

        if ( !is_null( $this->offset ) && !is_null( $this->count ) ) {
            $result[] = 'LIMIT';
            $result[] = $this->offset
                . ', '
                . $this->count;
        }

        $this->sql = implode( ' ', $result );
        return $this->sql;
    }

    public function __clone(  ) {
        $this->sql      = false;
        $this->executed = false;
        $this->rows     = array(  );
    }

    public function execute(  ) {
        $statement = $this->pdo->prepare( $this->getSql(  ) );
        
        if ( !$statement ) {
            trigger_error( "query failed " . $this->getSql(  ) );
            return false;
        }

        $statement->setFetchMode( $this->fetchMode );
        $statement->execute();

        $this->rows = $statement->fetchAll(  );
        $this->executed = true;
    }

    public function rewind() {
        if ( !$this->executed ) {
            $this->execute(  );
        }

        return reset($this->rows);
    }

    public function current() {
        return current($this->rows);
    }

    public function key() {
        return key($this->rows);
    }

    public function next() {
        return next($this->rows);
    }

    public function valid() {
        return key($this->rows) !== null;
    }
}

class madQuery extends madBaseQuery {
    public $configuration = null;

    public function __construct( PDO $db, $configuration = null ) {
        parent::__construct( $db );
        $this->configuration = $configuration;   
    }

    public function createIndexTables(  ) {
        // check if index table exists
        foreach( $this->showTables(  ) as $table ) {
            var_dump( $table );
        }
    }
}

?>
