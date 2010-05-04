<?php

class madCommentsView extends madView {
    public function createZones( $layout ) {
        $zones = array(  );

        if ( isset( $this->result->variables['object'] ) ) {
            $zones[] = new madViewHandler( 'comments', $this->getTemplatePath( 'comments.php', 'comments' ) );
        }

        return $zones;
    }
}

?>
