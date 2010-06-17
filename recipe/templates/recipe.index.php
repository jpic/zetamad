<style>

#register { border: none; display: none; }
#left-keywordsCloud .keywordsCloud { padding: 0 10px; }
.block .register { background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/block_registerRecipe.jpg'; ?>') no-repeat left center; width: 198px; height: 66px; }
.block .register p { padding-top: 22px; padding-left: 25px; line-height: 16px; font-family: Times, Arial, sans-serif; }
.block .register p a { color: #484848; font-size: 1em; font-family: Verdana; }
.block .register p a:hover { text-decoration: underline; }
.block .keywordsCloud a { color :#666; }
.block .keywordsCloud a:hover { color: #DE5161; }

/*default*/
#right { width: 768px; float: right;  }
#right p.title { border-bottom: 1px solid #dadada;  margin-bottom: 10px; color: #a0978b; font-size: 1.4em; font-family: Times; padding-bottom: 8px; margin-bottom: 16px; }
#right p.title span.totalRecipe { color: #d35732; }

#right .recipe-block { font-size: 11px; width: 238px; float: left; padding: 0 27px 27px 0; }
#right .recipe-details { -moz-box-shadow: 0 0px 4px #c0c0c0; -webkit-box-shadow: 0 0px 4px #c0c0c0; box-shadow: 0 0px 4px #c0c0c0; }
#right .recipe-details:hover { background: #f5f5f5; }
#right .recipe-details a { color: #DE5161; }
#right .recipe-details a:hover { color: #DE5161; }
#right .recipe-block p.link { padding: 5px 0; color: #b0aaac; font-size: 10px; font-family: Verdana;}
#right .recipe-details { border: 1px solid #d3d3d3; padding: 5px; overflow: hidden; height: 280px; }
#right .recipe-details img.picture { width: 226px; height: 226px; vertical-align: bottom; }
#right .recipe-details .infos {line-height: 18px; font-weight: bold; font-family: Verdana; padding: 10px 0 0 0; }
#right .recipe-details .author { line-height: 18px; color: #b0aaac; font-size: 10px; font-family: Verdana; font-weight: bold; }
#right .recipe-details .author a { color: #b0aaac; text-decoration: none; }
#right .recipe-details .author a:hover { text-decoration: underline; }

body#index #center_column #left_column { display:block; }

</style>

<?php $this->includeOnceTemplate( 'recipe.header.php' ) ?>

<div class="breadcrumb">
	<a title="retour à Accueil" href="<?php echo __PS_BASE_URI__ ?>">Accueil</a>
	<span class="navigation-pipe"><img alt="" src="<?php echo __PS_BASE_URI__ ?>themes/mmarket/img/fleche.jpg"></span>
	<a href="<?php $this->url( 'recipe.index' ) ?>" title="Recettes">
		Recettes
	</a>
</div>
<div class="clear"></div>

<div id="left_column">
    <div id="categories-left" class="block">
        <div class="block_title">
            <span class="titleGreen">Cat&eacute;gories</span>
        </div>
            <ul>
                <?php foreach( $this->categories as $category ): ?>
                <li><a href="<?php $this->url( 'recipe.categoryDetails', $category ) ?>" title="<?php $this->e( $category['title'] ) ?>"><?php $this->e( ucfirst($category['title'] )) ?></a></li>
                <?php endforeach ?>
            </ul>
    </div>
    
    <div id="register" class="block mtop">
        <div class="register">
            <p>
                <a href="" title="">Cr&eacute;ez un profil gratuitement et publiez vos recettes !</a>
            </p>
        </div>
    </div>
    
    <div id="left-keywordsCloud" class="block mtop">
        <div class="block_title">
            <span class="titleBlue">Nuage de tags</span>
        </div>
        <div class="keywordsCloud">
            <?php foreach( $this->tags as $tag ): ?>
            <a href="<?php $this->url( 'recipe.listByTag', $tag ) ?>" style="font-size: 80%;" title="<?php $this->e( $tag['name'] ) ?>"><?php $this->e( $tag['name'] ) ?></a>&nbsp;
            <?php endforeach ?>
        </div>
    </div>
</div>

<div id="right">
    <p class="title">Actuellement, <span class="totalRecipe"><?php $this->e( $this->recipeCount ) ?></span> recettes publi&eacute;es sur Madeleine Market !</p>
    
    <?php
    /*derni�res recettes et <?php $this->e( $this->profileCount ) ?> contributeurs
    */
    ?>

<?php $forloopCounter = 1; foreach( $this->recipes as $object ): ?>
<div class="recipe-block" <?php if( $forloopCounter % 3 == 0 ): ?> style="padding-right: 0;"<?php endif; ?>>
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
/*
<?php foreach( $this->profiles as $profile ): ?>
<?php $this->url( 'profile.details' , $profile ) ?>
<?php $this->e( $profile['name'] ) ?>
<?php endforeach ?>
*/
?>

</div>
