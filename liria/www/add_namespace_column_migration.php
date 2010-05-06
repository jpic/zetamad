<?php
include '../bootstrap.php';
$registry = madRegistry::instance(  );


foreach( $registry->query( 'describe mad_model' )->fetchAll(  ) as $row ) {
    if ( $row['Field'] == 'namespace' ) {
        die( 'Upgrade already applied' );
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
