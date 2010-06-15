<?php
include '../entry_bootstrap.php';

$map = array();
$categoryMap = array();

$users = include 'users.php';
foreach( $users as $key => $user ) {
    $uuid = $user['id'];
    $user = ( array ) $user;
    unset ( $user['id'] );

    madModelController::saveArray( $user );
    
    $map[$uuid] = $user;
}

$profiles = include 'profiles.php';
foreach( $profiles as $key => $profile ) {
    $profile = ( array ) $profile;
    $uuid = $profile['id'];
    unset ( $profile['id'] );
    $profile['slug'] = madFramework::slugify( $profile['name'] );
    
    $sites = is_string( $profile['sites'] ) ? array( $profile['sites'] ) : $profile['sites'];
    unset( $profile['sites'] );

    if ( isset( $profile['products'] ) ) {
        $products = is_string( $profile['products'] ) ? array( $profile['products'] ) : $profile['products'];
        unset( $profile['products'] );
    } else {

        $products = array(  );
    }

    madModelController::saveArray( $profile );


    foreach( $products as $product ) {
        if ( !is_numeric( $product ) ) {
            continue;
        }

        madFramework::query(
            'insert into profileProduct set product = :product, profile = :profile',
            array(
                'product' => $product,
                'profile' => $profile['id'],
            )
        );
    }

    foreach( $sites as $site ) {
        madFramework::query(
            'insert into profileSite set site = :site, profile = :profile',
            array( 
                'site' => $site,
                'profile' => $profile['id'],
            )
        );
    }
    
    $map[$uuid] = $profile;
}

$recipes = include 'recipes.php';
foreach( $recipes as $uuid => $recipe ) {
    $recipe['profile'] = $map[$recipe['profile']['id']]['id'];

    $recipeCopy = $recipe;
    foreach( array( 
        'toolProducts',
        'tools',
        'ingredientQuantities',
        'ingredientProducts',
        'otherPictures',
        'tags',
        'picture',
        'category',
        'recipeSteps',
        'id',
    ) as $unst ) {
        unset( $recipeCopy[$unst] );
    }

    var_dump( $recipeCopy );
    madModelController::saveArray( $recipeCopy );

    if ( !empty( $recipe['picture'] ) ) {
        $insert = array( 
            'recipe'    => $recipeCopy['id'],
            'picture'   => $recipe['picture'],
            'sortkey'   => '0',
            'title'     => '',
            'namespace' => 'recipePicture',
        );
        madModelController::saveArray( $insert );
    }

    if ( !empty( $recipe['category'] ) ) {
        $recipe['category'] = strtolower( $recipe['category'] );
        if (strlen($recipe['category']) > 50) {
            $recipe['category'] = 'dessert';
        }
        if ( strlen( trim( $recipe['category'] ) ) > 0 ) {
            if ( in_array( $recipe['category'], array_keys($categoryMap) ) ) {
                $category = $categoryMap[$recipe['category']];
            } else {
                $insert = array(
                    'namespace' => 'recipeCategory',
                    'title'     => $recipe['category'],
                    'slug'      => madFramework::slugify( $recipe['category'] ),
                );
                madModelController::saveArray( $insert );
                $category = $insert['id'];
                $categoryMap[$recipe['category']] = $category;
            }
    
            $insertRelation = array(
                'namespace'      => 'recipe_recipeCategory',
                'recipe'         => $recipeCopy['id'],
                'recipeCategory' => $category,
            );
            madModelController::saveArray( $insertRelation );
        }
    }

    if ( !empty( $recipe['recipeSteps'] ) ) {
        $steps = isset( $recipe['recipeSteps']['namespace'] ) ? array( $recipe['recipeSteps'] ) : $recipe['recipeSteps'];
        foreach( $steps as $step ) {
            $insert = array(  
                'recipe'      => $recipeCopy['id'],
                'title'       => !empty( $step['title'] ) ? $step['title'] : '',
                'description' => $step['description'],
                'namespace'   => 'recipeStep',
            );
            madModelController::saveArray( $insert );
        }
    }

    if ( !empty( $recipe['ingredientQuantities'] ) ){
        $ingredientQuantities = isset( $recipe['ingredientQuantities']['namespace'] ) ? array( $recipe['ingredientQuantities'] ) : $recipe['ingredientQuantities'];
        foreach( $ingredientQuantities as $ingredientQuantity ) {
            $insert = array( 
                'recipe'     => $recipeCopy['id'],
                'ingredient' => $ingredientQuantity['ingredient'],
                'namespace'  => 'recipeIngredientQuantity',
            );
            if ( !empty( $ingredientQuantity['quantity'] ) ) 
                $insert['quantity']  = $ingredientQuantity['quantity'];

            madModelController::saveArray( $insert );
        }
    }

    if ( !empty( $recipe['tools'] ) ) {
        $tools = is_string( $recipe['tools'] ) ? array( $recipe['tools'] ) : $recipe['tools'];
        foreach( $tools as $tool ) {
            $insert = array( 
                'recipe'    => $recipeCopy['id'],
                'name'      => $tool,
                'namespace' => 'recipeTool',
            );
            madModelController::saveArray( $insert );
        }
    }

    if ( !empty( $recipe['ingredientProducts'] ) ){
        $ingredientProducts = is_string( $recipe['ingredientProducts'] ) ? array( $recipe['ingredientProducts'] ) : $recipe['ingredientProducts'];
        foreach( $ingredientProducts as $product ) {
            $insert = array( 
                'recipe'    => $recipeCopy['id'],
                'product'   => $product,
                'namespace' => 'recipeIngredientProduct',
            );
            madModelController::saveArray( $insert );
        }
    }

    if ( !empty( $recipe['toolProducts'] )) {
        $toolProducts = is_string( $recipe['toolProducts'] ) ? array( $recipe['toolProducts'] ) : $recipe['toolProducts'];
        foreach( $toolProducts as $product ) {
            $insert = array( 
                'recipe'    => $recipeCopy['id'],
                'product'   => $product,
                'namespace' => 'recipeToolProduct',
            );
            madModelController::saveArray( $insert );
        }
    }
}

?>
