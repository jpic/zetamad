<style>
/* Redondance du h2.title, possibilité de le mettre dans le global pour ne pas l'appeler à chaque page ? */
h2.title { color: #000000; font-family:'Times','Helvetica',serif; font-size:35px; font-weight:100; line-height:40px; margin: 15px 0 15px 0; }
.object_table { font: normal 14px Lucida, "Lucida Sans", Arial, sans-serif; }
.object_table .label { text-align: right; padding: 0 10px 0 0; line-height: 25px; background: #f7f7f7; width: 200px; font-weight: bold; }
.object_table .value { text-align: left; padding: 0 0 0 10px; line-height: 25px; }
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

<table class="object_table" cellspacing="3" cellspading="3">
        <tr>
            <td colspan="2">
                <a href="#" style="line-height: 25px; font-weight: bold; color: #666; float: left; font-size: 11px;">&laquo; Retour</a>
            </td>
        </tr>
<? if ( isset( $this->configuration['fields'] ) ): ?>
    <?php foreach( $this->configuration['fields'] as $key => $label ): ?>
        <?php if ( !isset( $this->object[$key] ) ) continue; ?>

        <tr>
            <th class="label"><?php $this->e( ucfirst( $label ) ) ?></th>
            <td class="value"><?php $this->e( $this->object[$key] ) ?></td>
        </tr>
    <?php endforeach ?>
<?php else: ?>
    <?php foreach( $this->object as $key => $value ): ?>
        <tr>
            <th class="label"><?php $this->e( ucfirst( $key ) ) ?></th>
            <td class="value"><?php $this->e( $value ) ?></td>
        </tr>
    <?php endforeach ?>
<?php endif ?>
        <tr>
            <td colspan="2">
                <a href="#" style="line-height: 25px; float: right; font-weight: bold; color: #DE5161; font-size: 14px;">Modifier ce profil</a>
            </td>
        </tr>
</table>
