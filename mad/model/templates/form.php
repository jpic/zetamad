<link rel="stylesheet" type="text/css" href="<?php echo $this->getAbsoluteStaticUrl( 'css/uni-form.css' ) ; ?>" />
<script type="text/javascript" src="<?php echo $this->getAbsoluteStaticUrl( 'js/uni-form.jquery.js' ) ; ?>"></script>

<form action="" method="post" class="uniForm">
    <fieldset class="inlineLabels">
    <?php foreach( $this->formConfiguration['fields'] as $name => $field ): ?>
        <?php
        // skip fields with hard coded value (ie. namespace)
        if ( isset( $field['value'] ) ) continue;
        ?>
    
        <div class="ctrlHolder">
            <label for="<?php echo $name; ?>"><?php if ( isset( $field['required'] ) ): ?><em>*</em> <?php endif ?><?php echo ucfirst( $field['label'] ); ?></label>

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
                    $('form.uniForm input[name=<?php echo $name; ?>]').autocomplete([
                    "<?php echo join( '", "', $field['choices'] ) ?>"
                    ]);
                });
                </script>
                <?php endif ?>

            <?php endif ?>

            <?php if ( isset( $field['help'] ) ): ?>
            <p class="formHint"><?php echo ucfirst( $field['help'] ); ?></p>
            <?php endif ?>
        </div>

    <?php endforeach ?>
    </fieldset>

    <div class="buttonHolder">
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      <button type="submit" class="primaryAction">Enregistrer</button>
    </div>

</form>

<script type="text/javascript">
$( 'form.uniForm input:first').focus();
</script>
