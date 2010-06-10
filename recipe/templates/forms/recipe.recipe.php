<?php include "form_css.php" ?>

<form action="" method="post" class="uniForm" enctype="multipart/form-data">
    <?php if ( ! $this->form->isValid ): ?>
    <div id="errorMsg">
        <h2>Pour enregistrer, révisez les valeurs des champs entourés de rouge.</h2>
    </div>
    <?php endif ?>

    <h2><?php echo ucfirst( $this->t( 'META.TITLE' ) ) ?></h2>

    <fieldset class="inlineLabels">
        <h3>Présentation générale</h3>
        <?php echo $this->renderFormFieldRow( 'title' ) ?>
        <?php echo $this->renderFormFieldRow( 'categories' ) ?>
        <?php echo $this->renderFormFieldRow( 'profile' ) ?>
        <?php echo $this->renderFormFieldRow( 'author' ) ?>
        <?php echo $this->renderFormFieldRow( 'cookTime' ) ?>
        <?php echo $this->renderFormFieldRow( 'prepTime' ) ?>
        <?php echo $this->renderFormFieldRow( 'restTime' ) ?>
        <?php echo $this->renderFormFieldRow( 'summary' ) ?>
        <?php echo $this->renderFormFieldRow( 'steps' ) ?>
        <?php echo $this->renderFormFieldRow( 'tags' ) ?>
    </fieldset>
    <fieldset class="inlineLabels">
        <h3>Illustrations</h3>
        <?php echo $this->renderFormFieldRow( 'pictures' ) ?>
        <?php echo $this->renderFormFieldRow( 'video' ) ?>
    </fieldset>
    <fieldset class="inlineLabels">
        <h3>Ingrédients</h3>
        <?php echo $this->renderFormFieldRow( 'yield' ) ?>
        <?php echo $this->renderFormFieldRow( 'ingredientQuantities' ) ?>
        <?php echo $this->renderFormFieldRow( 'ingredientProducts' ) ?>
        <?php echo $this->renderFormFieldRow( 'tools' ) ?>
        <?php echo $this->renderFormFieldRow( 'toolProducts' ) ?>
    </fieldset>
    <div class="buttonHolder">
      <!--
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      -->
      <button type="submit" class="primaryAction">Enregistrer</button>
    </div>

</form>
<?php include "form_js.php" ?>