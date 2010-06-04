<style>
/*Init 100%*/
#center_column { width: 980px; padding: 0; }
#center_column a { text-decoration: none;}
#left_column { display: none; }

#nav-object { color: #b0aaac; width: 980px; height: 30px; list-style: none; margin-bottom: 10px; }
#nav-object li { display: block; float: left; line-height: 30px; height: 30px; }
#nav-object li.browseby { font-size: 10px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; padding-right: 8px; }
#nav-object li a { font: bold 15px Times, Arial; color: #b0aaac; text-transform: uppercase; }
#nav-object li a.selected { color: #000; }
#nav-object li.sep { font-size: 9px; padding: 0px 8px; }

.object { width: 740px; float: left;}
.object .object-left { width: 310px; float: left; }
.object .object-left #object-photo { vertical-align: bottom; border:1px solid #DADADA; margin-bottom:5px; overflow:hidden; position:relative; text-align:center; width:310px; }
.object .object-left #object-photo #object-ths { float:left; margin-left:5px; margin-right:10px; margin-top:3px; }
.object .object-left #object-photo #object-ths .object-th  { border:1px solid #DADADA; float:left; height:45px; margin-bottom:5px; margin-right:5px; text-align:center; width:45px; }
.object .object-left #object-video { position: absolute; margin-top: 10px; width: 240px; height: 130px; position: relative; }
.object .object-left #object-video a { display: block; width: 240px; height: 130px; text-align: center; z-index: 123999; position: absolute; padding-top: 40px; }
.object .object-left #object-video #background-video { opacity: 0.5; filter : alpha(opacity=50); position: absolute; background: url('http://storage.canalblog.com/21/51/314534/43401831_p.jpg') center center no-repeat; width: 240px; height: 130px; -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; }

