<?php

class madRecipeController extends madModelController {
    public function doRandom() {
        $rows = madFramework::query( 'select slug from recipe order by RAND() limit 0,1' );
        $recipe = current( $rows );
        $_SESSION['recipe.random'] = true;
        $this->routeRedirect( 'recipe.details', $recipe );
    }

    public function doCategoryDetails() {
        // details action for the category
        $this->doDetails();
        $category = $this->result->variables['object'];

        // list action for recipes
        $this->doList();

        // ugly hack to add category to breadcrumb
        $this->result->variables['breadcrumbHack'] = sprintf( '<a href="%s" title="%s">%s</a>',
            madFramework::url( 'recipe.categoryDetails', $category ),
            ucfirst( $category['title'] ),
            ucfirst( $category['title'] )
        );
    }
}

?>
