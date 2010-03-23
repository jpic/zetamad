<?php

class madCoreDownloadController extends ezcMvcController {
    public function doDownload() {
        $configuration = madRegistry::instance(  )->configuration;

        $relativePath = substr( $this->request->uri, 7 );

        if( substr( $relativePath, -1 ) == '/' ) {
            $relativePath .= 'index.html';
        }

        $absolutePath = $configuration->getSetting( 'staticFiles', 'paths', $relativePath );
        $extension = substr(strrchr($absolutePath, '.'), 1);

        $ret = new ezcMvcResult;
        $ret->content = new ezcMvcResultContent;
        $ret->variables['absolutePath'] = $absolutePath;
        $ret->variables['fileRequest'] = true;
        switch( $extension ){
            case 'html':
                $ret->content->type = 'text/html';
                break;
            case 'js':
                $ret->content->type = 'text/javascript';
                break;
            case 'css':
                $ret->content->type = 'text/css';
                break;
        }
        $ret->content->disposition = new ezcMvcResultContentDisposition;
        //$ret->content->disposition->type = 'attachment';
        $ret->content->disposition->filename = basename( $relativePath );
        //$ret->content->disposition->creationDate = new DateTime( '1978-12-22' );

        return $ret;
    }
}

?>
