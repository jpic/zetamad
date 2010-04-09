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

.recipe-block { width: 238px; float: left; padding: 0 9px 15px 0; }
.recipe-block p.link { padding: 5px 0; color: #b0aaac; font-size: 10px; font-family: Verdana;}
.recipe-details { border: 1px solid #d3d3d3; padding: 5px; }
.recipe-details img.picture { width: 226px; height: 226px; vertical-align: bottom; }
.recipe-details .infos {line-height: 19px; font-weight: bold; color: #969696; font-family: Verdana; font-size: 11px; padding: 10px 0; }
.recipe-details .author { color: #656565; font-size: 10px; font-family: Verdana; font-weight: bold; }
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
<div class="recipe-block" <?php if( $forloopCounter == count( $this->objectList ) ): ?> style="padding-right: 0;"<?php endif; ?>>
	<!--<p class="link">remipathier.cookingfor.com</p>-->
	<div class="recipe-details">
	    <a href="<?php echo $this->generateUrl( 'recipe.details', $object ) ?>">
		    <img class="picture" width="226" height="226" src="<?php echo $this->getAbsoluteUploadUrl( $object['picture'] ) ?>" />
        </a>
		<p class="infos">
			<a href="<?php echo $this->generateUrl( 'recipe.details', $object ) ?>">
				<?php echo $object['title']; ?>
			</a>
		</p>

		<p class="author">
            <a href="<?php echo $this->generateUrl( 'profile.details', $object['profile'] ) ?>">
            <?php echo $object['profile']['name'] ?> &bull;
            </a>
        </p>
	</div>
</div>
<?php $forloopCounter++; endforeach; ?>

</ul>

<!--
<a href="<?php echo $this->generateUrl( 'recipe.create' ); ?>">create</a>
-->
