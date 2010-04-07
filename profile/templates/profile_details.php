<style>
/*Init 100%*/
#center_column { width: 980px; padding: 0; }
#center_column a { text-decoration: none;}
#left_column, .breadcrumb { display: none; }

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
.recipe .author-left #external-links ul li a:hover { font: bold 11px Verdana; color: #232323; }

.recipe .author-right { float: right; width: 450px; border-top: 1px solid #dadada; padding: 9px 0;}
.recipe .author-right h2 { color: #969696; font-size: 30px; font-family: Times, Georgia, Arial; font-weight: normal; }
.recipe .author-right h3, .recipe .author-left #external-links h3 { color: #969696; font-size: 24px; font-family: Times, Georgia, Arial; font-weight: normal; padding-bottom: 5px; border-bottom: 1px solid #dadada; margin-top: 20px; }
.recipe .author-right .author-intro, .recipe .author-right .author-profil { text-align: justify; margin-top: 10px; font-family: Verdana; font-size: 11px; color: #969696; word-spacing: 0.5px; line-height: 18px;}

.recipe .author-left .recipe-author, .recipe .author-right .recipe-description { margin-top: 40px; }
.recipe .author-left .recipe-author .author-name, .recipe .author-right .recipe-title-steps { font-size: 18px; color: #969696; font-family: Times; border-bottom: 1px solid #dadada; margin-bottom: 7px; padding-bottom: 7px; }
.recipe .author-left .recipe-author .author-photo { float: left; margin-right: 7px; margin-bottom: 2px; border: 1px solid #dadada; vertical-align: bottom; width: 87px; height: 87px; }
.recipe .author-left .recipe-author .author-description { line-height: 19px; font-size: 11px; color: #969696; font-family: Verdana; text-align: justify;}


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

<div class="recipe">
	<div class="author-left">
		<div id="author-photo">
			<img src="http://www.blobidesign.com/other/mmhome/img/avatar-mrbean.jpg" alt="recette X" height="260" width="260" />
			<p class="share">
				<a href="#">
					<img src="http://www.madeleinemarket.com/themes/mmarket/img/lg-bookmark-mm.gif" />
				</a>
			</p>
		</div>
        <?php if ( isset( $this->object['sites'] ) ): ?>
		<div id="external-links">
			<h3>Moi sur la toile...</h3>
			<ul>
                <?php foreach( $this->object['sites'] as $site ): ?>
				<li><a href="http://<?php echo $site ?>"><span style="color: #232323;">&bull;</span> <?php echo $site ?></a></li>
                <?php endforeach ?>
			</ul>
		</div>
        <?php endif ?>
	</div>
	<div class="author-right">
			<h2><?php echo htmlentities( $this->object['name'] ) ?></h2>
			<p class="author-intro">
                <?php echo htmlentities( $this->object['introduction'] ) ?>
			</p>
			<h3>Profil</h3>
			<p class="author-profil">
                <?php echo htmlentities( $this->object['presentation'] ) ?>
			</p>
	</div>
</div>

<div id="recipe-column">
	<div class="block">
		<p class="title-setmsg">&Agrave; <?php echo htmlentities( $this->object['name'] ) ?> :</p>
		<textarea class="msg-author">Votre message</textarea>
		<a class="btn-block" href="#">Envoyer</a>
	</div>
    <?php if ( isset( $this->object['products'] ) ): ?>
	<div class="block">
		<h3>Produits favoris</h3>
		<ul>
            <?php foreach( $this->object['products'] as $productId ): ?>
			<li><a href="#"><?php echo $productId ?></a></li>
            <?php endforeach ?>
		</ul>
	</div>
    <?php endif ?>
</div>
