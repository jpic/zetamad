<?php 
if ( !isset( $_GET['popup'] ) ) {
require PRESTASHOP_PATH . '/config/config.inc.php';
$GLOBALS['smarty'] = $smarty;
require PRESTASHOP_PATH . '/header.php';

}
?>
<?php echo $this->body; ?>
<?php
if ( !isset( $_GET['popup'] ) )
require PRESTASHOP_PATH . '/footer.php';
?>
