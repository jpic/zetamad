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
        $this->result->variables['recipes'] = madFramework::query( 'select recipe.id, recipe.title, recipe.slug, profile.name as profile_name, profile.slug as profile_slug, recipePicture.picture, recipePicture.title as recipe_picture, profile.slug as profile_slug, profile.name as profile_name from recipe left join profile on recipe.profile = profile.id left join recipePicture on recipePicture.recipe = recipe.id where status = "validated" group by recipe.id order by recipe.updated desc limit 0, 6' );
        $this->result->variables['profiles'] = madFramework::query( 'select * from profile where status = "validated" order by updated desc limit 0, 6' );
        
        $rows = madFramework::query( 'select count(id) from profile where status = "validated"' );
        $this->result->variables['profileCount'] = isset( $rows[0] ) ? current( $rows[0] ) : '0';
        
        $rows = madFramework::query( 'select count(id) from recipe where status = "validated"' );
        $this->result->variables['recipeCount'] = isset( $rows[0] ) ? current( $rows[0] ) : '0';
    }

    public function doForm(  ) {
        if ( isset( $this->id ) )  {
            // edit mode
            $this->mergePersistentData();

            // contributors can only edit theirs
            if ( $this->user['role'] !== 'administrator' && $this->user['id'] != $this->persistentData['profile'] ) {
                $this->controllers['authentication']->doRoleError();
                return;
            }

            // load tags
            $q = $this->framework->pdo->prepare( 'select tag.name from recipe_tag left join tag on recipe_tag.tag = tag.id where recipe_tag.recipe = :id' );
            $q->setFetchMode( PDO::FETCH_COLUMN, 0 );
            $q->execute( array( 'id' => $this->id ) );
            $this->result->variables['tags'] = $q->fetchAll();
        } else {
            $this->result->variables['tags'] = array();
        }

        if ( $this->user['role'] !== 'administrator' ) {
            $this->formConfiguration['status']['value'] = 'new';
        }

        if ( $this->request->protocol == 'http-post' ) {
            $this->mergeRequestData(  );

            if ( empty( $this->request->variables['recipe_recipe']['profile'] ) ) {
                $profile = madProfileController::getOrCreateProfile();
                $this->formConfiguration['profile']['value'] = $profile['id'];
            }

            $this->process(  );

            if ( $this->isValid ) {
                $this->save(  );

                // delete all relations to tags
                $q = $this->framework->pdo->prepare( 'select id from recipe_tag where recipe = :id' );
                $q->setFetchMode( PDO::FETCH_COLUMN, 0 );
                $q->execute( array( 'id' => $this->processedData['id'] ) );
                $ids = $q->fetchAll();
                if ( $ids ) {
                    madFramework::delete( 'recipe_tag', $ids );
                }

                // get or create all tags
                $tags = array(  );
                foreach( explode( ',', $this->request->variables['tags'] ) as $tagName ) {
                    $tagName = trim( $tagName );

                    if ( !strlen( $tagName ) ) {
                        continue;
                    }

                    $rows = madFramework::query( 'select id from tag where name = :name', array( 'name' => $tagName ) );
                    if ( ! count( $rows ) ) {
                        // create
                        $tag = array( 
                            'namespace' => 'tag',
                            'name'      => $tagName,
                            'slug'      => madFramework::slugify( $tagName ),
                        );
                        madModelController::saveArray( $tag );
                        $tags[] = $tag['id'];
                    } else {
                        // fetch id
                        $tags[] = $rows[0]['id'];
                    }
                }
                
                // add relations to tags
                foreach( $tags as $tagId ) {
                    $relation = array( 
                        'namespace' => 'recipe_tag',
                        'recipe'    => $this->processedData['id'],
                        'tag'       => $tagId,
                    );
                    madModelController::saveArray( $relation );
                }


                // remove orphan tags
                $queries = array(
                    'delete from tag_name where id not in (select value from recipe_tag_tag)',
                    'delete from tag_slug where id not in (select value from recipe_tag_tag)',
                    'delete from tag where id not in (select value from recipe_tag_tag)',
                );
                foreach( $queries as $query ) {
                    $this->framework->pdo->query( $query );
                }
            }
        } else {
            $this->process(  );
        }
    }

    public function doListDelete() {
        // select all recipe_tag that are related to a tag to delete
        $sql = sprintf(
            'select id from recipeStep where recipe in ( %s ) ',
            implode( ', ', $this->ids )
        );
        $rows = madFramework::query( $sql );

        $ids = array();
        foreach( $rows as $row ) {
            $ids[] = $row['id'];
        }

        // delete the recipe_tags
        madFramework::delete( 'recipeStep_recipe', $ids );

        // delete the actual tags
        $this->doListDelete();
    }
}

?>
