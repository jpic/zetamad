<?php
if ( !defined( 'ENTRY_APP_PATH' ) ) {
    include '../bootstrap.php';
}

$registry = madRegistry::instance(  );

foreach( $registry->model->query( 'describe mad_model' )->fetchAll(  ) as $row ) {
    if ( $row['Field'] == 'namespace' ) {
        return true;
    }
}


$queries = array( 
    'alter table mad_model add namespace varchar( 80 )',
    'alter table mad_model add index ( namespace )',
);

foreach( $queries as $sql ) {
    $registry->model->query( $sql );
}


foreach( $registry->model->queryLoad( 'select distinct(id) as id from mad_model' ) as $object ) {
    foreach( $object as $key => $value ) {
        if ( $value instanceof madObject && $value->isEntity ) {
            $object[$key] = $value['id'];
        }
    }

    $registry->model->save( $object );
}

?>