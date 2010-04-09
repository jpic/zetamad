<?php
/**
 * This templates renders a field with config $field and name $name with $form.
 */
if ( !isset( $inputName ) ) {
    $inputName = sprintf( '%s[%s]', $form->name, $name );
}
?>

<?php if ( !isset( $field->widget ) ): ?>
    <input value="<?php if ( isset( $form[$name] ) ) echo htmlentities( $form[$name] ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $name; ?>" type="text" class="textInput" />

<?php elseif ( $field->widget->class == 'wysiwyg' ): ?>
    <textarea class="ckeditor" name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>"><?php if ( isset( $form[$name] ) ) echo htmlentities( $form[$name] ) ?></textarea>

<?php elseif ( $field->widget->class == 'textarea' ): ?>
    <textarea name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>"><?php if ( isset( $form[$name] ) ) echo htmlentities( $form[$name] ) ?></textarea>

<?php elseif ( $field->widget->class == 'autocomplete' ): ?>
    <input autocomplete="off" value="<?php if ( isset( $form[$name] ) ) echo htmlentities( $field->widget->displayValue ) ?>" name="autocomplete_<?php echo $inputName; ?>" id="<?php echo $inputName; ?>" type="text" class="textInput" />
    <input value="<?php if ( isset( $form[$name] ) ) echo htmlentities( $field->widget->actualValue ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $inputName; ?>" type="hidden" class="textInput" />
    
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

        $( "form.uniForm" ).submit( function(  ) {
            var display = $("form.uniForm input[name=\"autocomplete_<?php echo $inputName; ?>\"]");
            var actual = $("form.uniForm input[name=\"<?php echo $inputName; ?>\"]");

            if ( display.val() && !actual.val() ) {
                actual.val( display.val(  ) );
            }
        });
    });
    </script>

<?php elseif ( $field->widget->class == 'file' ): ?>
    <input value="<?php if ( isset( $form[$name] ) ) echo htmlentities( $form[$name] ) ?>" name="<?php echo $inputName; ?>" id="<?php echo $name; ?>" type="file" class="fileInput" />

<?php endif ?>
<?php if ( isset( $field->widget ) && isset( $field->widget->class ) ) $widgets[] = $field->widget->class ?>
<?php unset( $inputName ); ?>
