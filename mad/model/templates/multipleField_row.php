<?php
$inputName = $this->form->name . '[' . $multipleFieldName . '][' . $count . ']';
$deleteName = $this->form->name . '[' . $multipleFieldName . '.DELETE][]';
?>
<tr>
    <td>
        <input type="text" value="<?php echo htmlentities( $multipleFieldValue ) ?>" name="<?php echo $inputName ?>" />
    </td>
    <td>
        <input type="checkbox" name="<?php echo $deleteName ?>" <?php if ( !$multipleFieldValue ): ?>disabled="disabled"<?php endif ?> value="<?php echo $count ?>" />
    </td>
</tr>
<?php
unset( $inputName );
unset( $deleteName );
?>
