<style>
.button { cursor: pointer; }
fieldset.comment textarea { font-family: Verdana; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; line-height: normal; font-size-adjust: none; font-stretch: normal; width: 400px; height: 80px; }
fieldset.comment input.textInput { width: 400px; }
span.commentTitle, span.commentInfo { font-family: Verdana; font-style: normal; font-variant: normal; font-weight: bold; font-size: 14px; line-height: normal; font-size-adjust: none; font-stretch: normal; -x-system-font: none; color: rgb(132, 132, 132); }
</style>
<div class="product-tab">
    <div style="clear: left; width: 735px; overflow: auto; margin: 15px 0pt;">
        <div class="title-tab" style="padding-bottom: 5px; margin-bottom: 0px;">Commentaires</div>
        <?php if ( empty( $this->comments ) ): ?>
        
        <p>
            <?php $this->et( 'noCommentsYet' ) ?>
        </p>

        <?php else: ?>

        <table class="std" style="width: 99%; margin-left: 5px; margin-top: 10px; color: rgb(102, 102, 102);">
            <?php foreach( $this->comments as $comment ): ?>
            <tr>
                <td style="vertical-align: top; padding-top: 5px;">
                    <a name="c<?php echo $comment['id'] ?>"></a>
                    <div style="padding: 10px 0pt 0pt; float: left;">
                        <?php if ( !empty($comment['title'])): ?>
                        <span class="commentTitle">
                            <?php $this->e( $comment['title'] ) ?>
                        </span>
                        <?php endif ?>
                        <span class="commentInfo">
                            Par &nbsp;<?php $this->e( $comment['userFirstName'] . ' ' . $comment['userLastName'] ) ?>, <?php echo $this->date( $comment['created'] ) ?>
                        </span>
                    </div>
                    <h5 style="font-weight: normal;">
                        <p style="clear: both; font-size: 12px; margin: 0px; line-height: 20px; color: rgb(102, 102, 102);">
                        <?php $this->e( $comment['body'] ) ?>
                        </p>
                    </h5>
                </td>
            </tr>

            <?php endforeach ?>
        </table>
        <?php endif ?>

        <?php if ( $this->isAuthenticated ): ?>
        <form action="<?php $this->url( 'comment.post', array( 'relatedNamespace' => $this->object['namespace'], 'relatedId' => $this->object['id'] ) ) ?>?next=<?php $this->e( $_SERVER['REQUEST_URI'] ) ?>" method="post" class="uniForm" enctype="multipart/form-data">
        <fieldset style="border: medium none ; padding: 0px 10px 10px; width: 55%;" class="comment">
            Titre<br>
                <?php echo $this->renderTextWidget( $this->commentForm->formConfiguration['title'] ) ?>

		<p>
		Commentaire<br>
                <?php echo $this->renderTextareaWidget( $this->commentForm->formConfiguration['body'] ) ?>

                </p>
		<p class="submit">
                    <input class="button" name="submitMessage" value="Envoyer" type="submit">

		</p>
	</fieldset>
        </form>


        <?php else: ?>

        <div id="idTab5">
            <p><a href="<?php echo $this->loginUrl ?>">Identifiez-vous ou cr&eacute;ez votre compte pour laisser un commentaire.</a></p>
        </div>

        <?php endif ?>
    </div>
</div>
