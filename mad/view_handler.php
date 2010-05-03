<?php

class madViewHandler extends ezcMvcPhpViewHandler {
    public function generateUrl( $name, $arguments = array(  )) {
        $registry = madRegistry::instance();
        $prefix = $registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );
        return $prefix . $registry->router->generateUrl( $name, (array) $arguments );
    }

    public function getAbsoluteStaticUrl( $url ) {
        $registry = madRegistry::instance();
        $prefix = $registry->configuration->getSetting( 'core', 'dispatcher', 'prefix' );

        if ( substr( $url, 0, 1 ) != '/' ) {
            $url = '/' . $url;
        }

        //$oldMmarket = '/themes/mmarket';
        //if ( strpos( $url, $oldMmarket ) === 0 ) {
            //return $url;
        //}

        return $prefix . '/static' . $url;
    }

    public function getAbsoluteUploadUrl( $relativePath ) {
        $registry = madRegistry::instance();
        return $registry->configuration->getSetting( 'core', 'upload', 'url' ) . '/' . $relativePath;
    }

    public function e( $val ) {
        echo nl2br( stripslashes( htmlentities( $val, ENT_COMPAT, 'UTF-8' ) ) );
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
          $value= dump($value,-1);
        }
        elseif ($type=='boolean') $value= ($value?'true':'false');
        elseif ($type=='object')
        {
          $props= get_class_vars(get_class($value));
          echo '('.count($props).') <u>'.get_class($value).'</u>';
          foreach($props as $key=>$val)
          {
            echo "\n".str_repeat("\t",$level+1).$key.' => ';
            dump($value->$key,$level+1);
          }
          $value= '';
        }
        elseif ($type=='array')
        {
          echo '('.count($value).')';
          foreach($value as $key=>$val)
          {
            echo "\n".str_repeat("\t",$level+1).dump($key,-1).' => ';
            dump($val,$level+1);
          }
          $value= '';
        }
        echo " <b>$value</b>";
        if ($level==0) echo '</pre>';
    }
}

?>
