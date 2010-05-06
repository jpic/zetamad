<?php if ( !count( $this->object->commentSet ) ): ?>
<p>Pas encore de commentaire</p>
<?php else: ?>
    <?php foreach( $this->iterate( $this->object->commentSet ) as $comment ): ?>
    <p><?php $this->e( $comment['comment'] ) ?></p>
    <p><?php $this->e( $comment['user']['firstName'] . ' ' . $comment['user']['lastName'] ) ?></p>
    <?php endforeach ?>
<?php endif ?>

<?php if ( $this->isAuthenticated(  ) ): ?>
<form action="<?php echo $this->url( 'comments.post', array( 'id' => $this->object ) ) ?>" method="post">
    <textarea name="comment"></textarea>
    <input type="hidden" name="object" value="<?php $this->e( $this->object['id'] ) ?>" />
    <input type="submit" value="Envoyer" />
</form>
<?php else: ?>
Pour envoyer votre commentaire, <a href="<?php echo $this->loginUrl(  ) ?>">authentifiez vous ici</a>
<?php endif ?>
