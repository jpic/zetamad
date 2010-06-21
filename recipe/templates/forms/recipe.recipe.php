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
        
        <table>
        <?php $formSet = $this->form->formConfiguration['pictures']['form'] ?>
        <?php foreach( $this->prepareFormSet( $formSet )->data as $key => $row ): ?>
            <tr class="<?php echo $this->getTableRowFormSetClass( $formSet ) ?> formset">
                <td>
                     <?php echo $this->renderInputWidget( $formSet->formConfiguration['sortkey'], $key ) ?>
                </td>
                <td>
                    <?php echo $this->renderImageWidget( $formSet->formConfiguration['picture'], $key ) ?>
                </td>
                <td>
                    <?php echo $this->renderTextWidget( $formSet->formConfiguration['title'], $key ) ?>
                </td>
                <td>
                    <button class="primaryAction deleteRow" name="<?php echo $key ?>"><span><span>Effacer</span></span></button>
                    <?php if ( !empty( $row['id'] ) ): ?>
                    <input type="hidden" name="recipe_recipe[pictures][<?php echo $key ?>][id]" value="<?php echo $row['id'] ?>" />
                    <?php endif ?>
                </td>
            </tr>
        <?php endforeach ?>
        </table>
        <button disabled="disabled" class="formset_add"><span><span>Ajouter</span></span></button>
        <div class="formset_template" style="display: none;"><!--
            <tr class="<?php echo $this->getTableRowFormSetClass( $formSet ) ?> formset">
                <td>
                     <?php echo $this->renderInputWidget( $formSet->formConfiguration['sortkey'], 'voidKey' ) ?>
                </td>
                <td>
                    <?php echo $this->renderImageWidget( $formSet->formConfiguration['picture'], 'voidKey' ) ?>
                </td>
                <td>
                    <?php echo $this->renderTextWidget( $formSet->formConfiguration['title'], 'voidKey' ) ?>
                </td>
                <td>
                    <button class="primaryAction deleteRow" name="voidKey"><span><span>Effacer</span></span></button>
                </td>
            </tr>
        --></div>
        
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
    </fieldset>
    <fieldset class="inlineLabels">
        <h2>Ustensiles nécéssaires</h2>
        <?php echo $this->renderFormFieldRow( 'tools' ) ?>
        </fieldset>
    <fieldset class="inlineLabels">
        <h2>Ustensiles dans le catalogue Madeleine Market</h2>
        <?php echo $this->renderFormFieldRow( 'toolProducts' ) ?>
    </fieldset>
    <div class="buttonHolder">
      <!--
      <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
      -->
      <button type="submit" class="primaryAction">
        <span>
            <span>Enregistrer</span>
        </span>
      </button>
    </div>

</form>
<?php include "form_js.php" ?>
