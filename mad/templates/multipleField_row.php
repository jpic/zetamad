<?php
$inputName = $this->form->name . '[' . $multipleFieldName . '][' . $count . ']';
$deleteName = $this->form->name . '[' . $multipleFieldName . '.DELETE][]';
?>
<tr>
    <td class="actualValue">
        <input type="text" value="<?php echo htmlentities( $multipleFieldValue ) ?>" name="<?php echo $inputName ?>" class="textInput" />
    </td>
    <td class="deleteField">
        <input class="deleteRow" type="button" value="Effacer" <?php if ( $count == 0 ): ?>disabled="disabled"<?php endif ?>  />
    </td>
</tr>
<?php
unset( $inputName );
unset( $deleteName );
?>
