<?php $this->includeOnceTemplate( 'recipe.header.php' ) ?>

<h2>Recettes du tag <?php $this->e( $this->object['name'] ) ?></h2>

<?php
$this->includeTemplate( 'recipe.list.php' );
?>
