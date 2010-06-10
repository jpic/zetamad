<style>
.button { cursor: pointer; }
</style>
<div class="product-tab">
    <div style="clear: left; width: 735px; overflow: auto; margin: 15px 0pt;">
        <div class="title-tab" style="padding-bottom: 5px; margin-bottom: 0px;">Commentaires</div>
        <?php if ( empty( $this->comment ) ): ?>
        
        <p>
            <?php $this->et( 'noCommentsYet' ) ?>
        </p>

        <?php else: ?>
            <?php foreach( $this->comment as $comment ): ?>
            <div style="float: left; padding: 10px 0pt 0pt;">
                <span style="font: 12px Verdana; color: rgb(132, 132, 132);">Par &nbsp;<?php $this->e( $comment['userFirstName'] . ' ' . $comment['userLastName'] ) ?></span>
            </div>

            <h5 style="font-weight: normal;">
                <p style="clear: both; font-size: 12px; margin: 0px; line-height: 20px; color: rgb(102, 102, 102);">
                <?php $this->e( $comment['body'] ) ?>
                </p>
            </h5>
            <?php endforeach ?>
        <?php endif ?>

        <?php if ( $this->isAuthenticated ): ?>

        <?php $this->includeTemplate( 'form_css.php' ) ?>

        <form action="<?php $this->url( 'comment.post', array( 'relatedNamespace' => $this->object['namespace'], 'relatedId' => $this->object['id'] ) ) ?>?next=<?php $this->e( $_SERVER['REQUEST_URI'] ) ?>" method="post" class="uniForm" enctype="multipart/form-data">
            <fieldset>
            <?php echo  $this->renderFormFields( $this->commentForm ) ?>
            </fieldset>

            <div class="buttonHolder">
              <!--
              <button type="reset" class="resetButton">Rétablir les valeurs initiales</button>
              -->
              <button type="submit" class="primaryAction">Enregistrer</button>
            </div>

        </form>

        <?php $this->includeTemplate( 'form_js.php' ) ?>

        <?php else: ?>

        <div id="idTab5">
            <p><a href="<?php echo $this->loginUrl ?>">Identifiez-vous ou cr&eacute;ez votre compte pour laisser un commentaire.</a></p>
        </div>

        <?php endif ?>
    </div>
</div>
