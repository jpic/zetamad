<style>
#center_column { padding-left: 9px !important; width:780px !important; float: left !important;}
h2.title { color: #000000; font-family:'Times','Helvetica',serif; font-size:35px; font-weight:100; line-height:40px; padding-bottom: 5px; margin: 15px 0 15px 0; border-bottom: 1px solid #dadada; }
h3 { color: #DE5161; font-size: 14px; padding: 0; margin: 0; line-height: 18px; }
.UIListingProfils, p, li { font-size: 12px; line-height: 25px; font-family: Lucida, "Lucida Sans", Arial, sans-serif; }
.UIListingProfils { border-bottom:1px solid #dadada; margin-bottom:6px; padding-bottom:6px; overflow: auto; }
.UIListingProfils .UIListingProfils_pic { width: 150px; height: 150px; float: left; }
.UIListingProfils .UIListingProfils_pic img { vertical-align: bottom; }
.UIListingProfils .UIListingProfils_infos { float: left; width: 500px; margin-left: 20px; }
.UIListingProfils a.plus { color: #DE5161; margin: 0 5px; }
.UIListingProfils a.plus:hover { color: #000; }
.UIListingProfils .UIListingProfils_actions { float: right; width: 200px; margin-left: 20px; }
.UIListingProfils .UIListingProfils_actions .tab { border-bottom:1px solid #dadada; margin-bottom:6px; padding-bottom:6px; }
.UIListingProfils .UIListingProfils_actions .tab ul { list-style: none; margin: 5px 0; padding: 0; }
.UIListingProfils .UIListingProfils_actions .tab ul li { line-height: 20px; }
.UIListingProfils .UIListingProfils_actions .tab ul li a { text-decoration: none; color: #000; }
.UIListingProfils .UIListingProfils_actions .tab ul li a:hover { text-decoration: underline; color: #DE5161; }
/* .clear : allready in globall.css */
.clear { clear: both; }
/* afficher la colone de droite */
#left_column { display: block !important; }

.profil_block { margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #dadada; clear: both; margin-bottom: 15px; }
.profil_block .thumb { width: 206px; height: 206px; padding: 3px; float: left; }
.profil_block .thumb img { vertical-align: bottom; }
.profil_block .description { float: left; width: 564px;}
.profil_block .description p { font-family: Verdana; font-size: 11px; line-height: 18px; color: #666666; }
.profil_block .description h3 { color: #de5161; font-size: 22px; padding-bottom: 7px; font-family: Times; }
.profil_block .btn { margin-top: 10px; clear: right; float: right; text-align: center; width: 140px; background: #c0c0c0; line-height: 20px; height: 23px; }
.profil_block .btn a { color: #fff; font-size: 11px; font-family: Verdana; text-transform: uppercase; }
.clear { clear: both; }
/* afficher la colone de droite */
#left_column { display: block !important; }

.profil_block { margin-bottom: 15px; padding-bottom: 15px; border-bottom: 1px solid #dadada; clear: both; margin-bottom: 15px; }
.profil_block .thumb { width: 206px; height: 206px; padding: 3px; float: left; }
.profil_block .thumb img { vertical-align: bottom; }
.profil_block .description { float: left; width: 564px;}
.profil_block .description p { font-family: Verdana; font-size: 11px; line-height: 18px; color: #666666; }
.profil_block .description h3 { color: #ab3847; font-size: 18px; font-family: Times; }
.profil_block .btn { margin-top: 5px; clear: right; float: right; text-align: center; width: 140px; background: #c0c0c0; line-height: 20px; height: 23px; }
.profil_block .btn a { color: #fff; font-size: 11px; font-family: Verdana; text-transform: uppercase; }
.profil_block .btn a:hover { color: #000; text-decoration: none; }
</style>

<div class="breadcrumb">
	<a title="retour à Accueil" href="/">Accueil</a>
	<span class="navigation-pipe"><img alt="" src="/themes/mmarket/img/fleche.jpg"></span>
	Profils
</div>

<div id="center_column">
    <h2 class="title" style="margin-top: 5px;">Ils sont sur Madeleine Market</h2>
    <?php 
    $forLoop = 0;
    $last = count( $this->objectList ) - 1;
    foreach( $this->objectList as $object ):
    ?>
	<div class="profil_block" <?php if ( $forLoop == $last ): ?>style="border: 0;"<?php endif ?>>
		<div class="thumb">
			<a href="<?php echo $this->url( 'profile.details', $object ) ?>" title="<?php $this->e( $object['name'] ) ?>">
			<?php if ( isset( $object['picture'] ) ): ?>
            <img src="<?php echo $this->thumbnail( $object['picture'], 200, 200 ) ?>" width="200" height="200" alt="<?php $this->e( $object['name'] ) ?>" />	
          
            <?php endif ?>
            </a>
		</div>
		<div class="description">
			<h3><?php $this->e( $this->truncateWords( $object['name'], 80 ) ) ?></h3>
            <?php if ( isset( $object['introduction'] ) ): ?>
			<p>
                <?php $this->e( $this->truncateWords( $object['introduction'], 700 ) ) ?> 
			    <a href="<?php echo $this->url( 'profile.details', $object ) ?>" title="<?php $this->e( $object['name'] ) ?>">
                [...]
                </a>
			</p>
            <?php endif ?>
		</div>
		<div class="btn">
			<a href="<?php echo $this->url( 'profile.details', $object ) ?>" title="<?php $this->e( $object['name'] ) ?>">
            voir le profil
            </a>
		</div>
		<div class="clear"></div>
	</div>
    <?php
        $forLoop++;
    endforeach;
    unset( $last );
    unset( $forLoop );
    ?>
<?php
/*
    <?php foreach( $this->objectList as $object ): ?>
    <div class="UIListingProfils">
        <div class="UIListingProfils_pic">
            <?php if ( isset( $object['picture'] ) ): ?>
            <img src="<?php echo $this->thumbnail( $object['picture'], 150, 150 ) ?>" alt="<?php $this->e( $object['name'] ) ?>" />
            <?php endif ?>
        </div>
        <div class="UIListingProfils_infos">
            <h3><?php $this->e( $object['name'] ) ?></h3>
            <?php $this->e( $object['introduction'] ) ?> (<a href="<?php echo $this->url( 'profile.details', $object ) ?>" class="plus">Lire la suite...</a>).
        </div>
        <div class="UIListingProfils_actions">
          <div class="tab">
            &raquo; <a href="<?php echo $this->url( 'profile.details', $object ) ?>" class="plus">Voir son profil</a>
          </div>
            <!-- 
          <div class="tab">
            &raquo; <a href="" class="plus" id="UI_ShowLatestsRecipesProfil_1">Ses derni&egrave;res recettes</a>
            <ul style="display: none;" id="UI_LatestsRecipesProfil_1">
                <li>1. <a href="#">Saucisson frais &agrave;</a></li>
                <li>2. <a href="#">Creme brulee farcie de tomates</a></li>
                <li>3. <a href="#">Saucisson frais &agrave;</a></li>
                <li>4. <a href="#">Courgettes a la provencale</a></li>
            </ul>
          </div>
            -->
        </div>
    <!--IE hack floats-->
    <div class="clear"></div>
    <?php endforeach ?>
</div>
*/
?>
</div>
<!--end #center_column-->
</body>
