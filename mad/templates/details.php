<style>
/* Redondance du h2.title, possibilité de le mettre dans le global pour ne pas l'appeler à chaque page ? */
h2.title { float: left; border:medium none; color: #000000; font-family:'Times','Helvetica',serif; font-size:35px; font-weight:100; line-height:40px; margin: 15px 0 15px 0; }
.users_table { padding: 10px; font: normal 11px Verdana; }
.users_table .label { background: #f7f7f7; width: 250px; }
</style>
<?php if ( isset( $this->configuration['title'] ) ): ?>
<h2 class="title"><?php $this->e( ucfirst( $this->configuration['title'] ) ) ?></h2>
<?php else: ?>
<h2 class="title">D&eacute;tails indisponibles</h2>
<p>
    Pour surcharger cette page, créer un template du nom de <?php echo $this->object['namespace'] ?>_details.php et utiliser $this->object dedans.
</p>
<p>
    Pour changer ce titre et cacher le message ci-dessus, parametrer la variable de route "title".
</p>
<?php endif ?>

<table class="users_table">
<?php foreach( $this->object as $key => $value ): ?>
    <tr>
        <th class="label"><?php $this->e( ucfirst( $key ) ) ?></th>
        <td class="object"><?php $this->e( $value ) ?></td>
    </tr>
<?php endforeach ?>
</table>
