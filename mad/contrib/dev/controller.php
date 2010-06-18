<?php

class madDevController extends madController {
    public function doSql(  ) {
        $pdo = madFramework::instance(  )->pdo;

        if ( $this->request->protocol == 'http-post' ) {
            $sql = $this->request->variables['sql'];

            $req = $pdo->prepare( $sql );
            // dont cache the test query!!
            unset( $pdo->queryCache[$sql] );
            $this->result->variables['newSql'] = $req->queryString;

            $req->execute(  );
            $this->result->variables['rows'] = $req->fetchAll( PDO::FETCH_ASSOC );
        }
    }

    public function doRoutes() {
        $this->result->variables['routes'] = $this->framework->configuration['routes'];
    }

    public function doCache() {
        $functions = array(
            'refreshTemplates',
            'refreshStatic',
            'refreshLocale',
            'refreshConfiguration',
            'refreshPdo',
            'refreshAutoload',
        );

        $this->result->variables['functions'] = $functions;

        $writeIni = false;
        $ini = ENTRY_APP_PATH . '/etc/applications.ini';
        $contents = file_get_contents( $ini );

        if ( $this->request->protocol != 'http-post' ) {
            return;
        }

        foreach( $functions as $function ) {
            $once = !empty( $this->request->variables[$function . 'Once'] );
            $enable = !empty( $this->request->variables[$function . 'Enable'] ) || !empty( $this->request->variables[$function] );
            $disable = !empty( $this->request->variables[$function . 'Disable'] ) && empty( $this->request->variables[$function] );

            $enabled = !empty( $this->framework->configuration['applications']['mad'][$function] );

            if ( $once ) {
                $this->framework->$function();
            }

            if ( $enable && !$enabled ) {
                $writeIni = true;
                $contents = str_replace( $function . '=false', $function . '=true', $contents );
            }

            if ( $disable && $enabled ) {
                $writeIni = true;
                $contents = str_replace( $function . '=true', $function . '=false', $contents );
            }
        }

        if ( $writeIni ) {
            file_put_contents( $ini, $contents );
            $this->framework->refreshConfiguration();
        }
    }
}
