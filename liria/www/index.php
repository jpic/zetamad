<?php
$start = microtime(true);

include '../entry_bootstrap.php';

$framework->dispatcher->run(  );
$end = microtime(true);
$total = $end - $start;
shell_exec( "echo $start - $end = $total > /tmp/bench" );
?>
