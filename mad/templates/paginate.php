<?php if ( $this->currentPage == 1 ): ?>
Premier Précedent
<?php else: ?>
<a href="<?php echo $this->request->uri ?>?page=1">Premier</a>
<a href="<?php echo $this->request->uri ?>?page=<?php $this->e( $this->currentPage - 1 ) ?>">Précédent</a>
<?php endif ?>

<?php for( $i=1; $i <= $this->lastPage; $i++ ): ?>
<a href="<?php echo $this->request->uri ?>?page=<?php $this->e( $i ) ?>"><?php $this->e( $i ) ?></a> 
<?php endfor ?>

<?php if ( $this->currentPage == $this->lastPage ): ?>
Suivant Dernier
<?php else: ?>
<a href="<?php echo $this->request->uri ?>?page=<?php $this->e( $this->currentPage + 1 ) ?>">Suivant</a>
<a href="<?php echo $this->request->uri ?>?page=<?php $this->e( $this->lastPage ) ?>">Dernier</a>
<?php endif ?>
