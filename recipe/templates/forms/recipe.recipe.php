<?php include "form_css.php" ?>
<form action="" method="post" class="uniForm" enctype="multipart/form-data">
    <?php if ( ! $this->form->isValid ): ?>
    <div id="errorMsg">
        <h2>Pour enregistrer, révisez les valeurs des champs entourés de rouge.</h2>
    </div>
    <?php endif ?>

    <h2><?php echo ucfirst( $this->metaTitle ) ?></h2>

    <fieldset class="inlineLabels">
        <h2>Présentation générale</h2>
        <?php echo $this->renderFormFieldRow( 'title' ) ?>
        <?php echo $this->renderFormFieldRow( 'categories' ) ?>
        <?php echo $this->renderFormFieldRow( 'tags' ) ?>
        <?php echo $this->renderFormFieldRow( 'profile' ) ?>
        <?php echo $this->renderFormFieldRow( 'author' ) ?>
        <?php echo $this->renderFormFieldRow( 'cookTime' ) ?>
        <?php echo $this->renderFormFieldRow( 'prepTime' ) ?>
        <?php echo $this->renderFormFieldRow( 'restTime' ) ?>
        <?php echo $this->renderFormFieldRow( 'summary' ) ?>
    </fieldset>
    <fieldset class="inlineLabels">
        <h2>Etapes</h2>
        <?php echo $this->renderFormFieldRow( 'steps' ) ?>
    </fieldset>
    <fieldset class="inlineLabels">
        <h2>Photos</h2>
        
        <?php echo $this->renderFormFieldRow( 'pictures' ) ?>
        
        <h2>Vid&eacute;o</h2>

        <?php echo $this->renderFormFieldRow( 'video' ) ?>
    </fieldset>
    <fieldset class="inlineLabels">
        <h2>Ingrédients</h2>
        <?php echo $this->renderFormFieldRow( 'yield' ) ?>
        <?php echo $this->renderFormFieldRow( 'calories' ) ?>
        <?php echo $this->renderFormFieldRow( 'ingredientQuantities' ) ?>
    </fieldset>
    <fieldset class="inlineLabels">
        <h2>Produits de la recette</h2>
        <?php echo $this->renderFormFieldRow( 'ingredientProducts' ) ?>
        <p class="formHint">
            Pour ajouter un produit du catalogue vous devez indiquer sa référence. Il s'agit du numéro dans l'URL de la page du produit sur Madeleinemarket.com
        </p>
    </fieldset>
    <fieldset class="inlineLabels">
        <h2>Ustensiles nécéssaires</h2>
        <?php echo $this->renderFormFieldRow( 'tools' ) ?>
        </fieldset>
    <fieldset class="inlineLabels">
        <h2>Ustensiles dans le catalogue Madeleine Market</h2>
        <?php echo $this->renderFormFieldRow( 'toolProducts' ) ?>
        <p class="formHint">
            Pour ajouter un produit du catalogue vous devez indiquer sa référence. Il s'agit du numéro dans l'URL de la page du produit sur Madeleinemarket.com
        </p>
    </fieldset>
    <div class="buttonHolder">
      <!--
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      -->
      <button type="submit" class="primaryAction"><span><span>Enregistrer</span></span></button>
    </div>

</form>
<?php include "form_js.php" ?>
