<?php 
foreach( $this->objectList as $object ):
    if ( isset( $object[$this->displayAttribute] ) && isset( $object[$this->valueAttribute ] ) ):
        echo $object[$this->displayAttribute] . '|' . $object[$this->valueAttribute];
    endif;
endforeach;
?>
