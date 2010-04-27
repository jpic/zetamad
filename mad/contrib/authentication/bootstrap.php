<?php
$registry = madRegistry::instance();

class madAuthentication {
    static public function setRequestUser( ezcMvcRequest $request ) {
        $configuration = madRegistry::instance(  )->configuration->settings['applications']['authentication'];

        foreach( $configuration['backends'] as $backendClass ) {
            $backend = new $backendClass( $username, $password );
        }
    }
}

$registry->signals->connect( 'requestParsed', array( 'madAuthentication', 'setRequestUser' ) );
?>
