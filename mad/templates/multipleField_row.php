<?php
$inputName = $this->form->name . '[' . $multipleFieldName . '][' . $count . ']';
$value = $multipleFieldValue;
$field = $multipleField;
$name = $multipleFieldName;
?>
<tr>
    <td class="actualValue">
        <?php include 'widget.php' ?>
    </td>
    <td class="deleteField">
        <input class="deleteRow" type="button" value="Effacer" <?php if ( $count == 0 ): ?>disabled="disabled"<?php endif ?>  />
    </td>
</tr>
<?php
unset( $inputName );
unset( $value );
unset( $field );
unset( $name );
?>
