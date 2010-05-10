<style>
/*Init 100%*/
#center_column { width: 980px; padding: 0; }
#center_column a { text-decoration: none;}
#left_column, .breadcrumb { display: none; }

#nav-recipe { color: #b0aaac; width: 980px; height: 30px; list-style: none; margin-bottom: 10px; }
#nav-recipe li { display: block; float: left; line-height: 30px; height: 30px; }
#nav-recipe li.browseby { font-size: 10px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; padding-right: 8px; }
#nav-recipe li a { font: bold 15px Times, Arial; color: #b0aaac; text-transform: uppercase; }
#nav-recipe li a.selected { color: #000; }
#nav-recipe li.sep { font-size: 9px; padding: 0px 8px; }

.recipe { width: 740px; float: left;}
.recipe .recipe-left { width: 240px; float: left; }
.recipe .recipe-left #recipe-photo { vertical-align: bottom; width: 240px; height: 240px; }
.recipe .recipe-left #recipe-video { position: absolute; margin-top: 10px; width: 240px; height: 130px; position: relative; }
.recipe .recipe-left #recipe-video a { display: block; width: 240px; height: 130px; text-align: center; z-index: 123999; position: absolute; padding-top: 40px; }
.recipe .recipe-left #recipe-video #background-video { opacity: 0.5; filter : alpha(opacity=50); position: absolute; background: url('http://storage.canalblog.com/21/51/314534/43401831_p.jpg') center center no-repeat; width: 240px; height: 130px; -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; }

