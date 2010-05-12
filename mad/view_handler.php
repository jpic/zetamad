<?php

class madViewHandler extends ezcMvcPhpViewHandler {
    public $handlers = array(  );

    public function thumbnail( $path, $newWidth, $newHeight, $force = false ) {
        $path = ENTRY_APP_PATH . '/upload/' . $path;
        $info = pathinfo( $path );

        $thumbnailName = sprintf( '%s_%sx%s_%s.%s',
            $info['filename'],
            $newWidth,
            $newHeight,
            $force,
            $info['extension']
        );

        $thumbnailPath = sprintf( '%s/%s/%s',
            ENTRY_APP_PATH,
            'upload',
            $thumbnailName
        );

        if ( file_exists( $thumbnailPath ) ) {
            return $this->getAbsoluteUploadUrl( $thumbnailName );
        }

        if ( !$src = @imageCreateFromJpeg( $path ) ) {
            if ( !$src = @imageCreateFromPng( $path ) ) {
                if ( !$src = @imageCreateFromGif( $path ) ) {

                }
            }
        }

        $tmpFile = tempnam( sys_get_temp_dir(  ), 'mad' );
        imagegd2( $src, $tmpFile );
        imagedestroy( $src );
        $src = imageCreateFromGd2( $tmpFile );

        switch( $info['extension'] ) {
            case 'jpg':
            case 'jpeg':
                $src = imagecreatefromjpeg( $path );
                break;
            case 'png':
                $src = imagecreatefrompng( $path );
                break;
            default:
                trigger_error( "Thumbnailing of " . $info['extension'] . " is not supported", E_USER_ERROR );
                break;
        }

        $oldWidth  = imageSX( $src );
        $oldHeight = imageSY( $src );
        
        if ( $oldWidth == $oldHeight ) {
            $newHeight = $newWidth;
        } elseif ( $force == 'height' || ( $force == 'ratio' && $oldWidth > $oldHeight ) ) {
            $newHeight = $oldHeight * ( $newHeight / $oldWidth );
        } elseif ( $force == 'width' || ( $force == 'ratio' && $oldWidth < $oldHeight ) ) {
            $newWidth = $oldWidth * ( $newWidth / $oldHeight );
        }

        $image = ImageCreateTrueColor(
            $newWidth,
            $newHeight
        );

        imagecopyresampled( 
            $image, 
            $src, 
            0,
            0,
            0,
            0,
            $newWidth,
            $newHeight,
            $oldWidth,
            $oldHeight
        );

        imagedestroy( $src );

        switch( $info['extension'] ) {
            case 'jpg':
            case 'jpeg':
                imagejpeg( $image, $thumbnailPath );
                break;
            case 'png':
                imagepng( $image, $thumbnailPath );
                break;
        }

        imagedestroy( $image );
        
        return $this->getAbsoluteUploadUrl( $thumbnailName );
    }
    public function url( $name, $arguments = array(  ) ) {
        $registry = madRegistry::instance();
        $prefix = $registry->configuration->getSetting( 'applications', 'mad', 'urlPrefix' );
        return $prefix . $registry->router->generateUrl( $name, (array) $arguments );
    }

    public function getAbsoluteUploadUrl( $relativePath ) {
        $registry = madRegistry::instance();
        return $registry->configuration->getSetting( 'applications', 'mad', 'uploadUrl' ) . '/' . $relativePath;
    }

    public function e( $val ) {
        echo nl2br( htmlentities( stripslashes( $val ), ENT_COMPAT, 'UTF-8' ) );
    }

    public function iterate( $value ) {
        if ( is_array( $value ) || ( $value instanceof madObject && !$value->isEntity ) ) {
            return $value;
        } else {
            return array( $value );
        }
    }

    public function includeTemplate( $template ) {
        include $template;
    }

    public function includeApplicationTemplate( $application, $template ) {
        $registry = madRegistry::instance();
        $applicationPath = $registry->configuration->getPathSetting( 'applications', $application, 'path' );
        include "$applicationPath/$template";
    }

    static public function dump( $value, $level = 0 ) {
        if ($level==-1)
        {
            $trans[' ']='&there4;';
            $trans["\t"]='&rArr;';
            $trans["\n"]='&para;;';
            $trans["\r"]='&lArr;';
            $trans["\0"]='&oplus;';
            return strtr(htmlspecialchars($value),$trans);
        }

        if ($level==0) echo '<pre>';
        $type= gettype($value);
        echo $type;
        if ($type=='string')
        {
          echo '('.strlen($value).')';
          $value= self::dump($value,-1);
        }
        elseif ($type=='boolean') $value= ($value?'true':'false');
        elseif ($type=='object')
        {
          $props= get_class_vars(get_class($value));
          echo '('.count($props).') <u>'.get_class($value).'</u>';
          foreach($props as $key=>$val)
          {
            echo "\n".str_repeat("\t",$level+1).$key.' => ';
            self::dump($value->$key,$level+1);
          }
          $value= '';
        }
        elseif ($type=='array')
        {
          echo '('.count($value).')';
          foreach($value as $key=>$val)
          {
            echo "\n".str_repeat("\t",$level+1).self::dump($key,-1).' => ';
            self::dump($val,$level+1);
          }
          $value= '';
        }
        
        echo " <b>$value</b>";
        if ($level==0) echo '</pre>';
    }

    public function __call( $method, $arguments ) {
        foreach( $this->handlers as $handler ) {
            if ( method_exists( $handler, $method ) ) {
                return call_user_func_array( array( $handler, $method ), $arguments );
            }
        }
    }

    public function getValueString( $array, $key ) {
        if ( !isset( $array[$key] ) ) {
            return '';
        }
        
        $value = $array[$key];

        if ( is_array( $value ) || $value instanceof Traversable ) {
            $value =  implode( ', ', (array)$value );
        } elseif ( is_bool( $value ) ) {
            $value = $value ? 'Oui' : 'Non';
        }

        if ( strlen( $value ) > 100 ) {
            $value = substr( $value, 0, 100 );
        }

        return $value;
    }
    public function t( $key, $context = null ) {
        return madRegistry::instance(  )->locale->getMessageSetting( 
            $key,
            $this->request->accept->languages,
            $context
        );
    }
}

?>
