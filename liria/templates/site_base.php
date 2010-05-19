<?php 
if ( !isset( $_GET['popup'] ) ):
    $smarty = $GLOBALS['smarty'];
    
    $smarty->assign( 'meta_title', ucfirst( $this->t( 'title' ) ) . ' - Madeleine Market' );
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
<?php $_SESSION['messages'] = array( 'premier message', 'second message' ) ?>

<?php if ( $_SESSION['messages'] ): ?>
    <ul id="flash">
    <?php foreach( $_SESSION['messages'] as $message ): ?>
        <li><p><?php $this->e( $message ) ?></p><a href="">effacer</a></li>
    <?php endforeach ?>
    </ul>

    <?php $_SESSION['messages'] = array(  ) /* reset messages array */ ?>
<?php endif ?>

<?php echo $this->body; ?>


<?php if ( isset( $this->user ) && isset( $this->user['role'] ) && $this->user['role'] == 'administrator' ): ?>
<style>
#tabAdminFixed { position: fixed; bottom: 0; right: 0; height: 25px; z-index: 99; direction: ltr; }
#tabAdminFixed #adminMenu { position: relative; margin-right: 20px; float: left; border: 1px solid #999999; border-bottom: 0; }
#tabAdminFixed #adminMenu li.tabMenu {
	position: relative;
	width: 160px;
	background: -moz-linear-gradient(#e0dcd0, #c2b9a9);
	background-color: #e0dcd0;
	cursor: pointer;
	font-family:'lucida grande',tahoma,verdana,arial,sans-serif;
	font-size: 11px;
	display: block;
	float: left;
	height: 16px;
	padding: 4px 10px;
	color: #333333;
	font-weight: bold;
}
#tabAdminFixed #adminMenu li.tabMenu:hover { background: -moz-linear-gradient(#f0ede6, #e0dcd0); background-color: #e0dcd0; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu { position: absolute; z-index: 999; bottom: 24px; left: -1px; background: #f0ede6; border: 1px solid #999999; border-bottom: 0; visibility: hidden; width: 170px;}
#tabAdminFixed #adminMenu li.tabMenu:hover > ul.adminSubMenu { visibility: visible; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu li { margin: 0 5px; cursor: default; list-style-type: none; height: 12px; padding: 4px 10px; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu li.last { padding-bottom: 10px; border-bottom: 1px solid #999999; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu li a { color: #333333; font-weight: bold; display: inline; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu li a:hover { color: #000; text-decoration: underline; }
</style>


<!--[if lte IE 6]>
<style type="text/css">
body { background-position: fixed; }
#tabAdminFixed { position: absolute; top: expression( ignore = - this.offsetHeight + document.documentElement.clientHeight + document.documentElement.scrollTop + "px" ); }
</style>

<script type="text/javascript">
$(document).ready(function(){
	
 $("ul#adminMenu li").hover(function(){
   $(this).addClass("hover");
   $('> .dir',this).addClass("open");
   $('ul:first',this).css('visibility', 'visible');
 },function(){
   $(this).removeClass("hover");
   $('.open',this).removeClass("open");
   $('ul:first',this).css('visibility', 'hidden');
 });

});
</script>
<![endif]-->

<div id="tabAdminFixed">
    <ul id="adminMenu">
    <?php
    foreach( madRegistry::instance()->configuration['admin'] as $sectionName => $section ):
    ?>
	<li class="tabMenu">
        <?php $this->e( ucfirst( $sectionName ) ) ?>
		<ul class="adminSubMenu">
            <?php 
            $forloop = 0;
            foreach( $section['links'] as $linkName => $link ):
                $routeName = isset( $link['route'] ) ? $link['route'] : $linkName;
                $arguments = isset( $link['arguments'] ) ? $link['arguments'] : array(  );
            ?>
			<!--<li <?php if ( count( $forloop ) == $forloop+1 ): ?>class="last"<?php endif ?>>-->
            <li>
                <a href="<?php echo $this->url( $routeName, $arguments ) ?>">
                    <?php $this->e( ucfirst( $link['label'] ) ) ?>
                </a>
            </li>
            <?php
                $forloop++;
            endforeach;
            ?>
		</ul>
	</li>
    <?php
    endforeach
    ?>
    </ul>
</div>

<?php endif ?>


<?php
if ( !isset( $_GET['popup'] ) ):
    require PRESTASHOP_PATH . '/footer.php';
else:
?>
</body>
</html>
<?php endif ?>
