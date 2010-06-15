<style>
#left_recipe { float:left; margin-top:4px; width:193px; }
.block { border: none; padding: 0; }
.block .block_title { padding: 0; font-family: Times, Arial, sans-serif; font-size: 2em; font-weight: normal; background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/border_title.jpg'; ?>') repeat-x left bottom; }
.block .block_title .titleGreen { color: #a0c223; }
.block .block_title .titleBlue { color: #666; }
.block ul { margin-left: none; }
.block ul li { margin: 0; padding: 0; height: 30px; background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/fleche-left.gif'; ?>') no-repeat left center; }
.block ul li a { display: block; color: #666; padding: 0; margin: 0; line-height: 30px; height: 30px; font-family: Times, Arial, sans-serif; font-size: 1.4em; background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/border_sublist.jpg'; ?>') repeat-x left bottom; padding-left: 10px; }
.block ul li a:hover { color: #de5161; text-decoration: none; }
.block ul li:hover { background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/fleche-left.gif'; ?>') no-repeat left center #f9f9f9; color: #de5161; text-decoration: none; }

.block .register { background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/block_registerRecipe.jpg'; ?>') no-repeat left center; width: 198px; height: 66px; }
.block .register p { padding-top: 22px; padding-left: 25px; line-height: 16px; font-family: Times, Arial, sans-serif; }
.block .register p a { color: #484848; font-size: 1em; font-family: Verdana; }
.block .register p a:hover { text-decoration: underline; }
.block .keywordsCloud a { color :#666; }
.block .keywordsCloud a:hover { color: #DE5161; }
#left_recipe .mtop { margin-top: 25px; }

/*default*/
#right { width: 768px; float: right;  }
#right p.title { border-bottom: 1px solid #dadada;  margin-bottom: 10px; color: #a0978b; font-size: 1.4em; font-family: Times; line-height: 42px; }
#right p.title span.totalRecipe { color: #d35732; }

#right .recipe-block { font-size: 11px; width: 238px; float: left; padding: 0 27px 27px 0; }
#right .recipe-details { -moz-box-shadow: 0 0px 4px #c0c0c0; -webkit-box-shadow: 0 0px 4px #c0c0c0; box-shadow: 0 0px 4px #c0c0c0; }
#right .recipe-details:hover { background: #f5f5f5; }
#right .recipe-details a { color: #DE5161; }
#right .recipe-details a:hover { color: #DE5161; }
#right .recipe-details a.editprofil { float: left; color: #DE5161; font-size: 10px; font-weight: normal; display: block; _height: 20px; line-height: 20px; }
#right .recipe-details a.editrecipe { float: right; color: #DE5161; font-size: 10px; font-weight: normal; display: block; _height: 20px; line-height: 20px; }
#right .recipe-details a.editrecipe:hover, #right .recipe-details a.editprofil:hover { text-decoration: underline;  }
#right .recipe-block p.link { padding: 5px 0; color: #b0aaac; font-size: 10px; font-family: Verdana;}
#right .recipe-block div.adminpanel { margin: 5px 0; padding-top: 5px; border-top: 1px solid #dadada;}
#right .recipe-details { border: 1px solid #d3d3d3; padding: 5px; overflow: hidden; height: 280px; }
#right .recipe-details img.picture { width: 226px; height: 226px; vertical-align: bottom; }
#right .recipe-details .infos {line-height: 18px; font-weight: bold; font-family: Verdana; padding: 10px 0 0 0; }
#right .recipe-details .author { line-height: 18px; color: #b0aaac; font-size: 10px; font-family: Verdana; font-weight: bold; }
#right .recipe-details .author a { color: #b0aaac; text-decoration: none; }
#right .recipe-details .author a:hover { text-decoration: underline; }

</style>

<div id="left_recipe">
    <div class="categories-left block">
        <div class="block_title">
            <span class="titleGreen">Cat&eacute;gories</span>
        </div>
            <ul>
                <?php foreach( $this->categories as $category ): ?>
                <li><a href="<?php $this->url( 'recipe.categoryDetails', $category ) ?>" title="<?php $this->e( $category['title'] ) ?>"><?php $this->e( ucfirst($category['title'] )) ?></a></li>
                <?php endforeach ?>
            </ul>
    </div>
    
    <div class="categories-left block mtop">
        <div class="register">
            <p>
                <a href="" title="">Cr&eacute;ez un profil gratuitement et publiez vos recettes !</a>
            </p>
        </div>
    </div>
    
    <div class="categories-left block mtop">
        <div class="block_title">
            <span class="titleBlue">Nuage de tags</span>
        </div>
        <div class="keywordsCloud">
            <?php foreach( $this->tags as $tag ): ?>
            <a href="<?php $this->url( 'recipe.listByTag', $tag ) ?>" style="font-size: 80%;" title="<?php $this->e( $tag['name'] ) ?>"><?php $this->e( $tag['name'] ) ?></a>&nbsp;
            <?php endforeach ?>
            <a style="font-size: 180%;">sexe</a>&nbsp;
            <a style="font-size: 80%;">oeufs</a>&nbsp;
            <a style="font-size: 110%;">sardine</a>&nbsp;
            <a style="font-size: 150%;">charlotte aux fraises</a>&nbsp;
            <a style="font-size: 200%;">gateau chocolat</a>&nbsp;
            <a style="font-size: 130%;">tarte fraises</a>&nbsp;
            <a style="font-size: 80%;">tatin</a>&nbsp;
            <a style="font-size: 130%;">prunes</a>&nbsp;
            <a style="font-size: 100%;">salade</a>&nbsp;
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
                <?php
                /*
		<p class="author">
                    <a href="<?php echo $this->url( 'profile.details', array( 'slug' => $object['profile_slug'] ) ) ?>" title="<?php $this->e( $object['profile_name'] ) ?>">
                        <?php echo $this->truncateWords($object['profile_name'], 35) ?>
                    </a>
		</p>
              */
                ?>
		
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
