<style>
/*Init 100%*/
#center_column { width: 980px; padding: 0; }
#center_column a { text-decoration: none;}
#left_column { display: none; }

#nav-recipe { color: #b0aaac; width: 980px; height: 30px; list-style: none; margin-bottom: 10px; }
#nav-recipe li { display: block; float: left; line-height: 30px; height: 30px; }
#nav-recipe li.browseby { font-size: 10px; font-family: Verdana; padding-right: 8px; }
#nav-recipe li a { font: bold 15px Times, Arial; color: #b0aaac; text-transform: uppercase; }
#nav-recipe li a.selected { color: #000; }
#nav-recipe li.sep { font-size: 9px; padding: 0px 8px; }

.recipe { width: 740px; float: left;}
.recipe .author-left { width: 260px; float: left;}
.recipe .author-left #author-photo { border: 1px solid #dadada; padding: 5px; width: 260px; height: 260px; }
.recipe .author-left #author-photo img { vertical-align: bottom; }
.recipe .author-left .share { float: right; padding-top: 5px; }
.recipe .author-left #external-links { clear: both; padding-top: 10px; }
.recipe .author-left #external-links ul { list-style: none; }
.recipe .author-left #external-links ul li { line-height: 19px; }
.recipe .author-left #external-links ul li a { font: normal 11px Verdana; color: #ab3847; }
.recipe .author-left #external-links ul li a:hover { font: normal 11px Verdana; color: #232323; }

