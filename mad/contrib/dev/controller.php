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
}

?>
