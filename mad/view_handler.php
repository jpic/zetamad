<?php

class madViewHandler extends ezcMvcPhpViewHandler {
    public function processZone( $name, $template ) {
        $templateBackup = $this->templateLocation;
        $this->templateLocation = $template;
        $this->process( false );
        $this->send( $name, $this->getResult() );
        $this->templateLocation = $templateBackup;
    }

    /**
     * Return the absolute url of a resized image. If the resized image doesn't
     * exists, this method will create it.
     *
     * Example usage in template:
     * <code>
     * <img src="<?php $this->thumbnail( $picturePath, 150, 150 ) ?>" />
     * </code>
     *
     * @param <type> $path
     * @param <type> $newWidth
     * @param <type> $newHeight
     * @param <type> $force false, "width", "height" or "ratio"
     * @return <type> Absolute URL to resized image
     */
    public function thumbnail( $path, $size ) { # {{{
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
        if ( !$info && !$info['extension'] ) {
            return false;
        }
        $path = $uploadPath;

        $thumbnailName = sprintf( '%s_%sx%s.%s',
            $info['filename'],
            $size,
            $size,
            $info['extension']
        );

        $thumbnailRelativePath = "thumbnails/$thumbnailName";
        $thumbnailPath = ENTRY_APP_PATH . "/upload/$thumbnailRelativePath";

        if ( file_exists( $thumbnailPath ) ) {
            return $this->getAbsoluteUploadUrl( $thumbnailRelativePath );
        }

        if ( !is_dir( dirname( $thumbnailPath ) ) ) {
            mkdir( dirname( $thumbnailPath ) );
        }

        if ( !$src = @imageCreateFromJpeg( $path ) ) {
            if ( !$src = @imageCreateFromPng( $path ) ) {
                if ( !$src = @imageCreateFromGif( $path ) ) {
                    trigger_error( "Cannot open $path", E_USER_ERROR );
                }
            }
        }

        // copy src image to gd2
//        $tmpFile = tempnam( sys_get_temp_dir(  ), 'mad' );
//        imagegd2( $src, $tmpFile );
//        imagedestroy( $src );
//        $src = imageCreateFromGd2( $tmpFile );

        $oldWidth  = imageSX( $src );
        $oldHeight = imageSY( $src );
        $newX = $newY = 0;

        if ( $oldHeight > $oldWidth ) {
            $ratio = $size / $oldWidth;
            $newHeight = $oldHeight * $ratio;
            $newWidth = $size;
            $newY = ( $newHeight - $size ) / 2;
        } elseif ( $oldWidth > $oldHeight ) {
            $ratio = $size / $oldHeight;
            $newWidth = $oldWidth * $ratio;
            $newHeight = $size;
            $newX = ( $newWidth - $size ) / 2;
        } else {
            $newWidth = $newHeight = $size;
        }

        $resized = imageCreateTrueColor(
            $newWidth,
            $newHeight
        );

        imageCopyResampled(
            $resized,
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

        $cropped = imageCreateTrueColor(
            $size,
            $size
        );

        imageCopy(
            $cropped,
            $resized,
            0,
            0,
            $newX,
            $newY,
            $newWidth,
            $newHeight
        );

        $image =& $cropped;

        switch( $info['extension'] ) {
            case 'jpg':
            case 'jpeg':
                imagejpeg( $image, $thumbnailPath );
                break;
            case 'png':
                imagepng( $image, $thumbnailPath );
                break;
            case 'gif':
                imagegif( $image, $thumbnailPath );
                break;
        }

        imageDestroy( $cropped );
        imageDestroy( $src );
        imageDestroy( $resized );
        
        return $this->getAbsoluteUploadUrl( $thumbnailRelativePath );
    } # }}}
    public function url( $name, $arguments = array(  ) ) { # {{{
        echo madFramework::url($name, $arguments);
    } # }}}
    public function getAbsoluteUploadUrl( $relativePath ) { # {{{
        $registry = madFramework::instance();
        return $registry->configuration->getSetting( 'applications', 'mad', 'uploadUrl' ) . '/' . $relativePath;
    } # }}}


    public function e( $value ) { # {{{
        echo $this->htmlize( $value );
    } # }}}
    public function htmlize( $value ) {
        return nl2br( htmlentities( stripslashes( $value ), ENT_COMPAT, 'UTF-8' ) );
    }

    public function t( $key, $dictionnary = null, $contexts = array(  ) ) { # {{{
        if ( !is_array( $contexts ) ) {
            $contexts = array( $contexts );
        }

        $contexts = array_merge( $contexts, $this->contexts );

        if ( is_null( $dictionnary ) && isset( $this->object ) ) {
            $dictionnary = $this->object->flatten( false );
        }

        if ( is_null( $dictionnary ) && isset( $this->form ) ) {
            $dictionnary = $this->form;
        }

        $message = madFramework::translate( $key, $dictionnary, $contexts );

        return $message;
    } # }}}

    public function et( $key, $dictionnary = null, $contexts = array(  ) ) {
        $this->e( $this->t( $key, $dictionnary , $contexts ) );
    }
    public function uet( $key, $dictionnary = null, $contexts = array() ) {
        $this->e( $this->ucfirst( $this->t( $key, $dictionnary, $contexts ) ) );
    }

    public function ut( $key, $dictionnary = null, $contexts = array() ) {
        return $this->ucfirst( $this->t( $key, $dictionnary, $contexts ) );
    }
    public function hut( $key, $dictionnary = null, $contexts = array() ) {
        return $this->htmlize( $this->ucfirst( $this->t( $key, $dictionnary, $contexts ) ) );
    }


    public function iterate( $value ) { # {{{
        if ( is_array( $value ) || ( $value instanceof madObject && !$value->isEntity ) ) {
            return $value;
        } else {
            return array( $value );
        }
    } # }}}
    public function includeTemplate( $template ) { # {{{
        madFramework::instance()->sendSignal( 'preIncludeTemplate', array( $template ) );
        include $template;
        madFramework::instance()->sendSignal( 'postIncludeTemplate', array( $template ) );
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
    public function truncateWords( $content, $maxchars ) { # {{{
        if ( strlen( $content ) <= $maxchars ) {
            return $content;
        }

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

        if ( $attribute['form'] !== $attribute['parentForm'] ) {
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

        foreach( $form->formConfiguration as $name => &$attribute ) {
            if ( !$this->isRenderable( $attribute ) ) {
                continue;
            }

            $html[] = $this->renderFormFieldRow( $attribute, $form );
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
    public function renderFormFieldRow( $attribute, $form = null ) { # {{{
        $html = array(  );
        $form = is_null( $form ) && !empty( $this->form ) ? $this->form : $form;

        if ( is_string( $attribute ) ) {
            $attribute =& $form->formConfiguration[$attribute];
        }

        $this->processAttribute( $attribute );

        if ( $attribute['asFormSet'] ) {
            $html[] = sprintf( '<h2>%s</h2>', $attribute['label'] );
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
    public function processAttribute( &$attribute ) { # {{{
        madFramework::instance()->sendSignal( 'preProcessAttributeView', array( &$attribute ) );

        if ( empty( $attribute['label'] ) ) {
            $attribute['label'] = $this->t( 
                $attribute['name'], 
                $attribute, 
                $attribute['contexts']
            );
        }

        if ( empty( $attribute['help'] ) ) {
            $key = $attribute['name'] . '.META.HELP';

            $help = $this->t(
                $key,
                $attribute,
                $attribute['contexts']
            );

            $attribute['help'] = $key == $help ? null : $help;
        }
    } # }}}

    public function renderWidgetRow( &$attribute, $widgetRenderer ) { # {{{
        $html = array(  );
        
        $html[] = sprintf( 
            '<div class="ctrlHolder %s %s">',
            $this->getAttributeError( $attribute ) ? 'error' : '',
            $attribute['name']
        );

        $html[] = sprintf( 
            '<label for="%s">%s%s</label>',
            $attribute['name'],
            $attribute['required'] ? '<em>*</em> ' : '',
            $this->ucfirst( $attribute['label'] )
        );

        if ( $error = $this->getAttributeError( $attribute ) ) {
            $html[] = '<p class="errorField">';
            $html[] = $this->t(
                $error,
                $attribute,
                $attribute['contexts']
            );
            $html[] = '</p>';
        }

        $html[] = $this->$widgetRenderer( $attribute );
    
        if ( !empty( $attribute['help'] ) ) {
            $html[] = '<p class="formHint">' . $this->ucfirst( $attribute['help'] ) . '</p>';
        }
        
        $html[]= '</div>';

        return implode( "\n\t\t", $html );
    } # }}}
    
    
    public function renderFormSet( $form ) { # {{{
        $html = array(
            sprintf( '<table class="formset %s">', str_replace( '.', '_', $form->formName ) ),
            '<thead>',
            '<tr>',
        );

        // make default initial data
        if ( !count( $form->data ) ) {
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
                '<th class="%s">%s</th>',
                $this->ucfirst( $attribute['label'] ),
                $attribute['name']
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

                $this->processAttribute( $attribute );

                if ( !empty( $attribute['widget'] ) ) {
                    $method = sprintf( 
                        "render%sWidget",
                        ucfirst( $attribute['widget'] )
                    );

                    $html[] = sprintf('<td class="%s">', $attribute['name']);
                    if ( method_exists( $this, $method ) ) {
                        $html[] = $this->$method( $attribute, $key );
                    } else {
                        $html[] = $this->renderInputWidget( $attribute, $key );
                    }
                    $html[] = '</td>';
                }
            }
            
            $html[] = '<td class="formsetDeleteRowh">';
            $html[] = sprintf( 
                '<input type="button" class="deleteRow" value="%s" disabled="%s" />',
                $this->ucfirst( $this->t( 'delete' ) ),
                !empty( $row['id'] ) ? 'disabled' : ''
            );
            if ( !empty( $row['id'] ) ) {
                $html[] = sprintf(
                    '<input type="hidden" name="%s" value="%s[%s][%s]" />',
                    $row['id'],
                    $form->requestFormName,
                    $key,
                    'id'
                );
            }

            $html[] = '</td>';
            $html[] = '</tr>';
        }


        $html[] = '</tbody>';
//        $html[] = '<tfoot>';
//
//        foreach( $form->formConfiguration as &$attribute ) {
//            if ( !$this->isRenderable( $attribute ) ) {
//                continue;
//            }
//
//            $this->processAttribute( $attribute );
//
//            $html[] = sprintf(
//                '<td class="formHint">%s</td>',
//                $this->ucfirst( $attribute['help'] )
//            );
//        }
//
//        $html[] = '</tfoot>';
        $html[] = '</table>';

        $html[] = '<button disabled="disabled" class="formset_add">';
        $html[] = $this->ucfirst( $this->t( 'add' ) );
        $html[] = '</button>';
        
        if (!empty($attribute['help'])) {
            $html[] = '<p class="formHint">';
            $html[] = $attribute['help'];
            $html[] = '</p>';
        }

        return implode( "\n", $html );
    } # }}}
    public function renderMultiInputWidgetRow( &$attribute ) { # {{{
        $html = array(  );

        $html[] = sprintf( 
            '<div class="ctrlHolder %s">',
            $this->getAttributeError( $attribute ) ? 'error' : ''
        );

        $html[] = sprintf( 
            '<label for="%s">%s%s</label>',
            $attribute['name'],
            $attribute['required'] ? '<em>*</em> ' : '',
            $this->ucfirst( $attribute['label'] )
        );

        if ( $this->getAttributeError( $attribute ) ) {
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

        if ( !count( $attribute['form']->data ) ) {
            $attribute['form']->data = array( array(  ) );
        }

        $form = $attribute['form'];

        foreach( $form->formConfiguration as &$formAttribute ) {
            $this->processAttribute( $formAttribute );
        }
        
        foreach( $form->data as $key => &$row ) {
            $html[] = sprintf(
                '<tr class="formset_%s_form formset" valign="top">',
                substr( $attribute['form']->formName, strrpos( $attribute['form']->formName, '.' ) +1 )
            );

            foreach( $form->formConfiguration as &$formAttribute ) {
                if ( !$this->isRenderable( $formAttribute ) ) {
                    continue;
                }

                if ( !empty( $formAttribute['widget'] ) ) {
                    $method = sprintf( 
                        "render%sWidget",
                        ucfirst( $formAttribute['widget'] )
                    );

                    $html[] = '<td>';
                    if ( method_exists( $this, $method ) ) {
                        $html[] = $this->$method( $formAttribute, $key );
                    } else {
                        $html[] = $this->renderInputWidget( $formAttribute, $key );
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
                    '<input type="hidden" value="%s" name="%s[%s][%s]" />',
                    $row['id'],
                    $form->requestFormName,
                    $key,
                    'id'
                );
            }

            $html[] = '</td>';
            $html[] = '</tr>';
        }

        $html[] = '</table>';

        if (!empty($attribute['help'])) {
            $html[] = '<p class="formHint">';
            $html[] = $attribute['help'];
            $html[] = '</p>';
        }

        $html[] = '<button disabled="disabled" class="formset_add">';
        $html[] = $this->ucfirst( $this->t( 'add' ) );
        $html[] = '</button>';

        $html[]= '</div>';

        return implode( "\n\t\t", $html );
    } # }}}

    public function getAttributeError( $attribute, $key = null ) {
        if ( !is_null( $key ) ) {
            if ( !empty( $attribute['form']->errors[$key][$attribute['name']] ) ) {
                return $attribute['form']->errors[$key][$attribute['name']];
            }
        } else {
            if ( !empty( $attribute['form']->errors[$attribute['name']] ) ) {
                return $attribute['form']->errors[$attribute['name']];
            }
        }
    }

    public function getAttributeValue( $attribute, $key = null ) {
        if ( $this->getAttributeError( $attribute, $key ) ) {
            if ( !is_null( $key ) ) {
                if ( isset( $attribute['form']->data[$key][$attribute['column']] ) ) {
                    return $attribute['form']->data[$key][$attribute['column']];
                } else {
                    return '';
                }
            } else {
                if ( isset ( $attribute['form']->data[$attribute['column']] ) ) {
                    return $attribute['form']->data[$attribute['column']];
                } else {
                    return '';
                }
            }
        } elseif ( !is_null( $key ) && isset( $attribute['form']->processedData[$key] ) && isset( $attribute['form']->processedData[$key][$attribute['column']] ) ) {
            return $attribute['form']->processedData[$key][$attribute['column']];
        } elseif ( isset( $attribute['form']->processedData[$attribute['column']] ) ) {
            return $attribute['form']->processedData[$attribute['column']];
        }
        return '';
    }

    public function getAttributeHtmlName( $attribute, $key = null ) {
        $name = $attribute['form']->requestFormName;

        if ( !is_null( $key ) ) {
            $name .= "[$key]";
        }
        
        $name .= "[$attribute[column]]";

        if ( !empty( $attribute['multiple'] ) ) {
            $name .= '[]';
        }

        return $name;
    }

    public function getAttributeHtmlId( $attribute, $key = null ) {
        return str_replace(
            array( '.', '-', '[', ']' ),
            array( '__dot__', '__dash__', '__braceleft__', '__braceright__'),
            $this->getAttributeHtmlName( $attribute, $key )
        );
    }

    public function renderInputWidget( &$attribute, $key = null ) { # {{{
        return sprintf(
            '<input type="%s" value="%s" name="%s" class="%s" id="%s" />',
            $attribute['widget'],
            $this->getAttributeValue( $attribute, $key ),
            $this->getAttributeHtmlName( $attribute, $key ),
            implode( ' ', $attribute['classes'] ),
            $this->getAttributeHtmlId( $attribute, $key )
        );
    } # }}}

    public function renderTextareaWidget( &$attribute, $key = null ) { # {{{
        return sprintf(
            '<textarea name="%s" class="%s" id="%s">%s</textarea>',
            $this->getAttributeHtmlName( $attribute, $key ),
            implode( ' ', $attribute['classes'] ),
            $this->getAttributeHtmlId( $attribute, $key ),
            $this->getAttributeValue( $attribute, $key )
        );
    } # }}}

    public function renderTextWidget( &$attribute, $key = null ) {
        return $this->renderInputWidget( $attribute, $key );
    }

    public function renderImageWidget( &$attribute, $key = null ) {
        $html = $this->renderFileWidget( $attribute, $key );
        if  ( $value = $this->getAttributeValue( $attribute, $key ) ) {
            $html .= sprintf(
                '<img src="%s" />',
                $this->thumbnail($value, 30, 30 )
            );
        }
        return $html;
    }

    public function renderFileWidget( &$attribute, $key = null ) {
        $html = array();
        $html[] = sprintf(
            '<input type="file" name="%s" class="%s" id="%s" />',
            $this->getAttributeHtmlName( $attribute, $key ),
            implode( ' ', $attribute['classes'] ),
            $this->getAttributeHtmlId( $attribute, $key )
        );
        
        if ( $value = $this->getAttributeValue( $attribute, $key ) ) {
            $html[] = sprintf(
                '<p class="formHint"><a href="%s">Voir le fichier actuel</a></p>',
                $this->getAbsoluteUploadUrl( $value )
            );
        }
        return implode("\n", $html);
    }

    public function renderMultiSelectWidget( &$attribute, $key = null ) {
        return $this->renderSelectWidget( $attribute, $key );
    }

    public function renderReadOnlyWidget( &$attribute, $key = null ) {
        return $this->getAttributeValue( $attribute, $key );
    }

    public function renderSelectWidget( &$attribute, $key = null ) { # {{{
        $html  = array(  );

        $html[] = sprintf(
            '<select "%s" name="%s" class="%s" id="%s" />',
            !empty( $attribute['multiple'] ) ? 'multiple="multiple"' : '',
            $this->getAttributeHtmlName( $attribute, $key ),
            implode( ' ', $attribute['classes'] ),
            $this->getAttributeHtmlId( $attribute, $key )
        );

        $actualValue = $this->getAttributeValue( $attribute, $key );
        foreach( $attribute['choices'] as $value => $display ) {
            $selected = $value == $actualValue || ( is_array( $actualValue ) && in_array( $value, $actualValue ) );

            $html[] = sprintf( 
                '<option value="%s" %s>%s</option>',
                $value,
                $selected ? 'selected="selected"' : '',
                $display
            );
        }

        $html[] = '</select>';

        if ( !empty( $attribute['createRoute']) ) {
            $html[] = sprintf(
                '<p class="formHint"><a href="%s?displayAttribute=%s&valueAttribute=%s" id="add_%s" class="add-another">%s</a> %s</p>',
                madFramework::url( $attribute['createRoute'] ),
                $attribute['displayAttribute'],
                $attribute['valueAttribute'],
                $this->getAttributeHtmlId( $attribute, $key ),
                $this->ucfirst( $this->t( 'addAnotherSolution' ) ),
                $this->t( 'addAnotherIfIssue' )
            );
        }

        return implode( '', $html );
    } # }}}


    public function date( $date ) {
        if ( $date == date( 'Y-m-d') ) {
            return "aujourd'hui";
        }

        if ( $date == date( 'Y-m-d', strtotime( '-1 day') ) ) {
            return 'hier';
        }

        if ( $date == date( 'Y-m-d', strtotime( '-2 day') ) ) {
            return 'avant hier';
        }

        $info = date_parse_from_format( 'Y-m-d', $date );
        $ts = mktime(
            $info['hour'],
            $info['minute'],
            $info['second'],
            $info['month'],
            $info['day'],
            $info['year']
        );
        $diff = time() - $ts;
        $diffDays = intval( $diff / 86400 );

        if ( $diffDays < 7 ) {
            return "il y a $diffDays jours";
        }

        if ( $diffDays < 14 ) {
            return "la semaine dernière";
        }

        if ( $diffDays < 21 ) {
            return "il y a deux semaines";
        }

        if ( $info['month'] == date('m') ) {
            return "il y a trois semaines";
        }

        $diffMonths = intval( $diff / ( 86400*30 ) );

        if ( $diffMonths <= 1 ) {
            return "le mois dernier";
        }
        
        return "il y a $diffMonths mois";

    }
}