.recipe .author-right { float: right; width: 450px; border-top: 1px solid #dadada; padding: 9px 0;}
.recipe .author-right h2 { color: #969696; font-size: 30px; font-family: Times, Georgia, Arial; font-weight: normal; }
.recipe .author-right h3, .recipe .author-left #external-links h3 { color: #969696; font-size: 24px; font-family: Times, Georgia, Arial; font-weight: normal; padding-bottom: 5px; border-bottom: 1px solid #dadada; margin-top: 20px; }
.recipe .author-right .author-intro, .recipe .author-right .author-profil { text-align: justify; margin-top: 10px; font-family: Verdana; font-size: 11px; color: #969696; word-spacing: 0.5px; line-height: 18px;}

.recipe .author-left .recipe-author, .recipe .author-right .recipe-description { margin-top: 40px; }
.recipe .author-left .recipe-author .author-name, .recipe .author-right .recipe-title-steps { font-size: 18px; color: #969696; font-family: Times; border-bottom: 1px solid #dadada; margin-bottom: 7px; padding-bottom: 7px; }
.recipe .author-left .recipe-author .author-photo { float: left; margin-right: 7px; margin-bottom: 2px; border: 1px solid #dadada; vertical-align: bottom; width: 87px; height: 87px; }
.recipe .author-left .recipe-author .author-description { line-height: 19px; font-size: 11px; color: #969696; font-family: Verdana; text-align: justify; }


.favorites_recipes, .favorites_products { float: left; width: 740px; margin-top: 20px; }
.favorites_products { margin-top: 5px; }
.favorites_recipes .recipe_block, .favorites_products .product_block { margin-bottom: 15px; float: left; width: 175px; margin-right: 13px; }
.favorites_recipes .nomarg, .favorites_products .nomarg { margin: 0 !important; }
.favorites_recipes .recipe_block .thumb, .favorites_products .product_block .thumb { padding: 3px; border: 1px solid #dadada; }
.favorites_recipes .recipe_block .thumb img, .favorites_products .product_block .thumb img { vertical-align: bottom; }
.favorites_recipes .recipe_block a, .favorites_products .product_block a { line-height: 19px; font-size: 11px; color: #969696; font-family: Verdana; }
.favorites_recipes .recipe_block a:hover, .favorites_products .product_block a:hover { color: #539893; text-decoration: underline; }
.favorites_recipes .title, .favorites_products .title { font-size: 22px; color: #969696; font-family: Times; border-bottom: 1px solid #dadada; margin-bottom: 7px; padding-bottom: 7px; }

#recipe-column { float: right; width: 220px; }
#recipe-column .block {  border: 1px solid #dadada; padding: 10px; }
#recipe-column .block h3 { font-size: 22px; font-family: Times; color: #232323; font-weight: normal; border-bottom: 1px solid #dadada; padding-bottom: 10px; margin-bottom: 10px; }
#recipe-column .block ul { margin: 0; padding: 0; }
#recipe-column .block li { padding: 0; margin: 0; font-size: 11px; font-family: Verdana; color: #969696; line-height: 21px; _height: 21px;}
#recipe-column .block li .att { color: #ab1d37; }
#recipe-column .block .msg-author { background: #F6F6F6; width: 168px; display: block; margin: 0 auto; height: 100px; border: 1px solid #dadada; font: normal 11px Verdana; padding: 5px; color: #969696; }
#recipe-column .block .title-setmsg { font-style: italic; font-family: Times; font-size: 16px; font-weight: bold; color: #969696; padding-bottom: 5px; width: 180px; margin: 0 auto; }

a.btn-block { display: block; height: 30px; width: 180px; margin: 0 auto; margin-top: 10px; text-align: center; font-size: 16px; font-style: italic; font-family: Times; color: #fff; line-height: 30px; background: #929da3; }
a.btn-block:hover { background: #539893; }
</style>

<div class="breadcrumb">
	<a title="retour à Accueil" href="/">Accueil</a>
	<span class="navigation-pipe"><img alt="" src="/themes/mmarket/img/fleche.jpg"></span>
	<a href="<?php echo $this->url( 'profile.list' ) ?>" title="List des profils">Profils</a>
    <span class="navigation-pipe"><img alt="" src="/themes/mmarket/img/fleche.jpg"></span>
	<?php $this->e( $this->object['name'] ) ?>
</div>

<?php
if ( empty( $this->object['picture'] ) )
    $this->object['picture'] = 'default.jpg';
?>

<div class="recipe">
	<div class="author-left">
		<div id="author-photo">
			<?php if ( isset( $this->object['picture'] ) ): ?>
            <img src="<?php echo $this->thumbnail( $this->object['picture'], 260, 260 ) ?>" width="260" height="260" alt="<?php $this->e( $this->object['name'] ) ?>" />	
            <?php else: ?>
            <img src="<?php echo $this->thumbnail( $this->configuration['defaultPicture'], 260, 260 ) ?>" width="260" height="260" alt="<?php $this->e( $this->object['name'] ) ?>" />	
            <?php endif ?>
            <!--
			<p class="share">
				<a href="#">
                    TODO
					<img src="http://www.madeleinemarket.com/themes/mmarket/img/lg-bookmark-mm.gif" />
				</a>
			</p>
            -->
		</div>
        <?php if ( !empty( $this->sites ) ): ?>
		<div id="external-links">
			<h3>Les sites de <?php $this->e( $this->object['name'] ) ?></h3>
			<ul>
                <?php foreach( $this->sites as $site ): ?>
				<li><a href="http://<?php echo $site['site'] ?>"><span style="color: #232323;">&bull;</span> <?php echo $site['site'] ?></a></li>
                <?php endforeach ?>
			</ul>
		</div>
        <?php endif ?>
	</div>
	<div class="author-right">
			<h2><?php $this->e( $this->object['name'] ) ?></h2>
			<p class="author-intro">
                <?php $this->e( $this->object['introduction'] ) ?>
			</p>
            <?php if ( isset( $this->object['presentation'] ) ): ?>
			<h3>Profil</h3>
			<p class="author-profil">
                <?php $this->e( $this->object['presentation'] ) ?>
			</p>
            <?php endif ?>
	</div>
</div>

    <!--
<div id="recipe-column">
	<div class="block">
		<p class="title-setmsg">&Agrave; <?php $this->e( $this->object['name'] ) ?> :</p>
        <form action="" method="post" class="msg-author-form">
		    <textarea name="message" class="msg-author">Votre message</textarea>
		    <a class="btn-block" href="#">Envoyer</a>
        </form>
	</div>
</div>
    -->
<?php if ( !empty( $this->recipes ) ): ?>
<div class="favorites_recipes">
	<div class="title">Mes recettes</div>
        <?php
        $forLoop = 0;
        foreach( $this->recipes as $recipe ):
            if ( empty( $recipe['picture'] ) ) $recipe['picture'] = 'default.jpg';
        ?>
	<div class="recipe_block <?php if ( ( $forLoop + 1 ) % 4 == 0 ): ?>nomarg<?php endif ?>">
		<div class="thumb">
			<a href="<?php echo $this->url( 'recipe.details', $recipe ) ?>" title="<?php $this->e( empty( $recipe['pictureTitle'] ) ? $recipe['title'] : $recipe['pictureTitle'] ) ?>">
                <img src="<?php echo $this->thumbnail( $recipe['picture'], 167, 167 ) ?>" width="167" height="167" alt="<?php $this->e( $recipe['title'] ) ?>" />
            </a>
		</div>
		<a href="<?php echo $this->url( 'recipe.details', $recipe ) ?>" title="<?php $this->e( $recipe['title'] ) ?>">
                    <?php echo $this->truncateWords($recipe['title'], 30); ?><?php if ( strlen( $recipe['title'] ) > 30 ) echo " ..." ?>
                </a>
	</div>
        <?php
            $forLoop++;
        endforeach;
        unset( $forLoop );
        ?>
</div>
<?php endif ?>

<?php if ( $products = prestashopFetchProducts( $this->products, 'product' ) ): ?>
<div class="favorites_products">
	<div class="title">Mes produits favoris</div>
    <?php 
    $forLoop = 0;
    foreach( $products as $product ): ?>
    <?php
    $cover = Product::getCover( $product->id );
    ?>
	<div class="product_block <?php if ( ( $forLoop + 1 ) % 4 == 0 ): ?>nomarg<?php endif ?>">
		<div class="thumb">
			<a title="<?php echo $product->name ?>" href="<?php echo prestashopUrl( $product ) ?>">
				<img width="167" height="167" alt="<?php echo $product->name ?>" src="<?php echo sprintf( "%simg/p/%s-%s-home.jpg", __PS_BASE_URI__, $product->id, $cover['id_image'] ) ?>" />
			</a>
		</div>
                <a title="<?php echo $product->name ?>" href="<?php echo prestashopUrl( $product ) ?>">
                    <?php echo $this->truncateWords($product->name, 30); ?><?php if ( strlen( $product->name ) > 30 ) echo " ..." ?>
                </a>
	</div>
    <?php 
        $forLoop++;
    endforeach;
    unset( $forLoop );
    ?>
</div>
<?php endif ?>

<script type="text/javascript">
$(document).ready( function(  ) {
    $( 'textarea.msg-author' ).focus( function(  ) {
        if ( $( this ).val(  ) == 'Votre message' ) {
            $( this ).val( '' );
        }
    });

    $( 'form.msg-author-form a.btn-block' ).click( function( e ) {
        e.preventDefault(  );
        
        var form = $( this ).parents( 'form' );

        $.ajax({
            async: true,
            complete: function( request, textStatus ) {
                $( 'form.msg-author-form' ).html( request.responseText );
            },
            data: form.serialize(  ),
            type: 'POST',
            url: document.location.href,
        });
    });
});
</script>
