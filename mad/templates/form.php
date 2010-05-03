<link rel="stylesheet" type="text/css" href="<?php echo $this->url( 'mad.static', array( 'path' => '/css/uni-form.css' ) ) ; ?>" />
<script type="text/javascript" src="<?php echo $this->url( 'mad.static', array( 'path' => '/js/uni-form.jquery.js' ) ) ; ?>"></script>

<style type="text/css">
.uniForm .formset .textInput, 
.uniForm .formset .blockLabels .textInput, 
.uniForm .formset .blockLabels .fileUpload {
    width: 98%;
}
.formsetDeleteColumn {
    text-align: center;
}

.uniForm .inlineLabels .textInput, .uniForm .inlineLabels .fileUpload {
    width:70%;
}
.uniForm .inlineLabels label, .uniForm .inlineLabels .label {
    width:25%;
}
.uniForm .inlineLabels .formHint {
    margin-left:27%;
}
.uniForm .inlineLabels textarea {
    height:12em;
    width:70%;
}
.uniForm .formHint, .uniForm .blockLabels .formHint, .uniForm .formHint, .uniForm .blockLabels .formHint {
    width:auto;
}

table.formset {
    width: 99%;
}

.uniForm table.formset  textarea {
    height:18em;
    width:99%;
}

form.uniForm .required {
    font-size: 16.35px;
}

table.multipleField {
    width: 70%;
    float: left;
}

table.multipleField td.deleteField {
    text-align:right;
}

table.multipleField input[type=text].textInput {
    width: 100%;
}

</style>

<?php $widgets = array(  ) ?>

