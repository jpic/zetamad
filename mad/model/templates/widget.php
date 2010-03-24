<?php
/**
 * This templates renders a field with config $field and name $name.
 *
 * It is important not to output this: '
 */
?>

<?php if ( !isset( $field['widget'] ) ): ?>
<input name="<?php echo $name; ?>" id="<?php echo $name; ?>" type="text" class="textInput" />

<?php elseif ( $field['widget'] == 'textarea' ): ?>
<textarea name="<?php echo $name; ?>" id="<?php echo $name; ?>"></textarea>

<?php elseif ( $field['widget'] == 'autocomplete' ): ?>
<input name="<?php echo $name; ?>" id="<?php echo $name; ?>" type="text" class="textInput" />
    
    <?php if ( $field['choices'] ): ?>
    <script type="text/javascript">
    $(document).ready( function() {
        // try not to mess with other input fields in the page
        $("form.uniForm input[name=<?php echo $name; ?>]").autocomplete([
        "<?php echo join( '", "', $field['choices'] ) ?>"
        ]);
    });
    </script>
    <?php endif ?>

<?php endif ?>
