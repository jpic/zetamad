<?php

class madQuery {
    public $type = '';
    public $select = array(  );
    public $from = array(  );
    public $order = array(  );
    public $offset = null;
    public $count = null;
    public $sql = '';
    public $comma = "\n\t, ";

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
        if( preg_match( '/^[a-zA-Z_]+$/', $argument ) ) {
            // quote standard sql reference
            return "`$argument`"; 
        } elseif( preg_match( '/^([a-zA-Z_]+).([a-zA-Z_]+)$/', $argument, $matches, PREG_OFFSET_CAPTURE ) ) {
            // quote standard sql reference
            return "`{$matches[1][0]}`.`{$matches[2][0]}`"; 
        } elseif( $argument instanceof madQuery && $argument->type == 'SELECT') {
            // subquery
            return "( " . $argument->getSql(  ) . " )";
        } else {
            return $argument;
        }
    }

    public function factory(  ) {
        $query = new madQuery(  );
        $query->comma = $this->comma;
        return $query;
    }

    public function getSql(  ) {
        if ( $this->sql ) {
            return $sql;
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
        $this->sql = false;
    }
}

?>
