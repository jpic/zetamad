<?php

class madModelObject extends madObject {
    public $relations = array(  );
    
    public function __get( $key ) {
        try {
            return parent::__get( $key );
        } catch ( madObjectPropertyNotFoundException $e ) {
            # pass
        }

        if ( substr( $key, -3 ) == 'Set' ) {
            return $this->getRelatedObjects( substr( $key, 0, -3 ) );
        }

        throw new madObjectPropertyNotFoundException( $key );
    }

    public function getRelatedObjects( $namespace ) {
        $this->relations[$namespace] = madRegistry::instance(  )->model->queryLoad(
            "select id from %({$namespace}_index)s where {$this['namespace']} = :id",
            array(
                'id' => $this['id'],
            )
        );

        return $this->relations[$namespace];
    }
}
?>
