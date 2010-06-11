<ul>
<?php foreach( $this->objectList as $object ): ?>
    <li>
        <a href="<?php $this->url( 'recipe.listByCategory', $object) ?>" title="<?php $this->e( $object['title'] ) ?>">
            <?php $this->e( $object['title'] ) ?>
        </a>
    </li>
<?php endforeach ?>
</ul>