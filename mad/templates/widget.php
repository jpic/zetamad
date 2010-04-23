<?php
/**
 * This templates renders a field with config $field and name $name with $form.
 */
if ( !isset( $inputName ) ) {
    $inputName = sprintf( '%s[%s]', $form->name, $name );
}

if ( !isset( $inputId ) ) {
    $inputId = 'id_' . str_replace( 
        array( '.', '-', '[', ']' ), 
        array( '__dot__', '__dash__', '__braceleft__', '__braceright__'), 
        $inputName
    );
}

$htmlClasses = "";
if ( isset( $field->required ) ) $htmlClasses .= "required ";
if ( isset( $field->minLength ) ) $htmlClasses.= "validate_minlength {$field->minLength} ";
if ( isset( $field->maxLength ) ) $htmlClasses.= "validate_maxlength {$field->maxLength} ";

?>

<?php if ( !isset( $field->widget ) ): ?>
    <input value="<?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputId; ?>" type="text" class="textInput <?php $this->e( $htmlClasses ) ?>" />

<?php elseif ( $field->widget == 'wysiwyg' ): ?>
    <textarea class="wysiwyg <?php $this->e( $htmlClasses ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputId; ?>"><?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?></textarea>

<?php elseif ( $field->widget == 'textarea' ): ?>
    <textarea class=" <?php $this->e( $htmlClasses ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputId; ?>"><?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?></textarea>

<?php elseif ( $field->widget == 'select' ): ?>
    <select class="<?php $this->e( $htmlClasses ) ?>" name="<?php echo $inputName ?>" id="<?php echo $inputId ?>">
    <?php foreach( $field->choices as $value => $verbose ): ?>
        <option value="<?php $this->e( $value ) ?>" <?php if ( isset( $form[$name] ) && $value == $form[$name][$field->valueAttribute] ) echo 'selected="selected"' ?>><?php echo $verbose ?></option>
    <?php endforeach ?>
    </select>

    <?php if ( isset( $field->createRoute ) ): ?>
    <p class="formHint">
        <a class="add-another" id="add_<?php $this->e( $inputId ) ?>" href="<?php echo $this->generateUrl( $field->createRoute ) ?>?displayAttribute=<?php $this->e( $field->displayAttribute ) ?>&valueAttribute=<?php $this->e( $field->valueAttribute ) ?>" >Cliquez ici pour en créer un nouveau</a>, si votre choix n'est pas dans la liste.
    </p>
    <?php endif ?>

<?php elseif ( $field->widget == 'autocomplete' ): ?>
    <input autocomplete="off" value="<?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?>" name="<?php echo $inputName ?>" id="<?php echo $inputId ?>" type="text" class="textInput <?php $this->e( $htmlClasses ) ?>" />
    
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

    });
    </script>

    <?php if ( isset( $field->createRoute ) ): ?>
    <p class="formHint">
        <a class="add_<?php $this->e( $inputId ) ?>" href="<?php echo $this->generateUrl( $field->createRoute ) ?>" >Cliquez ici pour en créer un nouveau</a>, si votre choix n'est pas dans la liste.
    </p>
    <?php endif ?>

<?php elseif ( $field->widget == 'file' ): ?>
    <input class="<?php if ( isset( $form[$name] ) ) $this->e( 'hasValue' ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputId; ?>" type="file" class="fileInput fileUpload <?php $this->e( $htmlClasses ) ?> " />
    
    <?php if ( isset( $form[$name] ) ): ?>
    <p class="formHint">
        <a target="_blank" href="<?php echo $this->getAbsoluteUploadUrl( $form[$name] ) ?>">Voir le fichier actuel</a>
    </p>
    <?php endif ?>


<?php endif ?>
<?php if ( isset( $field ) && isset( $field->widget ) ) $widgets[] = $field->widget ?>
<?php 
unset( $inputName );
unset( $inputId );
unset( $htmlClasses );
?>
