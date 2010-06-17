<style>
/*Init 100%*/
#center_column { width: 980px; padding: 0; }
#center_column a { text-decoration: none;}

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

<?php $this->includeOnceTemplate( 'recipe.header.php' ) ?>

<div class="breadcrumb">
	<a title="retour à Accueil" href="<?php echo __PS_BASE_URI__ ?>">Accueil</a>
	<span class="navigation-pipe"><img alt="" src="<?php echo __PS_BASE_URI__ ?>themes/mmarket/img/fleche.jpg"></span>
            <a href="<?php $this->url( 'recipe.index' ) ?>" title="Recettes">
                Recettes
            </a>
        <?php if ( !empty( $this->breadcrumbHack ) ): ?>
	<span class="navigation-pipe"><img alt="" src="<?php echo __PS_BASE_URI__ ?>themes/mmarket/img/fleche.jpg"></span>
	<?php echo $this->breadcrumbHack ?>
        <?php endif ?>
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
		
		<div class="clear"></div>
	</div>
</div>
<?php $forloopCounter++; endforeach; ?>


<?php
    $this->includeTemplate( 'paginate.php' );
?>

<!--
<a href="<?php echo $this->url( 'recipe.create' ); ?>">create</a>
-->

