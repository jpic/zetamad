<?php
$inputName = $this->form->name . '[' . $multipleFieldName . '][' . $count . ']';
?>
<tr>
    <td class="actualValue">
        <input type="text" value="<?php $this->e( $multipleFieldValue ) ?>" name="<?php echo $inputName ?>" class="textInput" />
    </td>
    <td class="deleteField">
        <input class="deleteRow" type="button" value="Effacer" <?php if ( $count == 0 ): ?>disabled="disabled"<?php endif ?>  />
    </td>
</tr>
<?php
unset( $inputName );
?>
