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
        $model = madRegistry::instance(  )->model;

        $this->relations[$namespace] = $model->queryLoad(
            "select distinct(id) from mad_model where namespace = :ns and attribute_value = :id",
            array(
                'id' => $this['id'],
                'ns' => $namespace,
            )
        );

        return $this->relations[$namespace];
    }
}
?>
