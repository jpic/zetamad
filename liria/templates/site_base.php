<?php 
if ( !isset( $_GET['popup'] ) ):
    $smarty = $GLOBALS['smarty'];
    
    $smarty->assign( 'meta_title', $this->metaTitle . ' - Madeleine Market' );
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
<style>
ul#flash { overflow: auto; width: 99%; padding: 5px; margin: 0 auto; margin-bottom: 10px; margin-top: 10px; list-style: none; background: #ebfce3; border: 1px solid #d2f6c1; -moz-border-radius: 3px; border-radius: 3px; -webkit-border-radius: 3px; }
ul#flash li {clear: both; font-family: Verdana; line-height: 21px; }
ul#flash li p { color: #666;  font-size: 12px; float: left; }
ul#flash li a { float: right; direction: rtl; color: #666; text-decoration: none; font-size: 10px;}
ul#flash li a:hover { float: right; direction: rtl; color: #000; text-decoration: underline;}
</style>

<?php if ( $_SESSION['messages'] ): ?>
    <ul id="flash">
    <?php foreach( $_SESSION['messages'] as $message ): ?>
        <li><p><?php $this->e( $message ) ?></p><?php /*<a href="">effacer</a>*/ ?></li>
    <?php endforeach ?>
    </ul>

    <?php $_SESSION['messages'] = array(  ) /* reset messages array */ ?>
<?php endif ?>

<?php echo $this->body; ?>

<?php if ( !isset( $_GET['popup'] ) && isset( $this->user ) && isset( $this->user['role'] ) && in_array( $this->user['role'], array( 'administrator', 'contributor' ) ) ): ?>
    <?php $this->includeTemplate( 'navigation.php' ) ?>
<?php endif ?>

<?php
if ( !isset( $_GET['popup'] ) ):
    require PRESTASHOP_PATH . '/footer.php';
else:
?>
</body>
</html>
<?php endif ?>
