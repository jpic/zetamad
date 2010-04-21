<h1>Page de details d'object par défaut</h1>

Pour surcharger cette page, créer un template du nom de <?php echo $this->object['namespace'] ?>_details.php et utiliser $this->object dedans.

<?php

var_dump( $this->object );

?>
