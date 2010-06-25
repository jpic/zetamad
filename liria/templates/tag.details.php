<?php $this->includeOnceTemplate( 'recipe.header.php' ) ?>

<div style="clear: both; padding-top: 0;" class="manufacturer-title">
    <h4>Recettes du tag <?php $this->e( $this->object['name'] ) ?></h4>
    <div class="clear"></div>
</div>

<?php
$this->includeTemplate( 'recipe.list.php' );
?>
