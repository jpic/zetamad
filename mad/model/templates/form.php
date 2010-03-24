<link rel="stylesheet" type="text/css" href="<?php echo $this->getAbsoluteStaticUrl( 'css/uni-form.css' ) ; ?>" />
<script type="text/javascript" src="<?php echo $this->getAbsoluteStaticUrl( 'js/uni-form.jquery.js' ) ; ?>"></script>

<form action="" method="post" class="uniForm">
    <fieldset class="inlineLabels">
        <legend><?php echo ucfirst( $this->formConfiguration['label'] ) ?></legend>
        <?php foreach( $this->formConfiguration['fields'] as $name => $field ):
            // skip fields with hard coded value (ie. namespace)
            if ( isset( $field['value'] ) ) continue;
        ?>
    
        <div class="ctrlHolder">
            <label for="<?php echo $name; ?>"><?php if ( isset( $field['required'] ) ): ?><em>*</em> <?php endif ?><?php echo ucfirst( $field['label'] ); ?></label>

            <?php include 'widget.php'; ?>

            <?php if ( isset( $field['help'] ) ): ?>
            <p class="formHint"><?php echo ucfirst( $field['help'] ); ?></p>
            <?php endif ?>
        </div>

        <?php endforeach ?>
    </fieldset>

    <?php foreach( $this->formConfiguration['formsets'] as $formsetName => $formset ): ?>
    <fieldset class="formset_<?php echo $formsetName; ?> formset">
        <legend><?php echo ucfirst( $formset['label'] ) ?></legend>
        <table>
            <thead>
                <tr>
                    <?php foreach( $formset['fields'] as $name => $field ):
                        // skip fields with hard coded value (ie. namespace)
                        if ( isset( $field['value'] ) ) continue;
                    ?>
                    <th><?php echo ucfirst( $field['label'] ) ?></th>
                    <?php endforeach ?>
                    <th>Effacer</th>
                </tr>
            </thead>
            <tbody>
                <tr class="formset_<?php echo $formsetName; ?>_form">
                <?php foreach( $formset['fields'] as $name => $field ):
                    // skip fields with hard coded value (ie. namespace)
                    if ( isset( $field['value'] ) ) continue;
                ?>
                    <td>
                    <?php $name = 'formset_' . $formsetName . '_form1' . '_' . $name; /* formset hack */ ?>
                    <?php include 'widget.php'; ?>
                    </td>
                <?php endforeach ?>
                    <td>
                        <input type="checkbox" name="<?php echo 'formset_' . $formsetName . '_form1' . '_DELETE' ?>" id="<?php echo 'formset_' . $formsetName . '_form1' . '_DELETE' ?>" />
                    </td>
                </tr>
            </tobdy>
        </table>
        <button class="formset_add">Ajouter</button>
    </fieldset>
    <?php endforeach ?>

    <div class="buttonHolder">
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      <button type="submit" class="primaryAction">Enregistrer</button>
    </div>

</form>

<script type="text/javascript">
$(document).ready( function(  ) {
    $( 'form.uniForm input:first' ).focus(  );
    $( 'button.formset_add' ).click( function( e ) {
        e.preventDefault(  );
        var table = $('button.formset_add').parent().children('table');
        var count = table.children('tbody').children('tr').length;
        var next = count + 1;
        var tr = $('button.formset_add').parent().children('table').children('tbody').children('tr:first').clone().appendTo(table);

        tr.find('input[type=checkbox]').attr('disabled', 'disabled');
    
        tr.find('input').each(function() {
            $(this).val('');
            $(this).attr('name', $(this).attr('name').replace(/form1/, 'form' + next));
            $(this).attr('id', $(this).attr('id').replace(/form1/, 'form' + next));
        });
    });
});
</script>
