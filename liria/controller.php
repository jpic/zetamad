<?php
class madProjectController extends madModelController {
    public function doTagDetails() {
        // details action for the category
        $this->doDetails();
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
}
?>
