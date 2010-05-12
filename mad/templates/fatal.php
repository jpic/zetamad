<style>
#center_column { padding:0; width:990px; }
h2.fatalInformation { color: #000000; font-family:'Times','Helvetica',serif; font-size:35px; font-weight:100; line-height:40px; padding-bottom: 5px; margin: 15px 0 15px 0; border-bottom: 1px solid #dadada; }
p, li { font-size: 12px; line-height: 25px; font-family: Lucida, "Lucida Sans", Arial, sans-serif; }
</style>

<div id="center_column">

    <?php if ( isset( $_SESSION['fatalMessage'] ) ): ?>
    <h2 class="fatalInformation"><?php $this->e( $_SESSION['fatalMessage'] ) ?></p>
    <?php endif ?>
    
    <ul class="fatalSolutions">
        <li>
            Etes-vous arrivé sur cette page par hasard?
            <?php if ( $this->request->referrer ): ?>
            <a href="<?php echo $this->request->referrer ?>">Vous pouvez cliquer ici pour revenir en arriere</a>
            <?php else: ?>
            Vous pouvez utiliser le menu de navigation pour visiter le site.
            <?php endif ?>
        </li>
    <?php if ( isset( $_SESSION['fatalSolutions'] ) && count( $_SESSION['fatalSolutions'] ) ): ?>
        <?php foreach( $_SESSION['fatalSolutions'] as $solution ): ?>
        <li><?php $this->e( $solution ) ?></li>
        <?php endforeach ?>
    <?php endif ?>
    </ul>
    
    <p>Si vous voyez cette page plusieures fois, merci d'informer notre service technique <a style="color: #DE5161;" href="/contact-form.php" rel="nofollow">en cliquant sur ce lien</a>.</p>
    <p>Veuillez nous excuser pour la g&ecirc;ne occasionn&eacute;e.</p>

</div>
<!--end #center_column-->
