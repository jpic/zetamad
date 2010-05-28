<?php include "form_css.php" ?>
<form action="" method="post" class="uniForm" enctype="multipart/form-data">
    <?php if ( ! $this->form->isValid ): ?>
    <div id="errorMsg">
        <h2>Pour enregistrer, révisez les valeurs des champs entourés de rouge.</h2>
    </div>
    <?php endif ?>

    <h2><?php echo ucfirst( $this->t( 'META.TITLE' ) ) ?></h2>

    <fieldset class="inlineLabels">
    <?php echo $this->renderFormFields( $this->form ) ?>
    </fieldset>
    <div class="buttonHolder">
      <!--
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      -->
      <button type="submit" class="primaryAction">Enregistrer</button>
    </div>

</form>
<?php include "form_js.php" ?>