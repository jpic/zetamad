<?php if ( isset( $this->object['id'] ) ): ?>
Editing object <?php echo $this->object['id'] ?>
<?php else: ?>
Creating obejct
<?php endif; ?>

<form action="" method="post">
    <input type="text" name="title" value="<?php echo isset( $this->object['title'] ) ? $this->object['title'] : ""; ?>"/>
    <input type="submit" />
</form>
