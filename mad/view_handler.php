<?php

class madViewHandler extends ezcMvcPhpViewHandler {
    public $handlers = array(  );

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
}

?>
