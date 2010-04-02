<link rel="stylesheet" type="text/css" href="<?php echo $this->getAbsoluteStaticUrl( 'css/uni-form.css' ) ; ?>" />
<script type="text/javascript" src="<?php echo $this->getAbsoluteStaticUrl( 'js/uni-form.jquery.js' ) ; ?>"></script>

<style type="text/css">
.uniForm .formset .textInput, 
.uniForm .formset .blockLabels .textInput, 
.uniForm .formset .blockLabels .fileUpload {
    width: 98%;
}
.formsetDeleteColumn {
    text-align: center;
}
</style>

<?php $widgets = array(  ) ?>

<form action="" method="post" class="uniForm">
    <fieldset class="inlineLabels">
        <legend><?php echo ucfirst( $this->form->label ) ?></legend>
        <?php foreach( $this->form->fields->options as $name => $field ):
            // skip fields with hard coded value (ie. namespace)
            if ( isset( $field->value ) ) continue;
            // skip formsets/relations
            if ( $field instanceof madForm ) continue;
        ?>
    
        <div class="ctrlHolder">
            <label for="<?php echo $name; ?>"><?php if ( isset( $field->required ) ): ?><em>*</em> <?php endif ?><?php echo ucfirst( $field->label ); ?></label>

            <?php 
            $form = $this->form;
            include 'widget.php';
            unset( $form );
            ?>

            <?php if ( isset( $field->help ) ): ?>
            <p class="formHint"><?php echo ucfirst( $field->help ); ?></p>
            <?php endif ?>
        </div>

        <?php endforeach ?>
    </fieldset>

    <?php foreach( $this->form->formsets->options as $formsetName => $formset ): ?>
    <fieldset class="formset_<?php echo $formsetName; ?> formset">
        <legend><?php echo ucfirst( $formset->label ) ?></legend>
        <table class="formset">
            <thead>
                <tr>
                    <?php foreach( $formset->fields->options as $name => $field ):
                        // skip fields with hard coded value (ie. namespace)
                        if ( isset( $field->value ) ) continue;
                    ?>
                    <th><?php echo ucfirst( $field->label ) ?></th>
                    <?php endforeach ?>
                    <th>Effacer</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $count = 0;
                if ( count( $this->form[$formsetName] ) ):
                    foreach( $this->form[$formsetName] as $formsetForm ): 
                        $form = $formsetForm;
                        include 'formset_row.php';
                        unset( $form );
                        unset( $formsetForm );
                        $count ++;
                    endforeach;
                else:
                    include 'formset_row.php';
                endif;
                ?>
            </tobdy>
        </table>
        <button disabled="disabled" class="formset_add">Ajouter</button>
    </fieldset>
    <?php endforeach ?>

    <div class="buttonHolder">
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      <button type="submit" class="primaryAction">Enregistrer</button>
    </div>

</form>

<?php if ( in_array( 'wysiwyg', $widgets ) ): ?>
<script type="text/javascript" src="<?php echo $this->getAbsoluteStaticUrl( 'ckeditor/ckeditor.js' ) ; ?>"></script>
<?php endif ?>
<!--
<?php if ( in_array( 'autocomplete', $widgets ) ): ?>
<link rel="stylesheet" type="text/css" href="<?php echo $this->getAbsoluteStaticUrl( 'jquery-autocomplete/jquery.autocomplete.css' ) ; ?>" />
<script type="text/javascript" src="<?php echo $this->getAbsoluteStaticUrl( 'jquery-autocomplete/jquery.autocomplete.pack.js' ) ; ?>"></script>
<?php endif ?>
-->

<script type="text/javascript">
$(document).ready( function(  ) {
    $( 'form.uniForm input:first' ).focus(  );
    $( 'button.formset_add' ).click( function( e ) {
        e.preventDefault(  );
        var table = $('button.formset_add').parent().children('table');
        var count = table.children('tbody').children('tr').length;
        var next = count;
        var tr = $('button.formset_add').parent().children('table').children('tbody').children('tr:first').clone().appendTo(table);

        tr.find('input[type=checkbox]').attr('disabled', 'disabled');
        tr.find('input[type=hidden]').remove();

        tr.find('input').each(function() {
            $(this).val('');
            $(this).attr('name', $(this).attr('name').replace(/\[0\]/, '['+next+']'));
            if ( $(this).attr( 'id' ) !== undefined ) {
                $(this).attr('id', $(this).attr('id').replace(/\[0\]/, '['+next+']'));
            }
        });
    });
    $( 'button.formset_add' ).attr( 'disabled', '' );
});
</script>
