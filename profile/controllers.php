<?php

class madProfileController extends madModelController {
    public function doDetails(  ) {
        $result = parent::doDetails(  );

        if ( $this->request->protocol == 'http-post' ) {
            mail( 
                $result->variables['object']['email'],
                'Contact par un visiteur de MadeleineMarket.com',
                $this->request->variables['message']
            );

            $result->variables['template'] = 'mail_sent.php';
        }

        return $result;
    }
}

?>
