<?php if ( isset( $_SESSION['fatalMessage'] ) && $_SESSION['fatalSolutions'] ): ?>
<p class="fatalInformation"><?php $this->e( $_SESSION['fatalMessage'] ) ?></p>
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

<h2>Faire un formlaire pour rassurer le visiteur ici?</h2>
