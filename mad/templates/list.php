<?php if ( isset( $this->configuration['title'] ) ): ?>
<h1><?php $this->e( ucfirst( $this->configuration['title'] ) ) ?></h1>
<?php else: ?>
<h1>Page de liste d'objets par defaut</h1>
<?php endif ?>

<?php if ( isset( $this->configuration['createRoute'] ) ): ?>
    <p>
        <a href="<?php echo $this->generateUrl( $this->configuration['createRoute'] ) ?>">
        <?php $this->e( isset( $this->configuration['createLabel'] ) ? ucfirst( $this->configuration['createLabel'] ) : 'Nouvelle saisie' ) ?>
        </a>
    </p>
<?php endif ?>

<?php if ( !count( $this->objectList ) ): ?>
<p>
    <?php $this->e( isset( $this->configuration['ifEmpty'] ) ? ucfirst( $this->configuration['ifEmpty'] ) : 'Aucun objet trouvé' ) ?>
</p>
<?php else: ?>
<table>
    <thead>
        <tr>
            <?php foreach( $this->configuration['tableColumns'] as $name => $label ): ?>
            <th><?php $this->e( ucfirst( $label ) ) ?></th>
            <?php endforeach ?>

            <?php foreach( $this->configuration['tableLinkColumns'] as $route => $label ): ?>
            <th><?php $this->e( ucfirst( $label ) ) ?></th>
            <?php endforeach ?>
        </tr>
    </thead>
    <tbody>
<?php foreach( $this->objectList as $object ): ?>
        <tr>
            <?php foreach( $this->configuration['tableColumns'] as $name => $label ): ?>
            <td><?php $this->e( isset( $object[$name] ) ? $object[$name] : '' ) ?></td>
            <?php endforeach ?>

            <?php foreach( $this->configuration['tableLinkColumns'] as $route => $label ): ?>
            <td>
                <a href="<?php echo $this->generateUrl( $route, $object ) ?>" title="<?php $this->e( ucfirst( $label ) ) ?>">
                    <?php $this->e( ucfirst( $label ) ) ?>
                </a>
            </td>
            <?php endforeach ?>
        </tr>
<?php endforeach ?>
    </tbody>
</table>
<?php endif ?>
