<?php
/**
 * This templates renders a field with config $field and name $name with $form.
 */
if ( !isset( $inputName ) ) {
    $inputName = sprintf( '%s[%s]', $form->name, $name );
}

$class = str_replace( array( '.', '[', ']' ), array( '__', '__', '' ), $inputName );
?>

<?php if ( !isset( $field->widget ) ): ?>
    <input value="<?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $name; ?>" type="text" class="textInput" />

<?php elseif ( $field->widget->class == 'wysiwyg' ): ?>
    <textarea class="ckeditor" name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>"><?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?></textarea>

<?php elseif ( $field->widget->class == 'textarea' ): ?>
    <textarea name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>"><?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?></textarea>

<?php elseif ( $field->widget->class == 'autocomplete' ): ?>
    <input autocomplete="off" value="<?php if ( isset( $form[$name] ) ) $this->e( $field->widget->displayValue ) ?>" name="autocomplete_<?php echo $inputName; ?>" id="<?php echo $inputName; ?>" type="text" class="textInput <?php $this->e( $class ); ?>" />
    <input value="<?php if ( isset( $form[$name] ) ) $this->e( $field->widget->actualValue ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>" type="hidden" class="textInput" />
    
    <script type="text/javascript">
    $(document).ready( function() {
        // try not to mess with other input fields in the page
        $("form.uniForm input[name=\"autocomplete_<?php echo $inputName; ?>\"]").autocomplete(
            "<?php echo $this->generateUrl( $field->widget->route ) ?> ", {
                onItemSelect: function( item ) {
                    $("form.uniForm input[name=\"<?php echo $inputName; ?>\"]").val( item.extra[0] );
                }
            }
        );

        <?php if ( !isset( $field->widget->createRoute ) ): ?>
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

    <?php if ( isset( $field->widget->createRoute ) ): ?>
    <p class="formHint">
        <a class="add_anoter_<?php $this->e( $class ) ?>" href="<?php echo $this->generateUrl( $field->widget->createRoute ) ?>" >Cliquez ici pour en créer un nouveau</a>, si votre choix n'est pas dans la liste.
    </p>
    <?php endif ?>

<?php elseif ( $field->widget->class == 'file' ): ?>
    <input value="<?php if ( isset( $form[$name] ) ) $this->e( $form[$name] ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $name; ?>" type="file" class="fileInput" />
    
    <?php if ( isset( $form[$name] ) ): ?>
    <p class="formHint">
        <a target="_blank" href="<?php echo $this->getAbsoluteUploadUrl( $form[$name] ) ?>">Voir le fichier actuel</a>
    </p>
    <?php endif ?>


<?php endif ?>
<?php if ( isset( $field->widget ) && isset( $field->widget->class ) ) $widgets[] = $field->widget->class ?>
<?php 
unset( $inputName );
unset( $class );
?>
