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

    public function doIndex() {
        $this->result->variables['categories'] = madFramework::query( 'select * from recipeCategory' );
        $this->result->variables['tags'] = madFramework::query( 'select * from tag' );
        $this->result->variables['recipes'] = madFramework::query( 'select recipe.*, profile.* from recipe left join profile on recipe.profile = profile.id order by updated desc limit 0, 6' );
        $this->result->variables['profiles'] = madFramework::query( 'select * from profile order by updated desc limit 0, 6' );
        
        $rows = madFramework::query( 'select count(id) from profile' );
        $this->result->variables['profileCount'] = current( $rows[0] );
        
        $rows = madFramework::query( 'select count(id) from recipe' );
        $this->result->variables['recipeCount'] = current( $rows[0] );
    }
}

?>
