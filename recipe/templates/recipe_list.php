<style>
/*Init 100%*/
#center_column { width: 980px; padding: 0; }
#center_column a { text-decoration: none;}
#left_column, .breadcrumb { display: none; }

#nav-recipe { color: #b0aaac; border-bottom: 1px solid #e1e1e1; width: 980px; height: 30px; list-style: none; margin-bottom: 10px; }
#nav-recipe li { display: block; float: left; line-height: 30px; height: 30px; }
#nav-recipe li.browseby { font-size: 10px; font-family: Verdana; padding-right: 8px; }
#nav-recipe li a { font: bold 15px Times, Arial; color: #b0aaac; text-transform: uppercase; }
#nav-recipe li a.selected { color: #000; }
#nav-recipe li.sep { font-size: 9px; padding: 0px 8px; }

#center_column .recipe-block { font-size: 11px; width: 238px; float: left; padding: 0 12px 12px 0; }
#center_column .recipe-block .infos a { text-decoration: underline; }
#center_column .recipe-details a { color: #b0aaac; }
#center_column .recipe-details a:hover { text-decoration: underline; color: #000; }
#center_column .recipe-details a.editprofil { float: left; color: #DE5161; font-size: 10px; font-weight: normal; display: block; _height: 20px; line-height: 20px; }
#center_column .recipe-details a.editrecipe { float: right; color: #DE5161; font-size: 10px; font-weight: normal; display: block; _height: 20px; line-height: 20px; }
#center_column .recipe-details a.editrecipe:hover, #center_column .recipe-details a.editprofil:hover { text-decoration: underline; }
#center_column .recipe-block p.link { padding: 5px 0; color: #b0aaac; font-size: 10px; font-family: Verdana;}
#center_column .recipe-block div.adminpanel { margin: 5px 0; padding-top: 5px; border-top: 1px solid #dadada;}
#center_column .recipe-details { border: 1px solid #d3d3d3; padding: 5px; overflow: auto; }
#center_column .recipe-details img.picture { width: 226px; height: 226px; vertical-align: bottom; }
#center_column .recipe-details .infos {line-height: 19px; font-weight: bold; font-family: Verdana; padding: 10px 0; }
#center_column .recipe-details .author { color: #656565; font-size: 10px; font-family: Verdana; font-weight: bold; }
</style>

<!--
<ul id="nav-recipe">
	<li class="browseby">Trier par:</li>
	<li><a href="" class="selected">date</a></li>
	<li class="sep">|</li>
	<li><a href="">cat&eacute;gorie</a></li>
	<li class="sep">|</li>
	<li><a href="">popularit&eacute;</a></li>
	<li class="sep">|</li>
	<li><a href="">au hasard</a></li>
</ul>
-->

<?php $forloopCounter = 1; foreach( $this->objectList as $object ): ?>
<div class="recipe-block" <?php if( $forloopCounter % 4 == 0 ): ?> style="padding-right: 0;"<?php endif; ?>>
	<!--<p class="link">remipathier.cookingfor.com</p>-->
	<div class="recipe-details">
		<?php if ( isset( $object['picture'] ) ): ?>
		    <a href="<?php echo $this->url( 'recipe.details', $object ) ?>">
			    <img class="picture" src="<?php echo $this->thumbnail( $object['picture'], 226, 226 ) ?>" />
		</a>
		<?php endif ?>
	
			<p class="infos">
				<a href="<?php echo $this->url( 'recipe.details', $object ) ?>">
					<?php echo $object['title']; ?>
				</a>
			</p>
	
		<?php if ( isset( $object['profile'] ) ): ?>
		<p class="author">
			<a href="<?php echo $this->url( 'profile.details', $object['profile'] ) ?>">
				<?php echo $object['profile']['name'] ?> &bull;
			</a>
		</p>
		<?php endif ?>
        <?php if ( isset( $this->user ) && isset( $this->user['role'] ) && $this->user['role'] == 'administrator' ): ?>
		<div class="adminpanel">
			<?php if ( isset( $object['profile'] ) ): ?>
			<a class="editprofil" href="<?php echo $this->url( 'profile.edit', $object['profile'] ) ?>">Modifier le profil</a>
			<?php endif ?>
			<a class="editrecipe" href="<?php echo $this->url( 'recipe.edit', $object ) ?>">Modifier la recette</a>
		</div>
        <?php endif ?>
		<div class="clear"></div>
	</div>
</div>
<?php $forloopCounter++; endforeach; ?>

</ul>

<?php
    include 'mad/templates/paginate.php';
?>

<!--
<a href="<?php echo $this->url( 'recipe.create' ); ?>">create</a>
-->


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
<!--
<div id="tabAdminFixed">
    <ul id="adminMenu">
	<li class="tabMenu">Recettes
		<ul class="adminSubMenu">
			<li><a href="#">Ajouter une recette</a></li>
			<li><a href="#">Modifier une recette</a></li>
			<li><a href="#">Supprimer une recette</a></li>
			<li class="last"><a href="#">Voir toutes les recettes</a></li>
		</ul>
	</li>
	<li class="tabMenu">Profils & Chefs
		<ul class="adminSubMenu">
			<li><a href="#">Ajouter un profil</a></li>
			<li><a href="#">Modifier un profil</a></li>
			<li><a href="#">Supprimer un profil</a></li>
			<li class="last"><a href="#">G&eacute;rer les chefs</a></li>
		</ul>
	</li>
    </ul>
</div>
-->
