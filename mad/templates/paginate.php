<?php if ( !empty( $this->lastPage ) && $this->lastPage > 1 ): ?>

    <table class="pagination" align="center">
        <tbody>
            <tr>
            <?php if ( $this->currentPage == 1 ): ?>
            <?php else: ?>
            <td class="pagination_previous"><a href="<?php echo $this->request->variables['prefixedUrl'] ?>?page=1">Premier</a>
            <td class="pagination_previous"><a href="<?php echo $this->request->variables['prefixedUrl'] ?>?page=<?php $this->e( $this->currentPage - 1 ) ?>">Précédent</a></td>
            <?php endif ?>

            <?php for( $i=1; $i <= $this->lastPage; $i++ ): ?>
            <td class="pagenumber"><a href="<?php echo $this->request->variables['prefixedUrl'] ?>?page=<?php $this->e( $i ) ?>"><?php $this->e( $i ) ?></a></td>
            <?php endfor ?>

            <?php if ( $this->currentPage == $this->lastPage ): ?>
            <?php else: ?>
            <td class="pagination_next"><a href="<?php echo $this->request->variables['prefixedUrl'] ?>?page=<?php $this->e( $this->currentPage + 1 ) ?>">Suivant</a></td>
            <td class="pagination_next"><a href="<?php echo $this->request->variables['prefixedUrl'] ?>?page=<?php $this->e( $this->lastPage ) ?>">Dernier</a></td>
            <?php endif ?>
            </tr>
        </tbody>
    </table>

<?php endif ?>