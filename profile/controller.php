<?php
class madProfileController extends madModelController {
    public function doEditMine() {
        $profile = self::getOrCreateProfile();
        $this->routeRedirect( 'profile.edit', $profile );
    }

    public function doForm() {
        if ( isset( $this->id ) )  {
            // edit mode
            if ( !$this->mergePersistentData() ) {
                return;
            }

            if ( $this->user['role'] !== 'administrator' ) {
                if ( $this->user['id'] != $this->persistentData['user'] ) {
                    return $this->doRoleError( 'notYourProfile' );
                }

                $this->formConfiguration['user']['value'] = $this->user['id'];
                unset( $this->formConfiguration['user']['widget'] );
                $this->formConfiguration['status']['value'] = 'new';
                unset( $this->formConfiguration['status']['widget'] );
            }
        }

        if ( $this->request->protocol == 'http-post' ) {
            $this->mergeRequestData(  );
            $this->process(  );

            if ( $this->isValid ) {
                $this->save(  );
            }
        } else {
            $this->process(  );
        }
    }

    public static function getOrCreateProfile() {
        $framework = madFramework::instance();
        $profiles = madFramework::query( 'select * from profile where user = :id', $framework->request->variables['user'] );
        if ( count( $profiles ) ) {
            return $profiles[0];
        } else {
            $profile = array(
                'namespace' => 'profile',
                'name' => "{$framework->request->variables['user']['firstName']} {$framework->request->variables['user']['lastName']}",
                'user' => $framework->request->variables['user']['id'],
                'created' => date( 'Y-m-d' ),
            );
            $profile['slug'] = madFramework::slugify( $profile['name'] );
            madModelController::saveArray( $profile );
            return $profile;
        }
    }
}
?>
