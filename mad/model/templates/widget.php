<?php
/**
 * This templates renders a field with config $field and name $name with $form.
 */
if ( !isset( $inputName ) ) {
    $inputName = sprintf( '%s[%s]', $form->name, $name );
}

$class = str_replace( array( '.', '[', ']' ), array( '__', '__', '' ), $inputName );

$htmlClasses = "";
if ( isset( $field->required ) ) $htmlClasses .= "required ";
if ( isset( $field->minLength ) ) $htmlClasses.= "validate_minlength {$field->minLength} ";
if ( isset( $field->maxLength ) ) $htmlClasses.= "validate_maxlength {$field->maxLength} ";
?>

<?php if ( !isset( $field->class ) ): ?>
    <input value="<?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $name; ?>" type="text" class="textInput <?php $this->e( $htmlClasses ) ?>" />

<?php elseif ( $field->class == 'wysiwyg' ): ?>
    <textarea class="wysiwyg <?php $this->e( $htmlClasses ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>"><?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?></textarea>

<?php elseif ( $field->class == 'textarea' ): ?>
    <textarea class=" <?php $this->e( $htmlClasses ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>"><?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?></textarea>

<?php elseif ( $field->class == 'autocomplete' ): ?>
    <input autocomplete="off" value="<?php if ( isset( $form[$name] ) ) $this->e( $field->displayValue ) ?>" name="autocomplete_<?php echo $inputName; ?>" id="<?php echo $inputName; ?>" type="text" class="textInput <?php $this->e( $class ); ?> <?php $this->e( $htmlClasses ) ?>" />
    <input value="<?php if ( isset( $form[$name] ) ) $this->e( $field->actualValue ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>" type="hidden" class="textInput" />
    
    <script type="text/javascript">
    $(document).ready( function() {
        // try not to mess with other input fields in the page
        $("form.uniForm input[name=\"autocomplete_<?php echo $inputName; ?>\"]").autocomplete(
            "<?php echo $this->generateUrl( $field->route ) ?> ", {
                onItemSelect: function( item ) {
                    $("form.uniForm input[name=\"<?php echo $inputName; ?>\"]").val( item.extra[0] );
                }
            }
        );

        <?php if ( !isset( $field->createRoute ) ): ?>
        $("form.uniForm input[name=\"autocomplete_<?php echo $inputName; ?>\"]").blur( function( e ) {
            var display = $("form.uniForm input[name=\"autocomplete_<?php echo $inputName; ?>\"]");
            var actual = $("form.uniForm input[name=\"<?php echo $inputName; ?>\"]");

            if ( display.val() && !actual.val() ) {
                actual.val( display.val(  ) );
            }
        });
        <?php endif ?>

    });
    </script>

    <?php if ( isset( $field->createRoute ) ): ?>
    <p class="formHint">
        <a class="add_anoter_<?php $this->e( $class ) ?>" href="<?php echo $this->generateUrl( $field->createRoute ) ?>" >Cliquez ici pour en créer un nouveau</a>, si votre choix n'est pas dans la liste.
    </p>
    <?php endif ?>

<?php elseif ( $field->class == 'file' ): ?>
    <input value="<?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $name; ?>" type="file" class="fileInput fileUpload <?php $this->e( $htmlClasses ) ?> " />
    
    <?php if ( isset( $form[$name] ) ): ?>
    <p class="formHint">
        <a target="_blank" href="<?php echo $this->getAbsoluteUploadUrl( $form[$name] ) ?>">Voir le fichier actuel</a>
    </p>
    <?php endif ?>


<?php endif ?>
<?php if ( isset( $field ) && isset( $field->class ) ) $widgets[] = $field->class ?>
<?php 
unset( $inputName );
unset( $class );
unset( $htmlClasses );
?>
