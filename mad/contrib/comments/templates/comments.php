<style>
.button { cursor: pointer; }
</style>
<div class="product-tab">
    <div style="clear: left; width: 735px; overflow: auto; margin: 15px 0pt;">
        <div class="title-tab" style="padding-bottom: 5px; margin-bottom: 0px;">Commentaires</div>
        <?php if ( !count( $this->object->commentSet ) ): ?>
        <p>Aucun commentaire n'a &eacute;t&eacute; publi&eacute; pour le moment.</p>
        <?php else: ?>
            <?php foreach( $this->object->commentSet as $comment ): ?>
            <p><?php $this->e( $comment['comment'] ) ?></p>
            <p><?php $this->e( $comment['user']['firstName'] . ' ' . $comment['user']['lastName'] ) ?></p>
            <?php endforeach ?>
        <?php endif ?>
        
        <?php if ( $this->isAuthenticated ): ?>
        <form action="<?php echo $this->url( 'comments.post', array( 'id' => $this->object ) ) ?>" method="post">
            <textarea style="font: 12px Verdana; width: 400px; height: 80px;" name="comment" class="input_create"></textarea>
            <input type="hidden" name="object" value="<?php $this->e( $this->object['id'] ) ?>" />
            <p class="submit">
                <input type="submit" value="Envoyer" class="button" />
            </p>
        </form>
        <?php else: ?>
        <div id="idTab5">
            <p><a href="<?php echo $this->loginUrl ?>">Identifiez-vous ou cr&eacute;ez votre compte pour laisser un commentaire.</a></p>
        </div>
        <?php endif ?>
    </div>
</div>
