<?php
require dirname( __FILE__ ) . '/../mad/framework.php';

$framework = new madFramework( dirname( __FILE__ ) );
$framework->run(  );
$framework->locale['fr']; // fetch fr locale