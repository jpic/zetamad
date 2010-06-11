<style>
#left_recipe { float:left; margin-top:4px; width:193px; }
.block { border: none; padding: 0; }
.block .block_title { padding: 0; font-family: Georgia, Times, Arial, sans-serif; font-size: 1.8em; font-weight: normal; background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/border_title.jpg'; ?>') repeat-x left bottom; }
.block .block_title .titleGreen { color: #a0c223; }
.block .block_title .titleBlue { color: #666; }
.block ul { margin-left: none; }
.block ul li { margin: 0; padding: 0; height: 30px; }
.block ul li a { display: block; color: #666; padding: 0; margin: 0; line-height: 30px; height: 30px; font-family: Georgia, Times, Arial, sans-serif; font-size: 1.2em; background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/border_sublist.jpg'; ?>') repeat-x left bottom;  }
.block ul li a:hover { background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/border_sublist.jpg'; ?>') repeat-x left bottom #f9f9f9; color: #de5161; text-decoration: none; }
.block ul li:hover { padding-left: 15px; background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/fleche.jpg'; ?>') no-repeat left center #f9f9f9; }

.block .register { background: url('<?php echo __PS_BASE_URI__ . '/themes/mmarket/img/block_registerRecipe.jpg'; ?>') no-repeat left center; width: 198px; height: 66px; }
.block .register p { padding-top: 22px; padding-left: 25px; line-height: 16px; font-family: Georgia, Times, Arial, sans-serif; }
.block .register p a { color: #484848; font-size: 1.1em; }
.block .register p a:hover { text-decoration: underline; }
.block .keywordsCloud a { color :#666; }
.block .keywordsCloud a:hover { color: #DE5161; }
#left_recipe .mtop { margin-top: 25px; }

/*default*/
#right { width: 788px; padding-left: 9px; float: left;  }
#right p.title { color: #a0978b; font-size: 1.4em; font-family: Georgia; line-height: 35px; }
#right p.title span.totalRecipe { color: #d35732; }

</style>

<div id="left_recipe">
    <div class="categories-left block">
        <div class="block_title">
            <span class="titleGreen">Cat&eacute;gories</span>
        </div>
            <ul>
                <?php foreach( $this->categories as $category ): ?>
                <li><a href="<?php $this->url( 'recipe.categoryDetails', $category ) ?>" title="<?php $this->e( $category['title'] ) ?>"><?php $this->e( $category['title'] ) ?></a></li>
                <?php endforeach ?>
                <li><a href="" title="">Verrines</a></li>
                <li><a href="" title="">Entr&eacute;es</a></li>
                <li><a href="" title="">Plats europ&eacute;ens</a></li>
                <li><a href="" title="">Plats r&eacute;gionnaux</a></li>
                <li><a href="" title="">Plats principaux</a></li>
                <li><a href="" title="">Boissons / Cocktails</a></li>
                <li><a href="" title="">Gateaux</a></li>
                <li><a href="" title="">Tartes</a></li>
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
<<<<<<< Updated upstream
            <a href="<?php $this->url( 'recipe.listByTag', $tag ) ?>" style="font-size: 80%;" title="<?php $this->e( $tag['name'] ) ?>"><?php $this->e( $tag['name'] ) ?></a>&nbsp;
=======
            <a href="<?php $this->url( 'recipe.listByTag', $tag ) ?>" style="font-size: 80%;" title="<?php $this->e( $tag['tag'] ) ?>"><?php $this->e( $tag['tag'] ) ?></a>&nbsp;
>>>>>>> Stashed changes
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
    <p class="title">Actuellement, <span class="totalRecipe"><?php $this->e( $this->recipeCount ) ?></span> recettes publi&eacute;es sur Madeleine Market !
    
    derni�res recettes

et <?php $this->e( $this->profileCount ) ?> contributeurs

</div>

<?php foreach( $this->recipes as $recipe ) : ?>
<?php $this->url( 'recipe.details', $recipe ) ?>
<?php $this->e( $recipe['title'] ) ?>
<?php endforeach ?>

<?php foreach( $this->profiles as $profile ): ?>
<?php $this->url( 'profile.details' , $profile ) ?>
<?php $this->e( $profile['name'] ) ?>
<?php endforeach ?>
