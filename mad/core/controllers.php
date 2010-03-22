<?php

class madCoreDownloadController extends ezcMvcController {
    public function doDownload() {
        $configuration = madRegistry::instance(  )->configuration;
        $relativePath = substr( $this->request->uri, 7 );

        if( substr( $relativePath, -1 ) == '/' ) {
            $relativePath .= 'index.html';
        }

        $absolutePath = $configuration->getSetting( 'staticFiles', 'paths', $relativePath );

        $ret = new ezcMvcResult;
        //$ret->content = new ezcMvcResultContent;
        //$ret->content->type = 'application/x-pdf';
        //$ret->content->disposition = new ezcMvcResultContentDisposition;
        //$ret->content->disposition->type = 'attachment';
        //$ret->content->disposition->filename = basename( $relativePath );
        //$ret->content->disposition->creationDate = new DateTime( '1978-12-22' );
        $ret->variables['absolutePath'] = $absolutePath;
        $ret->variables['fileRequest'] = true;
        return $ret;
    }
}

?>
