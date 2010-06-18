<?php $this->includeOnceTemplate( 'recipe.header.php' ) ?>

<div style="clear: both; padding-top: 0;" class="manufacturer-title">
    <h4>Recettes de la catégorie <?php $this->e( $this->object['title'] ) ?></h4>
    <div class="clear"></div>
</div>

<?php
$this->includeTemplate( 'recipe.list.php' );
?>
