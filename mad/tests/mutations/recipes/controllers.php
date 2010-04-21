<?php

/**
 * @package MadModel
 * @subpackage Tests
 */
class controller001 {
    private $model = null;
    
    const RECIPE_NAMESPACE = 'recipes';
    
    public function __construct( $model ) {
        $this->model = $model;
    }
    public function createRecipe( array $recipe ) {
        $data = new madObject( $recipe );
        $data['namespace'] = self::RECIPE_NAMESPACE;
        return $this->model->save( $data );
    }
    public function listRecipes(  ) {
        $data = new madObject();
        $data['namespace'] = self::RECIPE_NAMESPACE;
        return $this->model->search( $data );
    }
    public function listRecipesOfCategory( string $category ) {
        $data = new madObject();
        $data['category']  = $category;
        $data['namespace'] = self::RECIPE_NAMESPACE;
        return $this->model->search( $data );
    }
}

/**
 * @package MadModel
 * @subpackage Tests
 */
class controller002 extends controller001 {
    const INGREDIENT_NAMESPACE = 'ingredients';

    public function createIngredient( array $ingredient ) {
        $data = new madObject( $ingredient );
        $data['namespace'] = self::INGREDIENT_NAMESPACE;
        return $this->model->save( $data );
    }

    /**
     * Should list all ingredients, including those created by the recipes in 
     * controller001 and those created in createIngredient method of 
     * controller002.
     */
    public function listIngredients() {
        $data = new madObject();
        $data['namespace'] = self::INGREDIENT_NAMESPACE;
        return $this->model->search( $data );
    }
}

/**
 * @package MadModel
 * @subpackage Tests
 */
class controller003 extends controller002 {
    public function listIngredientsWithRecipe(  ) {

    }
    public function listIngredientsWithoutRecipes(  ) {

    }
}

?>
