<?php

class madRecipeController extends madController {
    public function doRandom() {
        $rows = madFramework::query( 'select slug from recipe order by RAND() limit 0,1' );
        $recipe = current( $rows );
        $this->routeRedirect( 'recipe.details', $recipe );
    }
}

?>
