<?php

class madViewHandler extends ezcMvcPhpViewHandler {
    public $handlers = array(  );

    public function thumbnail( $path, $newWidth, $newHeight, $force = false ) { # {{{
        $uploadPath = ENTRY_APP_PATH . '/upload/' . $path;
        if ( !file_exists( $uploadPath ) ) {
            $registry = madFramework::instance(  );
            foreach( $registry->configuration['applications'] as $name => $application ) {
                $test = ENTRY_APP_PATH . '/' . $application['path'] . '/static/' . $path;

                if ( file_exists( $test ) ) {
                    copy( $test, $uploadPath );
                    break;
                }
            }
        }

        $info = pathinfo( $uploadPath );
        $path = $uploadPath;

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
    } # }}}
    public function url( $name, $arguments = array(  ) ) { # {{{
        $registry = madFramework::instance();
        $prefix = $registry->configuration->getSetting( 'applications', 'mad', 'urlPrefix' );
        return $prefix . $registry->router->generateUrl( $name, (array) $arguments );
    } # }}}
    public function getAbsoluteUploadUrl( $relativePath ) { # {{{
        $registry = madFramework::instance();
        return $registry->configuration->getSetting( 'applications', 'mad', 'uploadUrl' ) . '/' . $relativePath;
    } # }}}
    public function e( $val ) { # {{{
        echo nl2br( htmlentities( stripslashes( $val ), ENT_COMPAT, 'UTF-8' ) );
    } # }}}
    public function iterate( $value ) { # {{{
        if ( is_array( $value ) || ( $value instanceof madObject && !$value->isEntity ) ) {
            return $value;
        } else {
            return array( $value );
        }
    } # }}}
    public function includeTemplate( $template ) { # {{{
        include $template;
    } # }}}
    public function includeApplicationTemplate( $application, $template ) { # {{{
        $registry = madFramework::instance();
        $applicationPath = $registry->configuration->getPathSetting( 'applications', $application, 'path' );
        include "$applicationPath/$template";
    } # }}}
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
    } # }}}
    public function __call( $method, $arguments ) { # {{{
        foreach( $this->handlers as $handler ) {
            if ( method_exists( $handler, $method ) ) {
                return call_user_func_array( array( $handler, $method ), $arguments );
            }
        }
    } # }}}
    public function getValueString( $array, $key ) { # {{{
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
    } # }}}
    public function t( $key, $dictionnary = null, $contexts = array(  ) ) { # {{{
        $contexts = array_merge( $contexts, $this->contexts );

        $message = madFramework::instance(  )->locale->getMessageSetting( 
            $key,
            $this->request->accept->languages,
            $contexts
        );

        if ( is_null( $dictionnary ) && isset( $this->object ) ) {
            $dictionnary = $this->object->flatten( false );
        }

        if ( is_null( $dictionnary ) && isset( $this->form ) ) {
            $dictionnary = $this->form;
        }

        if ( $dictionnary ) {
            $message = madFramework::dictionnaryReplace( $message, $dictionnary );
        }

        return $message;
    } # }}}
    public function truncateWords( $content, $maxchars ) { # {{{
        $content = substr($content, 0, $maxchars);
        $pos = strrpos($content, ' ');
        if ($pos>0) {
            $content = substr($content, 0, $pos);
        }
        return $content; 
    } # }}}
    public function ucfirst( $string , $e ='utf-8') { # {{{
        if (function_exists('mb_strtoupper') && function_exists('mb_substr') && !empty($string)) {
            $string = mb_strtolower($string, $e);
            $upper = mb_strtoupper($string, $e);
            preg_match('#(.)#us', $upper, $matches);
            $string = $matches[1] . mb_substr($string, 1, mb_strlen($string, $e), $e);
        } else {
            $string = ucfirst($string);
        }
        return $string;
    } # }}}
    public function isRenderable( $attribute ) { # {{{
        if ( !empty( $attribute['widget'] ) ) {
            return true;
        }
    } # }}}
    
    /*
     * @todo: move to a form view handler
     */
    
    /**
     * For each attribute that have a "widget" key, call renderFormFieldRow().
     * 
     * @param madFormController $form
     * @return string HTML form as dictated by uni-form
     */
    public function renderFormFields( $form ) { # {{{
        $html = array(  );

        foreach( $form->formConfiguration as &$attribute ) {
            if ( !$this->isRenderable( $attribute ) ) {
                continue;
            }

            $html[] = $this->renderFormFieldRow( $attribute );
        }

        return implode( "\n", $html );
    } # }}}

    /**
     * Render the HTML field row, including label, help text, widget(s), etc ...
     *
     * First, processAttribute().
     *
     * - if the attribute has 'asFormSet' key, call renderFormSet().
     * - if the attribute has 'asMultiValue' key, call renderMulti%sWidgetRow()
     * - else call renderWidgetRow()
     *
     * @param array $attribute
     * @return string HTML version of the field row as dictated by uni-form
     */
    public function renderFormFieldRow( &$attribute ) { # {{{
        $html = array(  );

        $this->processAttribute( $attribute );

        if ( empty( $attribute['widget'] ) ) {
            return '';
        }

        if ( $attribute['asFormSet'] ) {
            $html[] = '<h2>';
            $html[] = $attribute['label'];
            $html[] = '</h2>';
            $html[] = $this->renderFormSet( $attribute['form'] );
        } elseif ( $attribute['asMultiValue'] ) {
            $method = sprintf( 
                "renderMulti%sWidgetRow",
                ucfirst( $attribute['widget'] )
            );

            if ( method_exists( $this, $method ) ) {
                $html[] = $this->$method( $attribute );
            } else {
                $html[] = $this->renderMultiInputWidgetRow( $attribute );
            }
        } else {
            $method = sprintf( 
                "render%sWidgetRow",
                ucfirst( $attribute['widget'] )
            );

            if ( method_exists( $this, $method ) ) {
                $html[] = $this->$method( $attribute );
            } else {
                $widgetRenderer = sprintf(
                    'render%sWidget',
                    ucfirst( $attribute['widget'] )
                );
                $html[] = $this->renderWidgetRow( $attribute, $widgetRenderer );
            }
        }

        return implode( "\n\t", $html );
    } # }}}

    /**
     * Sets common attribute view variables.
     *
     * - label,
     * - htmlName,
     * - htmlId,
     *
     * @param array $attribute
     * @param string $htmlNamePattern
     */
    public function processAttribute( &$attribute, $htmlNamePattern = '%s[%s]' ) { # {{{
        if ( empty( $attribute['label'] ) ) {
            $attribute['label'] = $this->t( 
                $attribute['name'], 
                $attribute, 
                $attribute['contexts']
            );
        }
        
        $attribute['htmlName'] = sprintf( 
            $htmlNamePattern,
            $attribute['form']->requestFormName,
            $attribute['column']
        );

        if ( !empty( $attribute['multiple'] ) ) {
            $attribute['htmlName'] .= '[]';
        }
        
        $attribute['htmlId'] = str_replace( 
            array( '.', '-', '[', ']' ), 
            array( '__dot__', '__dash__', '__braceleft__', '__braceright__'), 
            $attribute['htmlName']
        );
    } # }}}

    public function renderWidgetRow( &$attribute, $widgetRenderer ) { # {{{
        $html = array(  );
        
        $html[] = sprintf( 
            '<div class="ctrlHolder %s">',
            $attribute['errors'] ? 'error' : ''
        );

        $html[] = sprintf( 
            '<label for="%s">%s%s</label>',
            $attribute['name'],
            $attribute['required'] ? '<em>*</em> ' : '',
            $this->ucfirst( $attribute['label'] )
        );

        if ( $attribute['errors'] ) {
            foreach( $attribute->errors as $error ) {
                $html[] = '<p class="errorField">';
                $html[] = $this->t( 
                    $error, 
                    $attribute,
                    $attribute['contexts']
                );
                $html[] = '</p>';
            }
        }

        $html[] = $this->$widgetRenderer( &$attribute );
    
        $html[]= '</div>';

        return implode( "\n\t\t", $html );
    } # }}}
    
    
    public function renderFormSet( $form ) { # {{{
        $html = array(
            '<table class="formset">',
            '<thead>',
            '<tr>',
        );

        // make default initial data
        if ( !$form->data ) {
            $form->data = array( array(  ) );

            foreach( $form->formConfiguration as &$attribute ) {
                $form->data[0][$attribute['name']] = '';
            }
        }

        // render thead
        foreach( $form->formConfiguration as &$attribute ) {
            if ( !$this->isRenderable( $attribute ) ) {
                continue;
            }

            $this->processAttribute( $attribute );

            $html[] = sprintf(
                '<th>%s</th>',
                $this->ucfirst( $attribute['label'] )
            );
        }

        $html[] = '<th></th>';
        $html[] = '</tr>';
        $html[] = '</thead>';
        $html[] = '<tbody>';

        // render tbody
        foreach( $form->data as $key => &$row ) {
            $html[] = sprintf(
                '<tr class="formset_%s_form formset" valign="top">',
                substr( $attribute['form']->formName, strrpos( $attribute['form']->formName, '.' ) +1 )
            );
            
            foreach( $form->formConfiguration as &$attribute ) {
                if ( !$this->isRenderable( $attribute ) ) {
                    continue;
                }

                if ( !empty( $attribute['widget'] ) ) {
                    $method = sprintf( 
                        "render%sWidget",
                        ucfirst( $attribute['widget'] )
                    );

                    $this->processAttribute( $attribute, "%s[$key][%s]" );

                    $html[] = '<td>';
                    if ( method_exists( $this, $method ) ) {
                        $html[] = $this->$method( $attribute, $key );
                    } else {
                        $html[] = $this->renderInputWidget( $attribute, $key );
                    }
                    $html[] = '</td>';
                }
            }
            
            $html[] = '<td class="formsetDeleteRow">';
            $html[] = sprintf( 
                '<input type="button" class="deleteRow" value="%s" disabled="%s" />',
                $this->ucfirst( $this->t( 'delete' ) ),
                !empty( $row['id'] ) ? 'disabled' : ''
            );
            if ( !empty( $row['id'] ) ) {
                $html[] = sprintf(
                    '<input type="hidden" name="%s" value="%s" />',
                    $row['id'],
                    $attribute
                );
            }

            $html[] = '</td>';
            $html[] = '</tr>';
        }


        $html[] = '</tbody>';
        $html[] = '</table>';
        $html[] = '<button disabled="disabled" class="formset_add">';
        $html[] = $this->ucfirst( $this->t( 'add' ) );
        $html[] = '</button>';
        
        return implode( "\n", $html );
    } # }}}
    public function renderMultiInputWidgetRow( &$attribute ) { # {{{
        $html = array(  );
        
        $html[] = sprintf( 
            '<div class="ctrlHolder %s">',
            $attribute['errors'] ? 'error' : ''
        );

        $html[] = sprintf( 
            '<label for="%s">%s%s</label>',
            $attribute['name'],
            $attribute['required'] ? '<em>*</em> ' : '',
            $this->ucfirst( $attribute['label'] )
        );

        if ( $attribute['errors'] ) {
            foreach( $attribute->errors as $error ) {
                $html[] = '<p class="errorField">';
                $html[] = $this->t( 
                    $error, 
                    $attribute,
                    $attribute['contexts']
                );
                $html[] = '</p>';
            }
        }

        $html[] = '<table class="multipleField">';

        if ( !$attribute['form']->data ) {
            $attribute['form']->data = array( array(  ) );
        }

        $form = $attribute['form'];

        foreach( $form->data as $key => &$row ) {
            $html[] = sprintf(
                '<tr class="formset_%s_form formset" valign="top">',
                substr( $attribute['form']->formName, strrpos( $attribute['form']->formName, '.' ) +1 )
            );
            
            foreach( $form->formConfiguration as &$attribute ) {
                if ( !$this->isRenderable( $attribute ) ) {
                    continue;
                }

                if ( !empty( $attribute['widget'] ) ) {
                    $method = sprintf( 
                        "render%sWidget",
                        ucfirst( $attribute['widget'] )
                    );

                    $this->processAttribute( $attribute, "%s[$key][%s]" );

                    $html[] = '<td>';
                    if ( method_exists( $this, $method ) ) {
                        $html[] = $this->$method( $attribute, $key );
                    } else {
                        $html[] = $this->renderInputWidget( $attribute, $key );
                    }
                    $html[] = '</td>';
                }
            }
            
            $html[] = '<td class="formsetDeleteRow">';
            $html[] = sprintf( 
                '<input type="button" class="deleteRow" value="%s" disabled="%s" />',
                $this->ucfirst( $this->t( 'delete' ) ),
                !empty( $row['id'] ) ? '' : 'disabled'
            );
            if ( !empty( $row['id'] ) ) {
                $html[] = sprintf(
                    '<input type="hidden" name="%s" value="%s" />',
                    $row['id'],
                    $attribute
                );
            }

            $html[] = '</td>';
            $html[] = '</tr>';
        }

        $html[] = '</table>';

        $html[] = '<button disabled="disabled" class="formset_add">';
        $html[] = $this->ucfirst( $this->t( 'add' ) );
        $html[] = '</button>';

        $html[]= '</div>';

        return implode( "\n\t\t", $html );
    } # }}}

    public function renderInputWidget( &$attribute ) { # {{{
        return sprintf(
            '<input type="%s" value="%s" name="%s" class="%s" id="%s" />',
            $attribute['widget'],
            $attribute['displayValue'],
            $attribute['htmlName'],
            implode( ' ', $attribute['classes'] ),
            $attribute['htmlId']
        );
    } # }}}

    public function renderTextareaWidget( &$attribute ) { # {{{
        return sprintf(
            '<textarea name="%s" class="%s" id="%s">%s</textarea>',
            $attribute['htmlName'],
            implode( ' ', $attribute['classes'] ),
            $attribute['htmlId'],
            $attribute['displayValue']
        );
    } # }}}

    public function renderTextWidget( &$attribute ) {
        return $this->renderInputWidget( $attribute );
    }

    public function renderFileWidget( &$attribute ) {
        return $this->renderInputWidget( $attribute );
    }

    public function renderMultiSelectWidget( &$attribute) {
        return $this->renderSelectWidget( $attribute );
    }
    public function renderSelectWidget( &$attribute ) { # {{{
        $html  = array(  );

        $html[] = sprintf(
            '<select multiple="%s" name="%s" class="%s" id="%s" />',
            $attribute['multiple'] ? 'multiple' : '',
            $attribute['htmlName'],
            implode( ' ', $attribute['classes'] ),
            $attribute['htmlId']
        );

        foreach( $attribute['choices'] as $value => $display ) {
            $selected = false;
            $html[] = sprintf( 
                '<option value="%s" selected="%s">%s</option>',
                $value,
                $selected,
                $display
            );
        }

        $html[] = '</select>';

        return implode( '', $html );
    } # }}}

}

?>
