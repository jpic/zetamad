<?php

if ( !defined( 'ENTRY_APP_PATH' ) ) {
    include '../bootstrap.php';
}

$registry = madRegistry::instance(  );


foreach( $registry->model->queryLoad( 'select distinct(id) as id from mad_model' ) as $object ) {
    foreach( $object as $key => $value ) {
        if ( $value instanceof madObject && $value->isEntity ) {
            $object[$key] = $value['id'];
        } elseif( is_string( $object[$key] ) ) {
            $object[$key] = str_replace( '<br />', "\n", $object[$key] );
        }
    }

    $registry->model->save( $object );
}

?>