.object .object-right { float: right; width: 410px;}
.object .object-right .object-header { position: relative; border-bottom: 1px solid #dadada; padding: 0 0 9px 0; }
.object .object-right .object-header h2 { color: #232323; font-size: 26px; font-family: Times, Georgia, Arial; font-weight: normal;}
.object .object-right .object-header .object-author { color: #232323; font-size: 18px; font-family: Times; padding-top: 10px;}
.object .object-right .object-header .object-author a { color: #b49135; }
.object .object-right .object-header .object-author a:hover { color: #232323; }
.object .object-right .object-header .object-intro { text-align: justify; margin-top: 10px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; font-size: 11px; color: #969696; word-spacing: 0.5px; line-height: 18px;}
.object .object-right .object-header .links-intro a { font-weight: bold; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; font-size: 11px; color: #539893; border-bottom: 1px solid #969696; display: block; float: left; margin-right: 20px; margin-top: 10px;}
.object .object-right .object-header .links-intro a:hover { color: #D02F1E; border-bottom: 1px solid #cf6875;}
.object .object-right .object-header .share-object p.lovedit { background: url('themes/mmarket/img/object-love.jpg') 0 1px no-repeat; padding-left: 15px; font-style: italic; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; font-size: 11px; color: #969696; padding-bottom: 10px;}
.object .object-right .object-header .share-object { position: absolute; bottom: 10px; left: 0; }

.object .object-left .object-author, .object .object-right .object-description { margin-top: 20px; }
.object .object-left .object-author .author-name, .object .object-right .h3 { clear: both; font-size: 18px; color: #969696; font-family: Times; border-bottom: 1px solid #dadada; margin-bottom: 7px; padding-bottom: 7px; }
.object .object-left .object-author .author-photo { float: left; margin-right: 7px; margin-bottom: 2px; border: 1px solid #dadada; vertical-align: bottom; width: 87px; height: 87px; }
.object .object-left .object-author .author-description { line-height: 19px; font-size: 11px; color: #969696; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; text-align: justify;}

.object .object-right .object-description h3 { text-transform:uppercase; font-weight: bold; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; font-size: 15px; color: #232323; padding-bottom: 10px;}
.object .object-right .object-description .step-desc { color:#666666; font-family:Lucida,"Lucida Sans",Arial,sans-serif; font-size:12px; line-height:21px; padding-bottom:20px; }
.object .object-right .object-infos { overflow: auto; border-bottom: 1px dashed #dadada; margin-bottom: 20px; padding-bottom: 7px; }
.object .object-right .object-infos-block { float: left; margin-right: 15px; color: #D02F1E; font-size: 11px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; padding: 5px; }

#object-tags { list-style: none; font-size: 11px; font-family: Verdana; color: #666; clear: both; float: right; margin: 0 0 10px 0; }
#object-tags li { float: left; display: block; margin-left: 5px; }
#object-tags .title { text-decoration: underline; text-transform: uppercase; }
#object-column { float: right; }
#object-column ul li .objectProduct-th { border:1px solid #DADADA; float:left; }
#object-column ul li .objectProduct-th img { vertical-align: bottom; }
#object-column ul li .objectProduct-link { float: left; margin-left: 10px; max-width: 135px; }
#object-column .block {  border: 1px solid #dadada; padding: 10px; }
#object-column .block h4 { font-size: 22px; font-family: Times; color: #232323; font-weight: normal; border-bottom: 1px solid #dadada; padding-bottom: 10px; margin-bottom: 10px; }
#object-column .block ul { margin: 0; padding: 0; }
#object-column .block li { padding: 0; margin: 0; font-size: 11px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; color: #969696; line-height: 21px;}
#object-column .block li .att { color: #D02F1E; }
#object-column .block li .object-step { text-transform: uppercase; font-weight:bold; }

a.btn-block { display: block; height: 26px; width: 170px; margin: 0 auto; margin-top: 10px; text-align: center; font-size: 16px; font-style: italic; font-family: Times; color: #666; line-height: 26px; background: #f7f7f7; border: 1px solid #dadada; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px; }
a.btn-block:hover { background: #f1f1f1; }
</style>

<div class="breadcrumb">
	<a title="retour à Accueil" href="/">Accueil</a>
	<span class="navigation-pipe"><img alt="" src="/themes/mmarket/img/fleche.jpg"></span>
	<a href="<?php echo $this->url( 'recipe.list' ) ?>" title="Liste des recettes">Recettes</a>
	<span class="navigation-pipe"><img alt="" src="/themes/mmarket/img/fleche.jpg"></span>
	<?php echo $this->object['title'] ?>

</div>
<!--
<ul id="nav-object">
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

<div class="object">
        <div class="object-left">
            <?php if ( !empty( $this->pictures ) ): ?>
            <div id="object-photo">
                <a class="thickbox" href="<?php echo $this->getAbsoluteUploadUrl( $this->pictures[0]['picture'] ) ?>" title="<?php $this->e( $this->object['title'] ) ?>">
                    <img src="<?php echo $this->thumbnail( $this->pictures[0]['picture'], 300, 300 ); ?>" alt="<?php $this->e( $this->pictures[0]['title'] ) ?>" style="margin:4px 0 0; vertical-align:baseline;" id="bigpic" />
                </a>
                <div id="object-ths">
                    <?php foreach( $this->pictures as $key => $picture ): ?>
                    <?php
                    /* prepare 300x300 thumbnail called by javacript */
                    $this->thumbnail( $picture['picture'], 300, 300 );
                    ?>
                    <div class="object-th">
                        <a rel="other-views" href="<?php echo $this->getAbsoluteUploadUrl( $picture['picture'] ) ?>" class="thickbox">
                            <img alt="<?php $this->e( $picture['title'] ) ?>" src="<?php echo $this->thumbnail( $picture['picture'], 45, 45 ) ?>" id="thumb_<?php echo $key ?>">
                        </a>
                    </div>
                    <?php endforeach ?>
                    <div class="clear"></div>
                </div>
            </div>
            <?php endif ?>
	    
	<div style="float: right; margin-bottom: 10px;">
		<a href="http://www.addthis.com/bookmark.php?v=250&pub=xa-4a48da264c324c50" onmouseover="return addthis_open(this, '', window.location.href, document.title)" onmouseout="addthis_close()" onclick="return addthis_sendto()">
		    <img src="/themes/mmarket/img/lg-bookmark-mm.gif" width="127" height="15" alt="Partager" style="border:0"/>
		</a>
		<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js?pub=xa-4a48da264c324c50"></script>
	</div>

            <?php if ( !empty( $this->categories ) ): ?>
		<ul id="object-categories">
		    <li class="title">categories:</li>
		    <?php foreach( $this->categories as $category ): ?>
		    <li>
                        <a href="<?php $this->url( 'recipe.listByCategory', $category ) ?>" title="Recettes de la catégorie <?php $this->e( $category['title']) ?>">
                            <?php $this->e( $category['title'] ) ?>
                        </a>
                    </li>
		    <?php endforeach ?>
		</ul>
            <?php endif ?>

            <?php if ( !empty( $this->tags ) ): ?>
		<ul id="object-tags">
		    <li class="title">Mots clés:</li>
		    <?php foreach( $this->tags as $tag ): ?>
		    <li>
                        <a href="<?php $this->url( 'recipe.listByTag', $tag ) ?>" title="Recettes tagu&eacute;es <?php $this->e( $tag['name']) ?>">
                            <?php $this->e( $tag['name'] ) ?>
                        </a>
                    </li>
		    <?php endforeach ?>
		</ul>
            <?php endif ?>
                <div class="object-author">
                    <p class="author-name"><?php $this->e( $this->profile['name'] ) ?></p>
                    <p class="author-description">
                            <?php if ( !empty( $this->profile['picture'] ) ): ?>
                            <img class="author-photo" src="<?php echo $this->thumbnail( $this->profile['picture'], 87, 87 ); ?>" title="<?php $this->e( $this->profile['name'] ) ?>" />
                            <?php endif ?>
                            <?php $this->e( $this->profile['introduction'] ) ?>
                    </p>
                    <a title="<?php $this->e( $this->profile['name'] ) ?>" href="<?php echo $this->url( 'profile.details', $this->profile ) ?>" class="btn-block" style="width: 50%; float: right;">Voir le profil</a>
                </div>
        </div>
        <div class="object-right">
                <div class="object-header">
                        <h2><?php $this->e( $this->object['title'] ) ?></h2>
                        <?php if ( !empty( $this->object['author'] ) ): ?>
                        <p class="object-author">Par&nbsp; <?php $this->e( $this->object['author'] ) ?></p>
                        <?php endif ?>
                        <?php if ( !empty( $this->object['summary'] ) ): ?>
                        <p class="object-intro">
                            <?php $this->e( $this->object['summary'] ) ?>
                        </p>
                        <?php endif ?>

                        <!--
                        <div class="links-intro">
                                <a href="#">J'aime cette recette</a>
                                <a href="#">Commenter la recette</a>
                        </div>
                        <div class="share-object">
                                <p class="lovedit">788 personnes ont aim&eacute; cette recette</p>
                                <a href="#">
                                        <img src="http://www.madeleinemarket.com/themes/mmarket/img/lg-bookmark-mm.gif" />
                                </a>
                        </div>
                        -->
                </div>
                <?php 
                if ( !empty( $this->object['prepTime'] ) ||
                     !empty( $this->object['cookTime'] ) ||
                     !empty( $this->object['restTime'] ) ||
                     !empty( $this->object['yield'] ) ||
                     !empty( $this->object['recipeSteps'] )
                ):
                ?>
                <div class="object-description">
                        
                        <?php /*<div class="h3">Pr&eacute;paration</div>*/ ?>
                        
                        <?php 
                        if ( !empty( $this->object['prepTime'] ) ||
                             !empty( $this->object['cookTime'] ) ||
                             !empty( $this->object['restTime'] ) ||
                             !empty( $this->object['yield'] )
                        ):
                        ?>
                        <div class="object-infos">
                            <?php if ( !empty( $this->object['prepTime'] ) ): ?>
                                <p class="object-infos-block">Pr&eacute;paration: <span class="bold"><?php $this->e( $this->object['prepTime'] ) ?></span></p>
                            <?php endif ?>
                            <?php if ( !empty( $this->object['cookTime'] ) ): ?>
                                <p class="object-infos-block">Cuisson: <span class="bold"><?php $this->e( $this->object['cookTime'] ) ?></span></p>
                            <?php endif ?>
                            <?php if ( !empty( $this->object['restTime'] ) ): ?>
                                <p class="object-infos-block">Repos: <span class="bold"><?php $this->e( $this->object['restTime'] ) ?></span></p>
                            <?php endif ?>
                        </div>
                        <?php endif ?>
                        
                        <?php if ( !empty($this->steps) ): ?>
                            <?php $forloopCounter = 0; foreach( $this->steps as $step ): ?>
            			<h3 <?php if ( $forloopCounter == 0 ): ?>class="clear"<?php endif ?>><?php $this->e( $step['title'] ) ?></h3>

                                <?php if ( !empty($step['description']) ): ?>
            			<p class="step-desc">
                                <?php $this->e( $step['description'] ) ?>
                                </p>
                                <?php endif ?>
                            <?php $forloopCounter++; endforeach ?>
            		<?php endif ?>
                </div>
                <?php endif ?>
        </div>
</div>
<div id="object-column">
        <?php if ( !empty( $this->ingredientQuantities ) ): ?>
        <div class="block">
                <h4>Ingr&eacute;dients</h4>
                <ul>
		    <?php if ( !empty( $this->object['yield'] ) ): ?>
                        <li>Pour : <span class="bold"><?php $this->e( $this->object['yield'] ) ?></span></li>
                    <?php endif ?>
			    
                    <?php foreach( $this->ingredientQuantities as $ingredient ): ?>
                        <li><?php $this->e( $ingredient['ingredient'] ) ?><?php if ( !empty( $ingredient['quantity'] ) ): ?> : <span class="att"><?php $this->e( $ingredient['quantity'] ) ?></span><?php endif ?></li>
                    <?php endforeach; ?>
                </ul>
                <!--<a class="btn-block" href="#">Voir les produits</a>-->
        </div>
        <?php endif ?>

        <?php if ( !empty( $this->ingredientProducts) ): ?>
    	<div class="block">
    		<h4>Suggestions de produits</h4>
    		<ul>
                <?php 
                $forloopCounter = 0;
                foreach( $this->ingredientProducts as $ingredientProduct ): ?>
                <?php
                $product = new Product(intval( $ingredientProduct['product'] ), true, 2);

                // skip invalid products
                if ( !$product ) continue;
                
                $cover = Product::getCover( $product->id );
                ?>
    			<li <?php if ( $forloopCounter > 0 ): ?>style="margin-top: 10px;"<?php endif ?>>
				<div class="objectProduct-th">
					<a href="<?php echo __PS_BASE_URI__ ?>product.php?id_product=<?php echo $product->id; ?>" style="float: left;"><img alt="<?php echo $product->name ?>" src="<?php echo sprintf( "%simg/p/%s-%s-small.jpg", __PS_BASE_URI__, $product->id, $cover['id_image'] ) ?>" /></a>
				</div>
				<div class="objectProduct-link">
					<a title="<?php echo $product->name ?>" href="<?php echo __PS_BASE_URI__ ?>product.php?id_product=<?php echo $product->id; ?>"><?php echo $product->name ?></a>
					<p><a title="<?php $this->e( $product->manufacturer_name ) ?>" href="<?php echo __PS_BASE_URI__ ?>manufacturer.php?id_manufacturer=<?php echo $product->id_manufacturer ?>" style="color: rgb(208, 47, 30); text-decoration: none;"><?php $this->e( $product->manufacturer_name ) ?></a></p>
				</div>
				<div class="clear"></div>
			</li>
                <?php 
                    $forloopCounter ++;
                endforeach;
                unset( $forloopCounter );
                ?>
    		</ul>

    	</div>
        <?php endif ?>

        <?php if ( !empty( $this->toolProducts ) ): ?>
    	<div class="block">
    		<h4>Outils recommandés</h4>
    		<ul>
                <?php 
                $forloopCounter = 0;
                foreach( $this->toolProducts as $toolProduct ): ?>
                <?php
                $product = new Product(intval( $toolProduct['product'] ), true, 2);

                // skip invalid products
                if ( !$product ) continue;

                $cover = Product::getCover( $product->id );
                ?>
    			<li <?php if ( count( $this->toolProducts ) > 1 ): ?>style="margin-top: 10px;"<?php endif ?>>
				<div class="objectProduct-th">
					<a href="<?php echo __PS_BASE_URI__ ?>product.php?id_product=<?php echo $product->id; ?>" style="float: left;"><img alt="<?php echo $product->name ?>" src="<?php echo sprintf( "%simg/p/%s-%s-small.jpg", __PS_BASE_URI__, $product->id, $cover['id_image'] ) ?>" /></a>
				</div>
				<div class="objectProduct-link">
					<a title="<?php echo $product->name ?>" href="<?php echo __PS_BASE_URI__ ?>product.php?id_product=<?php echo $product->id; ?>"><?php echo $product->name ?></a>
					<p><a title="<?php $this->e( $product->manufacturer_name ) ?>" href="<?php echo __PS_BASE_URI__ ?>manufacturer.php?id_manufacturer=<?php echo $product->id_manufacturer ?>" style="color: rgb(208, 47, 30); text-decoration: none;"><?php $this->e( $product->manufacturer_name ) ?></a></p>
				</div>
				<div class="clear"></div>
			</li>
                <?php 
                    $forloopCounter ++;
                endforeach;
                unset( $forloopCounter );
                ?>
    		</ul>
    	</div>
        <?php endif ?>

        <?php if ( !empty( $this->tools ) ): ?>
    	<div class="block">
    		<h4>Outils nécessaires</h4>
    		<ul>
                <?php 
                foreach( $this->tools as $tool ): ?>
                <?php
                ?>
    			<li>
                    <?php $this->e( $tool['name'] ) ?>
                </li>
                <?php endforeach ?>
    		</ul>
    	</div>
        <?php endif ?>

        <!--
        <div class="block">
                <h4>Produits de la recette</h4>
                -
                <a class="btn-block" href="#">Voir les produits</a>
        </div>
        <div class="block">
                <h4>Id&eacute;es recette</h4>
                -
                <a class="btn-block" href="#">Voir les produits</a>
        </div>
        -->
</div>

                <?php if ( !empty( $this->object['video'] ) ): ?>
                <div style="overflow: auto; clear: left; width: 735px;">
                    <div class="title-tab">Vidéo de la préparation</div>
                    <object height="375" width="735">
                        <param name="allowfullscreen" value="true">
                        <param name="allowscriptaccess" value="always">
                        <param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=<?php $this->e( $this->object['video'] ) ?>&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=2881B1&amp;fullscreen=1">
                        <embed src="http://vimeo.com/moogaloop.swf?clip_id=<?php $this->e( $this->object['video'] ) ?>&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=0&amp;show_portrait=0&amp;color=2881B1&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" height="375" width="735">
                    </object>
                </div>
                <?php endif ?>

<?php /*echo $this->comments*/ ?>

<!--
<a href="<?php /* echo $this->url( 'recipe.edit', $this->object ) */ ?>">edit</a>
-->

<script type="text/javascript">
function displayImage(  ) {
    var selectedSrc = $(this).attr( 'src' ).replace( /45x45/, '300x300' );
    var targetImg   = $( '#bigpic' );

    if ( selectedSrc != targetImg.attr( 'src' ) ) {
        targetImg.fadeOut( 'fast', function(  ) {
            targetImg.attr( 'src', selectedSrc );
            targetImg.fadeIn( 'fast' );
        });
    }
}

$(document).ready( function(  ) {

    $( '#object-ths .object-th img' ).hover(
        displayImage,
        function(  ){}
    );

});
</script>
