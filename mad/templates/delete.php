<h2><?php echo $this->t( 'deleteTitle', $this->object ) ?></h2>

<p>
    <?php echo $this->t( 'deleteQuestion', $this->object ) ?>
</p>

<form action="" method="post">
    <input type="submit" name="confirmDelete" value="<?php echo $this->t( 'deleteButton', $this->object ) ?>" />
</form>
