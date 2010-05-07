<style>
    h2.title { float: left; border:medium none; color: #000000; font-family:'Times','Helvetica',serif; font-size:35px; font-weight:100; line-height:40px; margin: 15px 0 15px 0; }
    a.add_user { color: #DE5161; font-size: 11px; font-weight: bold; float: right; line-height: 40px; display: block; margin: 15px 0 15px 0; }
    .object_table { margin: 0 auto; width: 95%; border-collapse: collapse; }
    .object_head { background: #f6f6f6; }
    .object_table thead.object_head { font-size: 14px; line-height: 25px; font-family: "Lucida", "Lucida Sans", Arial, sans-serif; }
    .object_table tbody { font-size: 12px; line-height: 21px; }
    .object_table tbody .row_name { padding-left: 4px; }
    .object_table tbody .row_details { text-align: center; }
    .object_table tbody .row_details a { color: #000; }
    .object_table tbody .row_details a:hover { text-decoration: underline; }
</style>
<?php if ( isset( $this->configuration['title'] ) ): ?>
<h2 class="title"><?php $this->e( ucfirst( $this->configuration['title'] ) ) ?></h1>
<?php else: ?>
<h2 class="title">Page de liste d'objets par defaut</h1>
<?php endif ?>

<?php if ( isset( $this->configuration['createRoute'] ) ): ?>
    <a class="add_user" href="<?php echo $this->url( $this->configuration['createRoute'] ) ?>">
        <?php $this->e( isset( $this->configuration['createLabel'] ) ? ucfirst( $this->configuration['createLabel'] ) : 'Nouvelle saisie' ) ?> &raquo;
    </a>
<?php endif ?>

<?php if ( !count( $this->objectList ) ): ?>
<p>
    <?php $this->e( isset( $this->configuration['ifEmpty'] ) ? ucfirst( $this->configuration['ifEmpty'] ) : 'Aucun objet trouvé' ) ?>
</p>
<?php else: ?>
<table class="object_table" border="1" bordercolor="#dadada">
    <thead class="object_head" >
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
            <td class="row_name"><?php $this->e( isset( $object[$name] ) ? $object[$name] : '' ) ?></td>
            <?php endforeach ?>
            
            <?php foreach( $this->configuration['tableLinkColumns'] as $route => $label ): ?>
            <td class="row_details">
                <a href="<?php echo $this->url( $route, $object ) ?>" title="<?php $this->e( ucfirst( $label ) ) ?>">
                    <?php $this->e( ucfirst( $label ) ) ?>
                </a>
            </td>
            <?php endforeach ?>
        </tr>
<?php endforeach ?>
    </tbody>
</table>
<?php endif ?>