<form action="" method="post" class="uniForm" enctype="multipart/form-data">
    <?php if ( isset( $this->form->valid ) && !$this->form->valid ): ?>
    <div id="errorMsg">
        <h3>Pour enregistrer, révisez les valeurs des champs entourés de rouge.</h3>
    </div>
    <?php endif ?>

    <fieldset class="inlineLabels">
        <legend><?php echo ucfirst( $this->form->label ) ?></legend>
        <?php foreach( $this->form->fields->options as $name => $field ):
            // skip fields without label which should not be displayed
            if ( !isset( $field->label ) ) continue;
            // skip formsets/relations
            if ( $field instanceof madForm ) continue;
        ?>
    
        <div class="ctrlHolder <?php if ( isset( $field->errors ) ) echo 'error' ?>">
            <?php 
            if ( isset( $field->errors ) ) {
                $errors = $field->errors;
                include 'field_errors.php';
                unset( $errors );
            }
            ?>

            <?php
            if ( isset( $field->widget ) && $field->widget == 'checkbox' ): 
                $inputName = sprintf( '%s[%s]', $this->form->name, $name );

                if ( !isset( $inputId ) ) {
                    $inputId = 'id_' . str_replace(
                        array( '.', '-', '[', ']' ), 
                        array( '__dot__', '__dash__', '__braceleft__', '__braceright__'), 
                        $inputName
                    );
                }
                
                $htmlClasses = "";
                if ( isset( $field->required ) ) $htmlClasses .= "required ";

            ?>
                <p>
                <label class="inlineLabel" for="<?php echo $name; ?>">
                    <input value="1" checked="<?php if ( isset( $form[$name] ) ): var_dump( $form[$name] ) ?>checked<?php endif ?>" name="<?php echo $inputName ?>" id="<?php echo $inputId; ?>" type="checkbox" class="<?php $this->e( $htmlClasses ) ?>" />
                    <span><?php $this->e( $field->label ) ?> <?php if ( isset( $field->required ) ): ?><em>*</em><?php endif ?></span>
                </label>
                <p>

            <?php
                unset( $inputName );
            elseif ( isset( $field->widget ) && $field->widget == 'radio' ):
                $inputName = sprintf( '%s[%s]', $this->form->name, $name );

                if ( !isset( $inputId ) ) {
                    $inputId = 'id_' . str_replace( 
                        array( '.', '-', '[', ']' ), 
                        array( '__dot__', '__dash__', '__braceleft__', '__braceright__'), 
                        $inputName
                    );
                }
                
                $htmlClasses = "";
                if ( isset( $field->required ) ) $htmlClasses .= "required ";
            ?>
                <p class="label"><?php $this->e( ucfirst( $field->label ) ) ?><?php if ( isset( $field->required ) ): ?><em>*</em><?php endif ?></p>
                <div class="multiField">
                <?php
                foreach( $field->choices->options as $key => $choice ):
                    $choiceInputId = $inputId . '__' . $key;
                ?>
                <label class="blocklabel" for="<?php echo $choiceInputId; ?>">
                    <?php if ( is_numeric( $key ) ): ?>
                    <input value="<?php $this->e( $choice ) ?>" checked="<?php if ( isset( $form[$name] ) && $form[$name] == $choice ): ?>checked<?php endif ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputId; ?>" type="radio" class="<?php $this->e( $htmlClasses ) ?>" />
                    <?php else: ?>
                    <input value="<?php $this->e( $key ) ?>" checked="<?php if ( isset( $form[$name] ) && $form[$name] == $key ): ?>checked<?php endif ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputId; ?>" type="radio" class="<?php $this->e( $htmlClasses ) ?>" />
                    <?php endif ?>
                    <?php echo ucfirst( $choice ) ?>
                </label>
                <?php endforeach ?>
                </div>

            <?php 
                unset( $inputName );
            else: 
            ?>
                <label for="<?php echo $name; ?>"><?php if ( isset( $field->required ) ): ?><em>*</em> <?php endif ?><?php echo ucfirst( $field->label ); ?></label>
    
                <?php 
                $form = $this->form;
                include 'widget.php';
                unset( $form );
                ?>
    
                <?php if ( isset( $field->help ) ): ?>
                <p class="formHint"><?php echo ucfirst( $field->help ); ?></p>
                <?php endif ?>
            <?php endif ?>
        </div>

        <?php endforeach ?>

    <?php 
    if ( isset( $this->form->multipleFields ) ):
        foreach( $this->form->multipleFields->options as $multipleFieldName => $multipleField ):
    ?>
        <div class="ctrlHolder">
            <label>
            <?php $this->e( ucfirst( $multipleField->label ) ) ?>
            </label>
            
            <table class="multipleField">
                <tbody>
                    <?php
                    $count = 0;
                    if ( count( $this->form[$multipleFieldName] ) ):
                        foreach( $this->form[$multipleFieldName] as $multipleFieldValue ): 
                            include 'multipleField_row.php';
                            $count ++;
                        endforeach;

                    endif;
                    ?>
                </tbody>
            </table>

            <p  class="formHint">
                <?php $this->e( isset( $multipleField->help ) ? ucfirst( $multipleField->help ) : '' ) ?>
            </p>
            <button disabled="disabled" class="formset_add">Ajouter</button>
        </div>
    <?php
        endforeach;
    endif
    ?>
    </fieldset>

    <?php
    if ( isset( $this->form->formsets ) ):
        foreach( $this->form->formsets->options as $formsetName => $formset ):
    ?>
    <fieldset class="formset_<?php echo $formsetName; ?> formset">
        <legend><?php echo ucfirst( $formset->label ) ?></legend>
        <table class="formset">
            <thead>
                <tr>
                    <?php foreach( $formset->fields->options as $name => $field ):
                        // skip fields with hard coded value (ie. namespace)
                        if ( isset( $field->value ) ) continue;
                    ?>
                    <th><?php echo ucfirst( $field->label ) ?></th>
                    <?php endforeach ?>
                    <th>Effacer</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $count = 0;
                if ( count( $this->form[$formsetName] ) ):
                    foreach( $this->form[$formsetName] as $formsetKey => $formsetForm ): 
                        $form = $formsetForm;
                        include 'formset_row.php';
                        unset( $form );
                        unset( $formsetForm );
                        $count ++;
                    endforeach;
                endif;
                ?>
            </tbody>
        </table>
        <button disabled="disabled" class="formset_add">Ajouter</button>
    </fieldset>
    <?php
        endforeach;
    endif
    ?>

    <div class="buttonHolder">
      <!--
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      -->
      <button type="submit" class="primaryAction">Enregistrer</button>
    </div>

</form>

<script type="text/javascript" src="<?php echo $this->url( 'mad.static', array( 'path' => '/js/jquery.form.js' ) ) ; ?>"></script>
<script type="text/javascript" src="<?php echo $this->url( 'mad.static', array( 'path' => '/js/jquery.uni-form.js' ) ) ; ?>"></script>
<?php if ( in_array( 'wysiwyg', $widgets ) ): ?>
<script type="text/javascript" src="<?php echo $this->url( 'mad.static', array( 'path' => '/ckeditor/ckeditor.js' ) ) ; ?>"></script>
<?php endif ?>
<!--
<?php if ( in_array( 'autocomplete', $widgets ) ): ?>
<link rel="stylesheet" type="text/css" href="<?php echo $this->url( 'mad.static', array( 'path' => '/jquery-autocomplete/jquery.autocomplete.css' ) ) ; ?>" />
<script type="text/javascript" src="<?php echo $this->url( 'mad.static', array( 'path' => '/jquery-autocomplete/jquery.autocomplete.pack.js' ) ) ; ?>"></script>
<?php endif ?>
-->

