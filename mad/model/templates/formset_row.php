<tr class="formset_<?php echo $formsetName; ?>_form">
    <?php foreach( $formset->fields->options as $name => $field ):
        // skip fields with hard coded value (ie. namespace)
        if ( isset( $field->value ) ) continue;

        if ( isset( $field->errors ) ) {
            $errors = $field->errors;
        }
    ?>
    <td class="<?php if ( isset( $errors ) ) echo 'error' ?>">
    <?php 
    $inputName = $this->form->name . '[' . $formsetName . ']['. $count .'][' . $name . ']';
    
    include 'field_errors.php';
    include 'widget.php'; 
    unset( $inputName );
    if ( isset( $errors ) ) {
        unset( $errors );
    }
    ?>
    </td>
    <?php endforeach ?>
    <td class="formsetDeleteColumn">
        <input type="checkbox" name="<?php echo $this->form->name . '[' . $formsetName . ']['.$count.'][DELETE]' ?>" <?php if ( !isset( $formsetForm['id'] ) ): ?>disabled="disabled"<?php endif ?> />
        <?php if ( isset( $formsetForm['id'] ) ): ?>
        <input type="hidden" value="<?php echo $formsetForm['id'] ?>" name="<?php echo $this->form->name . '[' . $formsetName . ']['. $count .'][id]' ?>" />
        <?php endif ?>
    </td>
</tr>

