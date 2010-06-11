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
#center_column .recipe-details a { color: #DE5161; }
#center_column .recipe-details a:hover { color: #DE5161; }
#center_column .recipe-details a.editprofil { float: left; color: #DE5161; font-size: 10px; font-weight: normal; display: block; _height: 20px; line-height: 20px; }
#center_column .recipe-details a.editrecipe { float: right; color: #DE5161; font-size: 10px; font-weight: normal; display: block; _height: 20px; line-height: 20px; }
#center_column .recipe-details a.editrecipe:hover, #center_column .recipe-details a.editprofil:hover { text-decoration: underline;  }
#center_column .recipe-block p.link { padding: 5px 0; color: #b0aaac; font-size: 10px; font-family: Verdana;}
#center_column .recipe-block div.adminpanel { margin: 5px 0; padding-top: 5px; border-top: 1px solid #dadada;}
#center_column .recipe-details { border: 1px solid #d3d3d3; padding: 5px; overflow: hidden; height: 280px; }
#center_column .recipe-details img.picture { width: 226px; height: 226px; vertical-align: bottom; }
#center_column .recipe-details .infos {line-height: 18px; font-weight: bold; font-family: Verdana; padding: 10px 0 0 0; }
#center_column .recipe-details .author { line-height: 18px; color: #b0aaac; font-size: 10px; font-family: Verdana; font-weight: bold; }
#center_column .recipe-details .author a { color: #b0aaac; text-decoration: none; }
#center_column .recipe-details .author a:hover { text-decoration: underline; }
</style>

<ul id="nav-recipe">
<!--
	<li class="browseby">Trier par:</li>
	<li><a href="" class="selected">date</a></li>
	<li class="sep">|</li>
	<li><a href="">cat&eacute;gorie</a></li>
	<li class="sep">|</li>
	<li><a href="">popularit&eacute;</a></li>
-->
	<li class="sep">|</li>
	<li>
            <a href="<?php $this->url( 'recipe.random' ) ?>" title="Recette au hasard">
                au hasard
            </a>
        </li>
</ul>

<div class="breadcrumb">
	<a title="retour à Accueil" href="/">Accueil</a>
	<span class="navigation-pipe"><img alt="" src="/themes/mmarket/img/fleche.jpg"></span>
	Recettes
</div>

<?php $forloopCounter = 1; foreach( $this->objectList as $object ): ?>
<div class="recipe-block" <?php if( $forloopCounter % 4 == 0 ): ?> style="padding-right: 0; margin-left: 1px;"<?php endif; ?> <?php if( $forloopCounter % 3 == 0 ): ?> style="margin-left: 1px;"<?php endif; ?>>
	<!--<p class="link">remipathier.cookingfor.com</p>-->
	<div class="recipe-details">
		<?php
                if ( empty( $object['picture'] ) )
                    $object['picture'] = 'default.jpg';
                ?>
		    <a href="<?php echo $this->url( 'recipe.details', $object ) ?>">
                        <img class="picture" src="<?php echo $this->thumbnail( $object['picture'], 226, 226 ) ?>" alt="<?php $this->e( empty($object['picture_title']) ? $object['title'] : $object['picture_title'] ) ?>" />
		</a>
	
			<p class="infos">
				<a href="<?php echo $this->url( 'recipe.details', $object ) ?>" title="<?php echo $object['title']; ?>">
                                       <?php echo $this->truncateWords( $object['title'], 29 ) ?>
                                       <?php if ( strlen( $object['title'] ) > 29 ): ?>...<?php endif ?>

				</a>
			</p>
	
		<p class="author">
                    <a href="<?php echo $this->url( 'profile.details', array( 'slug' => $object['profile_slug'] ) ) ?>" title="<?php $this->e( $object['profile_name'] ) ?>">
                        <?php echo $this->truncateWords($object['profile_name'], 35) ?>
                    </a>
		</p>
		
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
    $this->includeTemplate( 'paginate.php' );
?>

<!--
<a href="<?php echo $this->url( 'recipe.create' ); ?>">create</a>
-->

