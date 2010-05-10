<?php
$start = microtime(true);

include '../entry_bootstrap.php';

include 'add_namespace_column_migration.php';

$registry = madRegistry::instance();
$registry->dispatcher->run(  );

$end = microtime(true);
$total = $end - $start;
shell_exec( "echo $start - $end = $total > /tmp/bench" );
?>