.recipe .recipe-right { float: right; width: 480px;}
.recipe .recipe-right .recipe-header { position: relative; border-top: 1px solid #dadada; border-bottom: 1px solid #dadada; padding: 9px 0; }
.recipe .recipe-right .recipe-header h2 { color: #232323; font-size: 26px; font-family: Times, Georgia, Arial; font-weight: normal;}
.recipe .recipe-right .recipe-header .recipe-author { color: #232323; font-size: 18px; font-family: Times; padding-top: 10px;}
.recipe .recipe-right .recipe-header .recipe-author a { color: #b49135; }
.recipe .recipe-right .recipe-header .recipe-author a:hover { color: #232323; }
.recipe .recipe-right .recipe-header .recipe-intro { text-align: justify; margin-top: 10px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; font-size: 11px; color: #969696; word-spacing: 0.5px; line-height: 18px;}
.recipe .recipe-right .recipe-header .links-intro a { font-weight: bold; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; font-size: 11px; color: #539893; border-bottom: 1px solid #969696; display: block; float: left; margin-right: 20px; margin-top: 10px;}
.recipe .recipe-right .recipe-header .links-intro a:hover { color: #c21123; border-bottom: 1px solid #cf6875;}
.recipe .recipe-right .recipe-header .share-recipe p.lovedit { background: url('themes/mmarket/img/recipe-love.jpg') 0 1px no-repeat; padding-left: 15px; font-style: italic; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; font-size: 11px; color: #969696; padding-bottom: 10px;}
.recipe .recipe-right .recipe-header .share-recipe { position: absolute; bottom: 10px; left: 0; }

.recipe .recipe-left .recipe-author, .recipe .recipe-right .recipe-description { margin-top: 20px; }
.recipe .recipe-left .recipe-author .author-name, .recipe .recipe-right .recipe-title-steps { font-size: 18px; color: #969696; font-family: Times; border-bottom: 1px solid #dadada; margin-bottom: 7px; padding-bottom: 7px; }
.recipe .recipe-left .recipe-author .author-photo { float: left; margin-right: 7px; margin-bottom: 2px; border: 1px solid #dadada; vertical-align: bottom; width: 87px; height: 87px; }
.recipe .recipe-left .recipe-author .author-description { line-height: 19px; font-size: 11px; color: #969696; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; text-align: justify;}

.recipe .recipe-right .recipe-description .step-title { text-transform:uppercase; font-weight: bold; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; font-size: 15px; color: #232323; padding-bottom: 10px;}
.recipe .recipe-right .recipe-description .step-desc { color:#666666; font-family:Lucida,"Lucida Sans",Arial,sans-serif; font-size:12px; line-height:21px; padding-bottom:20px; }
.recipe .recipe-right .recipe-infos { overflow: auto; border-bottom: 1px dashed #dadada; margin-bottom: 20px; padding-bottom: 7px; }
.recipe .recipe-right .recipe-infos-block { float: left; margin-right: 15px; color: #AB1D37; font-size: 11px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; padding: 5px; }

#recipe-column { float: right; width: 220px; }
#recipe-column .block {  border: 1px solid #dadada; padding: 10px; }
#recipe-column .block h3 { font-size: 22px; font-family: Times; color: #232323; font-weight: normal; border-bottom: 1px solid #dadada; padding-bottom: 10px; margin-bottom: 10px; }
#recipe-column .block ul { margin: 0; padding: 0; }
#recipe-column .block li { padding: 0; margin: 0; font-size: 11px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; color: #969696; line-height: 21px;}
#recipe-column .block li .att { color: #ab1d37; }
#recipe-column .block li .recipe-step { text-transform: uppercase; font-weight:bold; }

a.btn-block { display: block; height: 30px; width: 180px; margin: 0 auto; margin-top: 10px; text-align: center; font-size: 16px; font-style: italic; font-family: Times; color: #fff; line-height: 30px; background: #929da3; }
a.btn-block:hover { background: #539893; }
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

<div class="recipe">
        <div class="recipe-left">
            <?php if ( isset( $this->object['picture'] ) ): ?>
                <div id="recipe-photo">
			            <img src="<?php echo $this->getAbsoluteUploadUrl( $this->object['picture'] ); ?>" alt="<?php $this->e( $this->object['title'] ) ?>" height="240" width="240" />
                </div>
            <?php endif ?>
                <!--
                <div id="recipe-video">
                        <a href="#link" title="Jouer la vid&eacute;o"><img src="<?php echo $this->url( 'mad.static', array( 'path' => '/recipe/img/btn-play.png ') ) ?>" /></a>
                        <div id="background-video">
                        </div>
                </div>
                -->
                <div class="recipe-author">
                        <?php if ( isset( $this->object['profile'] ) ): ?>
                        <p class="author-name"><?php $this->e( $this->object['profile']['name'] ) ?></p>
                        <p class="author-description">
                                <?php if ( isset( $this->object['profile']['picture'] ) ): ?>
                                <img class="author-photo" src="<?php echo $this->getAbsoluteUploadUrl( $this->object['profile']['picture'] ); ?>" width="87" height="87" title="Photo profil X" />
                                <?php endif ?>
                                <?php $this->e( $this->object['profile']['introduction'] ) ?>
                        </p>
                        <a href="<?php echo $this->url( 'profile.details', $this->object['profile'] ) ?>" class="btn-block" style="width: 100%;">Voir le profil</a>
                        <?php elseif ( isset( $this->object['source'] ) ): ?>
                        <p class="author-description">
                            <?php $this->e( $this->object['source'] ) ?>
                        </p>
                        <?php endif ?>
                </div>
        </div>
        <div class="recipe-right">
                <div class="recipe-header">
                        <h2><?php $this->e( $this->object['title'] ) ?></h2>
                        <?php if ( isset( $this->object['profile'] ) ): ?>
                        <p class="recipe-author">Par&nbsp;<a href="<?php echo $this->url( 'profile.details', $this->object['profile'] ) ?>"><?php $this->e( $this->object['profile']['name'] ) ?></a></p>
                        <?php endif ?>
                        <?php if ( isset( $this->object['summary'] ) ): ?>
                        <p class="recipe-intro">
                            <?php $this->e( $this->object['summary'] ) ?>
                        </p>
                        <?php endif ?>
                        <!--
                        <div class="links-intro">
                                <a href="#">J'aime cette recette</a>
                                <a href="#">Commenter la recette</a>
                        </div>
                        <div class="share-recipe">
                                <p class="lovedit">788 personnes ont aim&eacute; cette recette</p>
                                <a href="#">
                                        <img src="http://www.madeleinemarket.com/themes/mmarket/img/lg-bookmark-mm.gif" />
                                </a>
                        </div>
                        -->
                </div>
                <?php 
                if ( isset( $this->object['prepTime'] ) || 
                     isset( $this->object['cookTime'] ) ||
                     isset( $this->object['numberOfPeople'] ) ||
                     isset( $this->object['recipeSteps'] )
                ):
                ?>
                <div class="recipe-description">
                        
                        <div class="recipe-title-steps">Pr&eacute;paration</div>
                        
                        <?php 
                        if ( isset( $this->object['prepTime'] ) || 
                             isset( $this->object['cookTime'] ) ||
                             isset( $this->object['numberOfPeople'] )
                        ):
                        ?>
                        <div class="recipe-infos">
                            <?php if ( isset( $this->object['prepTime'] ) ): ?>
                                <p class="recipe-infos-block">Pr&eacute;paration: <span class="bold"><?php $this->e( $this->object['prepTime'] ) ?>min</span></p>
                            <?php endif ?>
                            <?php if ( isset( $this->object['cookTime'] ) ): ?>
                                <p class="recipe-infos-block">Cuisson: <span class="bold"><?php $this->e( $this->object['cookTime'] ) ?>min</span></p>
                            <?php endif ?>
                            <?php if ( isset( $this->object['numberOfPeople'] ) ): ?>
                                <p class="recipe-infos-block" style="margin-right: 0;">Personnes: <span class="bold"><?php $this->e( $this->object['numberOfPeople'] ) ?></span></p>
                            <?php endif ?>
                        </div>
                        <?php endif ?>
                        
                        <?php if ( isset( $this->object['recipeSteps'] ) ): ?>
                            <?php $forloopCounter = 0; foreach( $this->iterate( $this->object['recipeSteps'] ) as $step ): ?>
            			<p class="step-title <?php if ( $forloopCounter == 0 ): ?>clear<?php endif ?>"><?php $this->e( $step['title'] ) ?></p>
                                  				
            			<p class="step-desc">
                            <?php $this->e( $step['description'] ) ?>
                        </p>
                            <?php $forloopCounter++; endforeach ?>
            			<?php endif ?>

                </div>
                <?php endif ?>
        </div>
</div>

<div id="recipe-column">
        <?php if ( isset( $this->object['ingredientQuantities'] ) && $this->object['ingredientQuantities'] ): ?> 
        <div class="block">
                <h3>Ingr&eacute;dients</h3>
                <ul>
                    <?php foreach( $this->iterate( $this->object['ingredientQuantities'] ) as $ingredient ): ?>
                        <li><?php $this->e( $ingredient['ingredient'] ) ?> : <span class="att"><?php $this->e( $ingredient['quantity'] ) ?></span></li>
                    <?php endforeach; ?>
                </ul>
                <!--<a class="btn-block" href="#">Voir les produits</a>-->
        </div>
        <?php endif ?>

        <?php if ( isset( $this->object['ingredientProducts'] ) && $this->object['ingredientProducts'] ): ?>
    	<div class="block">
    		<h3>Produits de la recette</h3>
    		<ul>
                <?php 
                foreach( $this->iterate( $this->object['ingredientProducts'] ) as $productId ): ?>
                <?php
                $product = new Product(intval( $productId ), true, 2);
                ?>
    			<li><a href="/mm/product.php?id_product=<?php echo $productId; ?>"><?php echo $product->name ?></a></li>
                <?php endforeach ?>
    		</ul>
    	</div>
        <?php endif ?>

        <?php if ( isset( $this->object['toolProducts'] ) && $this->object['toolProducts'] ): ?>
    	<div class="block">
    		<h3>Outils recommandés</h3>
    		<ul>
                <?php 
                foreach( $this->iterate( $this->object['toolProducts'] ) as $productId ): ?>
                <?php
                $product = new Product(intval( $productId ), true, 2);
                ?>
    			<li><a href="/mm/product.php?id_product=<?php echo $productId; ?>"><?php echo $product->name ?></a></li>
                <?php endforeach ?>
    		</ul>
    	</div>
        <?php endif ?>

        <?php if ( isset( $this->object['tools'] ) && $this->object['tools'] ): ?>
    	<div class="block">
    		<h3>Outils nécessaires</h3>
    		<ul>
                <?php 
                foreach( $this->iterate( $this->object['tools'] ) as $tool ): ?>
                <?php
                ?>
    			<li>
                    <?php $this->e( $tool ) ?>
                </li>
                <?php endforeach ?>
    		</ul>
    	</div>
        <?php endif ?>

        <!--
        <div class="block">
                <h3>Produits de la recette</h3>
                -
                <a class="btn-block" href="#">Voir les produits</a>
        </div>
        <div class="block">
                <h3>Id&eacute;es recette</h3>
                -
                <a class="btn-block" href="#">Voir les produits</a>
        </div>
        -->
</div>

<?php echo $this->comments ?>

<!--
<a href="<?php echo $this->url( 'recipe.edit', $this->object ) ?>">edit</a>
-->
