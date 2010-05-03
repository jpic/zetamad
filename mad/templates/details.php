<?php if ( isset( $this->configuration['title'] ) ): ?>
<h1><?php $this->e( ucfirst( $this->configuration['title'] ) ) ?></h1>
<?php else: ?>
<h1>Page de details d'object par défaut</h1>

<p>
Pour surcharger cette page, créer un template du nom de <?php echo $this->object['namespace'] ?>_details.php et utiliser $this->object dedans.
</p>

<p>
Pour changer ce titre et cacher le message ci-dessus, parametrer la variable de route "title".
</p>
<?php endif ?>

<table>
<?php foreach( $this->object as $key => $value ): ?>
    <tr>
        <th><?php $this->e( $key ) ?></th>
        <td><?php $this->e( $value ) ?></td>
    </tr>
<?php endforeach ?>
</table>
