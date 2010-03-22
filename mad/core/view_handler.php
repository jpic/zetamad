<?php

class madCoreViewHandler extends ezcMvcPhpViewHandler {
    public function generateUrl( $name, array $arguments = array(  ) ) {
        $registry = madRegistry::instance();
        $prefix = $registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );
        return $prefix . $registry->router->generateUrl( $name, $arguments );
    }

    public function getAbsoluteStaticUrl( $url ) {
        if ( substr( $url, 0, 1 ) != '/' ) {
            $url = '/' . $url;
        }

        //$oldMmarket = '/themes/mmarket';
        //if ( strpos( $url, $oldMmarket ) === 0 ) {
            //return $url;
        //}

        return '/static' . $url;
    }
}

?>
