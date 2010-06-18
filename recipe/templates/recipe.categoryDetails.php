<?php $this->includeOnceTemplate( 'recipe.header.php' ) ?>

<h2>Recettes de la catégorie <?php $this->e( $this->object['title'] ) ?></h2>

<?php
$this->includeTemplate( 'recipe.list.php' );
?>
