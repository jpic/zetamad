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

.uniForm .inlineLabels .textInput, .uniForm .inlineLabels .fileUpload {
    width:70%;
}
.uniForm .inlineLabels label, .uniForm .inlineLabels .label {
    width:25%;
}
.uniForm .inlineLabels .formHint {
    margin-left:27%;
}
.uniForm .inlineLabels textarea {
    height:12em;
    width:70%;
}

table.formset {
    width: 99%;
}

.uniForm table.formset  textarea {
    height:18em;
    width:99%;
}
</style>

<?php $widgets = array(  ) ?>

<form action="" method="post" class="uniForm" enctype="multipart/form-data">
    <?php if ( isset( $this->form->valid ) && !$this->form->valid ): ?>
    <div id="errorMsg">
        <h3>Pour enregistrer, révisez les valeurs des champs entourés de rouge.</h3>
    </div>
    <?php endif ?>

    <fieldset class="inlineLabels">
        <legend><?php echo ucfirst( $this->form->label ) ?></legend>
        <?php foreach( $this->form->fields->options as $name => $field ):
            // skip fields without label which should not be displayed
            if ( !isset( $field->label ) ) continue;
            // skip formsets/relations
            if ( $field instanceof madForm ) continue;
        ?>
    
        <div class="ctrlHolder <?php if ( isset( $field->errors ) ) echo 'error' ?>">
            <?php 
            if ( isset( $field->errors ) ) {
                $errors = $field->errors;
                include 'field_errors.php';
                unset( $errors );
            }
            ?>

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

    <?php 
    if ( isset( $this->form->multipleFields ) ):
        foreach( $this->form->multipleFields->options as $multipleFieldName => $multipleField ):
    ?>
    <fieldset class="multipleField_<?php echo $multipleFieldName ?>">
        <legend><?php echo ucfirst( $multipleField->label ) ?></legend>
        <table class="multipleField">
            <thead>
                <tr>
                    <td>&nbsp;</td>
                    <th>Effacer</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $count = 0;
                if ( count( $this->form[$multipleFieldName] ) ):
                    foreach( $this->form[$multipleFieldName] as $multipleFieldValue ): 
                        include 'multipleField_row.php';
                        $count ++;
                    endforeach;
                else:
                    $multipleFieldValue = '';
                    include 'multipleField_row.php';
                    unset( $multipleFieldValue );
                endif;
                ?>
            </tbody>
        </table>
        <button disabled="disabled" class="formset_add">Ajouter</button>
    </fieldset>
    <?php
        endforeach;
    endif
    ?>

    <?php
    if ( isset( $this->form->formsets ) ):
        foreach( $this->form->formsets->options as $formsetName => $formset ):
    ?>
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
                    foreach( $this->form[$formsetName] as $formsetKey => $formsetForm ): 
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
    <?php
        endforeach;
    endif
    ?>

    <div class="buttonHolder">
      <!--
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      -->
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
        var table = $(this).parent().children('table');
        var count = table.children('tbody').children('tr').length;
        var next = count;
        var tr = $(this).parent().children('table').children('tbody').children('tr:first').clone().appendTo(table);

        tr.find('input[type=checkbox]').attr('disabled', 'disabled');
        tr.find('input[type=hidden]').val('');

        tr.find('textarea').each(function() {
            $(this).val('');
            $(this).attr('name', $(this).attr('name').replace(/\[0\]/, '['+next+']'));
            if ( $(this).attr( 'id' ) !== undefined ) {
                $(this).attr('id', $(this).attr('id').replace(/\[0\]/, '['+next+']'));
            }
        });

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
