<?php 
if ( !isset( $_GET['popup'] ) ):
    $smarty = $GLOBALS['smarty'];
    require PRESTASHOP_PATH . '/header.php';
else:
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="fr-fr" xml:lang="fr-fr" >
<head>
    <title><?php if ( isset( $this->form ) && isset($this->form->label) ) $this->e( ucfirst( $this->form->label ) ) ?></title> 
    <script type="text/javascript" src="<?php echo __PS_BASE_URI__ ?>js/jquery/jquery.pack.js"></script>

</head>
<body>
<?php endif ?>

<?php echo $this->body; ?>

<?php
if ( !isset( $_GET['popup'] ) ):
    require PRESTASHOP_PATH . '/footer.php';
else:
?>
</body>
</html>
<?php endif ?>
