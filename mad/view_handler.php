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
        if ( !empty( $this->framework->configuration['applications']['mad']['brokenGd'] ) ) {
            return $uploadPath;
        }
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
    public function eu( $value ) {
        echo ucfirst( $this->htmlize( $value ) );
    }
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
    } # }}}
    public function includeOnceTemplate( $template ) { # {{{
        madFramework::instance()->sendSignal( 'preIncludeTemplate', array( $template ) );
        include_once $template;
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
    public function isRenderable( $formAttribute ) { # {{{
        if ( !empty( $formAttribute['widget'] ) ) {
            return true;
        }

        if ( $formAttribute['form'] !== $formAttribute['parentForm'] ) {
            return true;
        }
    } # }}}
    
    /*
     * @todo: move to a form view handler
     */

    /**
     * For each formAttribute that have a "widget" key, call renderFormFieldRow().
     * 
     * @param madFormController $form
     * @return string HTML form as dictated by uni-form
     */
    public function renderFormFields( $form ) { # {{{
        $html = array(  );

        foreach( $form->formConfiguration as $name => &$formAttribute ) {
            if ( !$this->isRenderable( $formAttribute ) ) {
                continue;
            }

            $html[] = $this->renderFormFieldRow( $formAttribute, $form );
        }

        return implode( "\n", $html );
    } # }}}

    /**
     * Render the HTML field row, including label, help text, widget(s), etc ...
     *
     * First, processAttribute().
     *
     * - if the formAttribute has 'asFormSet' key, call renderFormSet().
     * - if the formAttribute has 'asMultiValue' key, call renderMulti%sWidgetRow()
     * - else call renderWidgetRow()
     *
     * @param array $formAttribute
     * @return string HTML version of the field row as dictated by uni-form
     */
    public function renderFormFieldRow( $formAttribute, $form = null ) { # {{{
        $html = array(  );
        $form = is_null( $form ) && !empty( $this->form ) ? $this->form : $form;

        if ( is_string( $formAttribute ) ) {
            $formAttribute =& $form->formConfiguration[$formAttribute];
        }

        $this->processAttribute( $formAttribute );

        if ( $formAttribute['asFormSet'] ) {
            $html[] = $this->renderFormSet( $formAttribute['form'] );
        } elseif ( $formAttribute['asMultiValue'] ) {
            $method = sprintf( 
                "renderMulti%sWidgetRow",
                ucfirst( $formAttribute['widget'] )
            );

            if ( method_exists( $this, $method ) ) {
                $html[] = $this->$method( $formAttribute );
            } else {
                $html[] = $this->renderMultiInputWidgetRow( $formAttribute );
            }
        } else {
            $method = sprintf(
                "render%sWidgetRow",
                ucfirst( $formAttribute['widget'] )
            );

            if ( method_exists( $this, $method ) ) {
                $html[] = $this->$method( $formAttribute );
            } else {
                $widgetRenderer = sprintf(
                    'render%sWidget',
                    ucfirst( $formAttribute['widget'] )
                );
                $html[] = $this->renderWidgetRow( $formAttribute, $widgetRenderer );
            }
        }

        return implode( "\n\t", $html );
    } # }}}

    /**
     * Sets common formAttribute view variables.
     *
     * - label,
     * - htmlName,
     * - htmlId,
     *
     * @param array $formAttribute
     * @param string $htmlNamePattern
     */
    public function processAttribute( &$formAttribute ) { # {{{
        madFramework::instance()->sendSignal( 'preProcessAttributeView', array( &$formAttribute ) );

        if ( empty( $formAttribute['label'] ) ) {
            $formAttribute['label'] = $this->t(
                $formAttribute['name'],
                $formAttribute,
                $formAttribute['contexts']
            );
        }

        if ( empty( $formAttribute['help'] ) ) {
            $key = $formAttribute['name'] . '.META.HELP';

            $help = $this->t(
                $key,
                $formAttribute,
                $formAttribute['contexts']
            );

            $formAttribute['help'] = $key == $help ? null : $help;
        }
    } # }}}

    public function renderWidgetRow( &$formAttribute, $widgetRenderer ) { # {{{
        $html = array(  );
        
        $html[] = sprintf( 
            '<div class="ctrlHolder %s %s">',
            $this->getAttributeError( $formAttribute ) ? 'error' : '',
            $formAttribute['name']
        );

        $html[] = sprintf( 
            '<label for="%s">%s%s</label>',
            $formAttribute['name'],
            $formAttribute['required'] ? '<em>*</em> ' : '',
            $this->ucfirst( $formAttribute['label'] )
        );

        if ( $error = $this->getAttributeError( $formAttribute ) ) {
            $html[] = '<p class="errorField">';
            $html[] = $this->t(
                $error,
                $formAttribute,
                $formAttribute['contexts']
            );
            $html[] = '</p>';
        }

        $html[] = $this->$widgetRenderer( $formAttribute );
    
        if ( !empty( $formAttribute['help'] ) ) {
            $html[] = '<p class="formHint">' . $this->ucfirst( $formAttribute['help'] ) . '</p>';
        }
        
        $html[]= '</div>';

        return implode( "\n\t\t", $html );
    } # }}}

    public function fixFormData( $form ) {
        if ( $form->isFormSet ) {
            // make default initial data
            if ( !count( $form->data ) ) {
                $form->data = array( array(  ) );

                foreach( $form->formConfiguration as &$formAttribute ) {
                    $form->data[0][$formAttribute['name']] = '';
                }
            }
        }

        return $form;
    }

    public function getTableRowFormSetClass( $form ) {
        return substr( $form->formName, strrpos( $form->formName, '.' ) +1 );
    }

    public function prepareFormSet( $form ) {
        $this->fixFormData( $form );
        
        foreach( $form->formConfiguration as &$formAttribute ) {
            if ( !$this->isRenderable( $formAttribute ) ) {
                continue;
            }

            $this->processAttribute( $formAttribute );
        }

        return $form;
    }

    // @todo: refactor with prepareformSet
    
    public function renderFormSet( $form ) { # {{{
        $html = array(
            sprintf( '<table class="formset %s">', str_replace( '.', '_', $form->formName ) ),
            '<thead>',
            '<tr>',
        );
        $template = array(
            sprintf(
                '<tr class="formset_%s_form formset" valign="top">',
                $this->getTableRowFormSetClass( $form )
            ),
        );

        foreach( $form->formConfiguration as &$formAttribute ) {
            if ( !$this->isRenderable( $formAttribute ) ) {
                continue;
            }

            $this->processAttribute( $formAttribute );

            if ( $formAttribute['widget'] == 'hidden' ) {
                continue;
            }

            if ( !empty( $formAttribute['widget'] ) ) {
                $method = sprintf(
                    "render%sWidget",
                    ucfirst( $formAttribute['widget'] )
                );

                $template[] = sprintf('<td class="%s">', $formAttribute['name']);
                if ( method_exists( $this, $method ) ) {
                    $template[] = $this->$method( $formAttribute, 'voidKey' );
                } else {
                    $template[] = $this->renderInputWidget( $formAttribute, 'voidKey' );
                }
                $template[] = '</td>';
            }

            $html[] = sprintf(
                '<th class="%s">%s</th>',
                $formAttribute['name'],
                $this->ucfirst( $formAttribute['label'] )
            );
        }

        $template[] = '<td class="formsetDeleteRow">';
        $template[] = sprintf(
            '<input type="button" name="voidKey" class="deleteRow" value="%s" disabled="disabled" />',
            $this->ucfirst( $this->t( 'delete' ) )
        );

        foreach( $form->formConfiguration as &$formAttribute ) {
            if ( empty( $formAttribute['widget'] ) || $formAttribute['widget'] != 'hidden' ) {
                // already rendered
                continue;
            }

            $template[] = $this->renderInputWidget( $formAttribute , 'voidKey' );

        }

        $template[] = '</td>';
        $template[] = '</tr>';
        
        $html[] = '<th></th>';
        $html[] = '</tr>';
        $html[] = '</thead>';
        $html[] = '<tbody>';

        // render tbody
        foreach( $this->fixFormData( $form )->data as $key => &$row ) {
            $html[] = sprintf(
                '<tr class="formset_%s_form formset" valign="top">',
                $this->getTableRowFormSetClass( $form )
            );
            
            foreach( $form->formConfiguration as &$formAttribute ) {
                if ( !$this->isRenderable( $formAttribute ) ) {
                    continue;
                }

                if ( $formAttribute['widget'] == 'hidden' ) {
                    // render it later
                    continue;
                }

                if ( !empty( $formAttribute['widget'] ) ) {
                    $method = sprintf( 
                        "render%sWidget",
                        ucfirst( $formAttribute['widget'] )
                    );

                    $html[] = sprintf('<td class="%s">', $formAttribute['name']);
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
                '<input type="button" class="deleteRow" name="%s" value="%s" disabled="disabled" />',
                $key,
                $this->ucfirst( $this->t( 'delete' ) )
            );

            foreach( $form->formConfiguration as &$formAttribute ) {
                if ( empty( $formAttribute['widget'] ) || $formAttribute['widget'] != 'hidden' ) {
                    // already rendered
                    continue;
                }

                $html[] = $this->renderInputWidget( $formAttribute , $key );

            }

            $html[] = '</td>';
            $html[] = '</tr>';
        }


        $html[] = '</tbody>';
        $html[] = '<tfoot>';

        foreach( $form->formConfiguration as &$formAttribute ) {
            if ( !$this->isRenderable( $formAttribute ) ) {
                continue;
            }

            $this->processAttribute( $formAttribute );

            $html[] = sprintf(
                '<td class="formHint">%s</td>',
                $this->ucfirst( $formAttribute['help'] )
            );
        }

        $html[] = '</tfoot>';
        $html[] = '</table>';

        $html[] = '<button disabled="disabled" class="formset_add">';
        $html[] = $this->ucfirst( $this->t( 'add' ) );
        $html[] = '</button>';

        $htmlTemplate = array(
            sprintf(
                '<div id="formset_template_%s" class="formset_template" style="display:none;">',
                $this->getTableRowFormSetClass( $form )
            ),
            '<!--',
        );
        foreach( $template as $line ) {
            $htmlTemplate[] = $line;
        }
        $htmlTemplate[] = '-->';
        $htmlTemplate[] = '</div>';

        return implode( "\n", $html ) . implode( "\n", $htmlTemplate );
    } # }}}
    public function renderMultiInputWidgetRow( &$formAttribute ) { # {{{
        $html = array(  );

        $html[] = sprintf( 
            '<div class="ctrlHolder %s">',
            $this->getAttributeError( $formAttribute ) ? 'error' : ''
        );

        $html[] = sprintf( 
            '<label for="%s">%s%s</label>',
            $formAttribute['name'],
            $formAttribute['required'] ? '<em>*</em> ' : '',
            $this->ucfirst( $formAttribute['label'] )
        );

        if ( $this->getAttributeError( $formAttribute ) ) {
            foreach( $formAttribute->errors as $error ) {
                $html[] = '<p class="errorField">';
                $html[] = $this->t( 
                    $error, 
                    $formAttribute,
                    $formAttribute['contexts']
                );
                $html[] = '</p>';
            }
        }

        $html[] = '<table class="multipleField">';

        if ( !count( $formAttribute['form']->data ) ) {
            $formAttribute['form']->data = array( array(  ) );
        }

        $form = $formAttribute['form'];

        $template = array(
            sprintf(
                '<tr class="formset_%s_form formset %s" valign="top">',
                $this->getTableRowFormSetClass( $form ),
                $formAttribute['name']
            ),
        );

        foreach( $form->formConfiguration as &$formAttribute ) {
            $this->processAttribute( $formAttribute );

            if ( $this->isRenderable( $formAttribute ) ) {
                $method = sprintf(
                    "render%sWidget",
                    ucfirst( $formAttribute['widget'] )
                );

                if ( $formAttribute['widget'] == 'hidden' ) {
                    continue;
                }

                $template[] = sprintf('<td class="%s">', $formAttribute['name']);

                if ( method_exists( $this, $method ) ) {
                    $template[] = $this->$method( $formAttribute, 'voidKey' );
                } else {
                    $template[] = $this->renderInputWidget( $formAttribute, 'voidKey' );
                }

                $template[] = '</td>';
            }
        }
        

        $template[] = '<td class="formsetDeleteRow">';
        $template[] = sprintf(
            '<input type="button" name="voidKey" class="deleteRow" value="%s" disabled="disabled" />',
            $this->ucfirst( $this->t( 'delete' ) )
        );
        $template[] = '</td>';
        $template[] = '</tr>';

        foreach( $form->data as $key => &$row ) {
            $html[] = sprintf(
                '<tr class="formset_%s_form formset" valign="top">',
                substr( $formAttribute['form']->formName, strrpos( $formAttribute['form']->formName, '.' ) +1 )
            );

            foreach( $form->formConfiguration as &$formAttribute ) {
                if ( !$this->isRenderable( $formAttribute ) ) {
                    continue;
                }

                if ( empty( $formAttribute['widget'] ) || $formAttribute['widget'] == 'hidden' ) {
                    continue;
                }

                $method = sprintf(
                    "render%sWidget",
                    ucfirst( $formAttribute['widget'] )
                );

                $html[] = sprintf('<td class="%s">', $formAttribute['name']);
                if ( method_exists( $this, $method ) ) {
                    $html[] = $this->$method( $formAttribute, $key );
                } else {
                    $html[] = $this->renderInputWidget( $formAttribute, $key );
                }
                $html[] = '</td>';
            }
            
            $html[] = '<td class="formsetDeleteRow">';
            $html[] = sprintf( 
                '<input type="button" class="deleteRow" value="%s" disabled="disabled" name="%s" />',
                $this->ucfirst( $this->t( 'delete' ) ),
                $key
            );

            foreach( $form->formConfiguration as &$formAttribute ) {
                if ( empty( $formAttribute['widget'] ) || $formAttribute['widget'] != 'hidden' ) {
                    // already rendered
                    continue;
                }

                $html[] = $this->renderInputWidget( $formAttribute , $key );
            }

            $html[] = '</td>';
            $html[] = '</tr>';
        }

        $template[] = '</tr>';
        $html[] = '</table>';

        if (!empty($formAttribute['help'])) {
            $html[] = '<p class="formHint">';
            $html[] = $formAttribute['help'];
            $html[] = '</p>';
        }

        $html[] = '<button disabled="disabled" class="formset_add">';
        $html[] = $this->ucfirst( $this->t( 'add' ) );
        $html[] = '</button>';


        $htmlTemplate = array(
            sprintf(
                '<div id="formset_template_%s" class="formset_template" style="display:none;">',
                $this->getTableRowFormSetClass( $form )
            ),
            '<!--',
        );
        foreach( $template as $line ) {
            $htmlTemplate[] = $line;
        }
        $htmlTemplate[] = '-->';
        $htmlTemplate[] = '</div>';

        return implode( "\n", $html ) . implode( "\n", $htmlTemplate ) . '</div>';
    } # }}}

    public function getAttributeError( $formAttribute, $key = null ) {
        if ( $key === 'voidKey' ) {
            return;
        }

        if ( !is_null( $key ) ) {
            if ( !empty( $formAttribute['form']->errors[$key][$formAttribute['name']] ) ) {
                return $formAttribute['form']->errors[$key][$formAttribute['name']];
            }
        } else {
            if ( !empty( $formAttribute['form']->errors[$formAttribute['name']] ) ) {
                return $formAttribute['form']->errors[$formAttribute['name']];
            }
        }
    }

    public function getAttributeValue( $formAttribute, $key = null ) {
        if ( $key === 'voidKey' ) {
            return;
        }

        if ( $this->getAttributeError( $formAttribute, $key ) ) {
            if ( !is_null( $key ) ) {
                if ( isset( $formAttribute['form']->data[$key][$formAttribute['column']] ) ) {
                    return $formAttribute['form']->data[$key][$formAttribute['column']];
                } else {
                    return '';
                }
            } else {
                if ( isset ( $formAttribute['form']->data[$formAttribute['column']] ) ) {
                    return $formAttribute['form']->data[$formAttribute['column']];
                } else {
                    return '';
                }
            }
        } elseif ( !is_null( $key ) && isset( $formAttribute['form']->processedData[$key] ) && isset( $formAttribute['form']->processedData[$key][$formAttribute['column']] ) ) {
            return $formAttribute['form']->processedData[$key][$formAttribute['column']];
        } elseif ( isset( $formAttribute['form']->processedData[$formAttribute['column']] ) ) {
            return $formAttribute['form']->processedData[$formAttribute['column']];
        }
        return '';
    }

    public function getAttributeHtmlName( $formAttribute, $key = null ) {
        $name = $formAttribute['form']->requestFormName;

        if ( !is_null( $key ) ) {
            $name .= "[$key]";
        }
        
        $name .= "[$formAttribute[column]]";

        if ( !empty( $formAttribute['multiple'] ) ) {
            $name .= '[]';
        }

        return $name;
    }

    public function getAttributeHtmlId( $formAttribute, $key = null ) {
        return str_replace(
            array( '.', '-', '[', ']' ),
            array( '__dot__', '__dash__', '__braceleft__', '__braceright__'),
            $this->getAttributeHtmlName( $formAttribute, $key )
        );
    }

    public function renderInputWidget( &$formAttribute, $key = null ) { # {{{
        return sprintf(
            '<input type="%s" value="%s" name="%s" class="%s" id="%s" />',
            $formAttribute['widget'],
            $this->getAttributeValue( $formAttribute, $key ),
            $this->getAttributeHtmlName( $formAttribute, $key ),
            implode( ' ', $formAttribute['classes'] ),
            $this->getAttributeHtmlId( $formAttribute, $key )
        );
    } # }}}

    public function renderTextareaWidget( &$formAttribute, $key = null ) { # {{{
        return sprintf(
            '<textarea name="%s" class="%s" id="%s">%s</textarea>',
            $this->getAttributeHtmlName( $formAttribute, $key ),
            implode( ' ', $formAttribute['classes'] ),
            $this->getAttributeHtmlId( $formAttribute, $key ),
            $this->getAttributeValue( $formAttribute, $key )
        );
    } # }}}

    public function renderTextWidget( &$formAttribute, $key = null ) {
        return $this->renderInputWidget( $formAttribute, $key );
    }

    public function renderImageWidget( &$formAttribute, $key = null ) {
        $html = $this->renderFileWidget( $formAttribute, $key );
        if  ( $value = $this->getAttributeValue( $formAttribute, $key ) ) {
            $html .= sprintf(
                '<img src="%s" />',
                $this->thumbnail($value, 30, 30 )
            );
        }
        return $html;
    }

    public function renderFileWidget( &$formAttribute, $key = null ) {
        $html = array();
        $html[] = sprintf(
            '<input type="file" name="%s" class="%s" id="%s" />',
            $this->getAttributeHtmlName( $formAttribute, $key ),
            implode( ' ', $formAttribute['classes'] ),
            $this->getAttributeHtmlId( $formAttribute, $key )
        );
        
        if ( $value = $this->getAttributeValue( $formAttribute, $key ) ) {
            $html[] = sprintf(
                '<p class="formHint"><a href="%s">Voir le fichier actuel</a></p>',
                $this->getAbsoluteUploadUrl( $value )
            );
        }
        return implode("\n", $html);
    }

    public function renderMultiSelectWidget( &$formAttribute, $key = null ) {
        return $this->renderSelectWidget( $formAttribute, $key );
    }

    public function renderReadOnlyWidget( &$formAttribute, $key = null ) {
        return $this->getAttributeValue( $formAttribute, $key );
    }

    public function renderSelectWidget( &$formAttribute, $key = null ) { # {{{
        $html  = array(  );

        $html[] = sprintf(
            '<select "%s" name="%s" class="%s" id="%s" />',
            !empty( $formAttribute['multiple'] ) ? 'multiple="multiple"' : '',
            $this->getAttributeHtmlName( $formAttribute, $key ),
            implode( ' ', $formAttribute['classes'] ),
            $this->getAttributeHtmlId( $formAttribute, $key )
        );

        $html[] = '<option value="">-----</option>';

        $actualValue = $this->getAttributeValue( $formAttribute, $key );
        foreach( $formAttribute['choices'] as $value => $display ) {
            $selected = $value == $actualValue || ( is_array( $actualValue ) && in_array( $value, $actualValue ) );

            $html[] = sprintf( 
                '<option value="%s" %s>%s</option>',
                $value,
                $selected ? 'selected="selected"' : '',
                $display
            );
        }

        $html[] = '</select>';

        if ( !empty( $formAttribute['createRoute']) ) {
            $html[] = sprintf(
                '<p class="formHint"><a href="%s?displayAttribute=%s&valueAttribute=%s" id="add_%s" class="add-another">%s</a> %s</p>',
                madFramework::url( $formAttribute['createRoute'] ),
                $formAttribute['displayAttribute'],
                $formAttribute['valueAttribute'],
                $this->getAttributeHtmlId( $formAttribute, $key ),
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
