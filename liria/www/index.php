<?php
include '../bootstrap.php';

include 'add_namespace_column_migration.php';

$registry = madRegistry::instance();
$registry->dispatcher->run(  );
?>
