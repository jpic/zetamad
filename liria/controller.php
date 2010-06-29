<?php
class madProjectController extends madModelController {
    public function doTagDetails() {
        // details action for the category
        $this->doDetails();

        if ( empty( $this->result->variables['object'] ) ) {
            return;
        }

        $tag = $this->result->variables['object'];

        // list action for recipes
        $this->doList();

        // ugly hack to add category to breadcrumb
        $this->result->variables['breadcrumbHack'] = sprintf( '<a href="%s" title="%s">%s</a>',
            madFramework::url( 'tag.details', $tag ),
            ucfirst( $tag['name'] ),
            ucfirst( $tag['name'] )
        );

        $this->result->variables['metaTitle'] = "Recettes du tag " . $tag['name'];
    }

    public function doTagListDelete() {
        // select all recipe_tag that are related to a tag to delete
        $sql = sprintf( 
            'select id from recipe_tag where tag in ( %s ) ',
            implode( ', ', $this->ids )
        );
        $rows = madFramework::query( $sql );
        
        $ids = array();
        foreach( $rows as $row ) {
            $ids[] = $row['id'];
        }
        
        // delete the recipe_tags
        madFramework::delete( 'recipe_tag', $ids );

        // delete the actual tags
        $this->doListDelete();
    }
}
?>
