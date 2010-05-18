<style>
#center_column { padding:0; width:990px; }
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
</style>
<script>
$(document).ready( function() {
    $("#UI_ShowLatestsRecipesProfil_1").click(function(){$("#UI_LatestsRecipesProfil_1").slideDown("fast");  }); 
}); 
</script>

<div class="breadcrumb">
	<a title="retour à Accueil" href="/">Accueil</a>
	<span class="navigation-pipe"><img alt="" src="/themes/mmarket/img/fleche.jpg"></span>
	Profils
</div>

<div id="center_column">
    <h2 class="title">Liste des chefs</h2>
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
</div>
<!--end #center_column-->
</body>
