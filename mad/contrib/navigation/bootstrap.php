<?php
function prepareMenu( $template ) {
    if ( $template != 'navigation.php' ) {
        return;
    }

    $framework = madFramework::instance();

    $menu = array();

    foreach( $framework->configuration['routes'] as $routeName => $route ) {
        if ( empty( $route['navigation'] ) ) {
            continue;
        }

        $menu[$route['META']['application']][madFramework::url( $routeName )] = madFramework::translate( $routeName );
    }

    $framework->view->send( 'navigation', $menu );
}
$this->connectSignal( 'preIncludeTemplate', 'prepareMenu' );

?>