<script type="text/javascript">
$(document).ready( function(  ) {
    $( 'form.uniForm input:first' ).focus(  );
    $( 'button.formset_add' ).click( function( e ) {
        e.preventDefault(  );
        var table = $(this).parent().children('table');
        var count = table.children('tbody').children('tr').length;
        var next = count;
        var tr = $(this).parent().children('table').children('tbody').children('tr:first').clone().appendTo(table);

        tr.find('input[type=checkbox]').attr('disabled', '');
        tr.find('input[type=button]').attr('disabled', '');
        tr.find('input[type=hidden]').val('');

        tr.find('textarea').each(function() {
            $(this).val('');
            $(this).attr('name', $(this).attr('name').replace(/\[0\]/, '['+next+']'));
            if ( $(this).attr( 'id' ) !== undefined ) {
                $(this).attr('id', $(this).attr('id').replace(/\[0\]/, '['+next+']'));
            }
        });

        tr.find('input').each(function() {
            if ( $(this).attr( 'name' ) !== undefined ) {
                $(this).attr('name', $(this).attr('name').replace(/\[0\]/, '['+next+']'));
            }

            if ( $(this).attr( 'id' ) !== undefined ) {
                $(this).attr('id', $(this).attr('id').replace(/\[0\]/, '['+next+']'));
            }
            
            if ( $(this).attr( 'type' ) != 'button' ) {
                $(this).val('');
            } else if ( $(this).hasClass( 'deleteRow' ) ) {
                $(this).click( function(  ) {
                    $(this).parents( 'tr' ).remove(  ); 
                })
            }
        });
    });


    $( 'input.deleteRow' ).click( function(  ) {
        $( this ).parents( 'tr' ).remove(  );
    })

    $( '.add-another' ).click(function(e) {
        e.preventDefault(  );
        showAddAnotherPopup( $( this ) );
    });
    
    // enable buttons
    $( 'button.formset_add' ).attr( 'disabled', '' );
});

/* Credit: django.contrib.admin (BSD) */

function showAddAnotherPopup(triggeringLink) {
    var name = triggeringLink.attr( 'id' ).replace(/^add_/, '');
    name = id_to_windowname(name);
    href = triggeringLink.attr( 'href' );

    if (href.indexOf('?') == -1) {
        href += '?popup=1';
    } else {
        href += '&popup=1';
    }

    href += '&winName=' + name;
    
    var win = window.open(href, name, 'height=500,width=800,resizable=yes,scrollbars=yes');
    win.focus();
    
    return false;
}
   
function dismissAddAnotherPopup(win, newId, newRepr) {
    // newId and newRepr are expected to have previously been escaped by
    // django.utils.html.escape.
    newId = html_unescape(newId);
    newRepr = html_unescape(newRepr);
    var name = windowname_to_id(win.name);
    var elem = document.getElementById(name);

    if (elem) {
        if (elem.nodeName == 'SELECT') {
            var o = new Option(newRepr, newId);
            elem.options[elem.options.length] = o;
            o.selected = true;
        } else if (elem.nodeName == 'INPUT') {
            if (elem.className.indexOf('vManyToManyRawIdAdminField') != -1 && elem.value) {
                elem.value += ',' + newId;
            } else {
                elem.value = newId;
            }
        }
    } else {
        console.log("Could not get input id for win " + name);
    }
    
    win.close();
}

function html_unescape(text) {
 // Unescape a string that was escaped using django.utils.html.escape.
    text = text.replace(/&lt;/g, '<');
    text = text.replace(/&gt;/g, '>');
    text = text.replace(/&quot;/g, '"');
    text = text.replace(/&#39;/g, "'");
    text = text.replace(/&amp;/g, '&');
    return text;
}

// IE doesn't accept periods or dashes in the window name, but the element IDs
// we use to generate popup window names may contain them, therefore we map them
// to allowed characters in a reversible way so that we can locate the correct
// element when the popup window is dismissed.
function id_to_windowname(text) {
    text = text.replace(/\./g, '__dot__');
    text = text.replace(/\-/g, '__dash__');
    text = text.replace(/\[/g, '__braceleft__');
    text = text.replace(/\]/g, '__braceright__');
    return text;
} 


function windowname_to_id(text) {
    return text;
}

</script>
