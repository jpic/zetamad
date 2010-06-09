<?php

class madDownloadController extends madController {
    public function doDownload() {
        $configuration = madFramework::instance(  )->configuration;

        $relativePath = $this->request->variables['path'];

        if( substr( $relativePath, -1 ) == '/' ) {
            $relativePath .= 'index.html';
        }
        $absolutePath = $configuration->getPathSetting( 'staticFiles', 'paths', $relativePath );
        $extension = substr(strrchr($absolutePath, '.'), 1);

        $this->result->content->disposition = new ezcMvcResultContentDisposition;
        $this->result->variables['serveFile'] = $absolutePath;
        switch( $extension ){
            case 'html':
                $this->result->content->type = 'text/html';
                break;
            case 'js':
                $this->result->content->type = 'text/javascript';
                break;
            case 'css':
                $this->result->content->type = 'text/css';
                break;
            case 'tbz2':
                $this->result->content->disposition->type = 'attachment';
                $this->result->content->type = 'application/x-tar';
        }
        $this->result->content->disposition->filename = basename( $relativePath );
        //$this->result->content->disposition->creationDate = new DateTime( '1978-12-22' );
    }
}


?>
