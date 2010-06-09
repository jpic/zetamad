<style>
    h2.title { float: left; color: #000000; font-family:'Times','Helvetica',serif; font-size:35px; font-weight:100; line-height:40px; margin: 15px 0 15px 0; }
    a.add_user { color: #DE5161; font-size: 11px; font-weight: bold; float: right; line-height: 40px; display: block; margin: 15px 0 15px 0; }
    .object_table { margin: 0 auto; width: 95%; }
    .object_head { background: #f6f6f6; }
    .object_table thead.object_head { font-size: 14px; line-height: 25px; font-family: Lucida, "Lucida Sans", Arial, sans-serif; }
    .object_table tbody { font-size: 12px; line-height: 21px; }
    .object_table tbody tr:hover { background: #f6f6f6; cursor: pointer; }
    .object_table tbody tr:active { background: #f1f1f1;}
    .object_table tbody .row_name { padding-left: 4px; }
    .object_table tbody .row_details { text-align: center; }
    .object_table tbody .row_details a { color: #000; }
    .object_table tbody .row_details a:hover { text-decoration: underline; }
</style>

<?php if ( !empty( $this->framework->routeConfiguration['createRoute'] ) ): ?>
    <a class="add_user" href="<?php echo $this->url( $this->framework->routeConfiguration['createRoute'] ) ?>">
        <?php $this->e( isset( $this->framework->routeConfiguration['createLabel'] ) ? ucfirst( $this->framework->routeConfiguration['createLabel'] ) : 'Nouvelle saisie' ) ?> &raquo;
    </a>
<?php endif ?>

<?php if ( !empty( $this->framework->routeConfiguration['links'] ) ): ?>
<ul>
    <?php foreach( $this->framework->routeConfiguration['links'] as $routeName ): ?>
    <li>
        <a href="<?php $this->url( $routeName ) ?>">
            <?php $this->et( $routeName ) ?>
        </a>
    </li>
    <?php endforeach ?>
</ul>
<?php endif ?>

<?php if ( !count( $this->objectList ) ): ?>
<p>
    <?php $this->e( isset( $this->framework->routeConfiguration['ifEmpty'] ) ? ucfirst( $this->framework->routeConfiguration['ifEmpty'] ) : 'Aucun objet trouvé' ) ?>
</p>
<?php else: ?>

    <?php if (!empty($this->framework->routeConfiguration['actions'])): ?>
<script type="text/javascript">
$(document).ready(function() {
    $('form#actionForm input[type=checkbox][name=selectAll]').change(function() {
        $('input[type=checkbox]').attr('checked', $(this).attr('checked') );
    });
    $('form#actionForm input[type=checkbox][name=selectAll]').attr( 'disabled', '' );

    $('form#actionForm select[name=action]').click(function() {
        <?php foreach($this->framework->routeConfiguration['actions'] as $routeName ): ?>
        if ( $(this).val() != '0' ) {
            $(this).parents('form').attr( 'action', $(this).val() );
        } else {
            return false;
        }
        <?php endforeach ?>
    });
    $('form#actionForm select[name=action]').attr('disabled', '');
    $('form#actionForm input[name=go]').attr('disabled', '');
})
</script>

    <form action="" method="post" id="actionForm">
        Action:
        <select name="action" disabled="disabled">
            <option value="9"><?php $this->e( $this->t( 'selectAction' ) ) ?></option>
            <?php foreach($this->framework->routeConfiguration['actions'] as $routeName ): ?>
            <option value="<?php $this->url( $routeName ) ?>">
                <?php $this->et( $routeName ) ?>
            </option>
            <?php endforeach ?>
        </select>
        <input disabled="disabled" onclick="javascript: return confirm( '<?php $this->uet( 'confirmAction' ) ?>' )" type="submit" name="go" value="<?php $this->uet('do') ?>" />
    <?php endif ?>

    <table class="object_table">
        <thead class="object_head" >
            <tr>
                <?php if (!empty($this->framework->routeConfiguration['actions'])): ?>
                <td>
                    <input type="checkbox" name="selectAll" disabled="disabled" />
                </td>
                <?php endif ?>
                <?php foreach( $this->framework->routeConfiguration['tableColumns'] as $name ): ?>
                <th><?php $this->uet( $name ) ?></th>
                <?php endforeach ?>

                <?php if ( isset( $this->framework->routeConfiguration['tableLinkColumns'] ) ): ?>
                <?php foreach( $this->framework->routeConfiguration['tableLinkColumns'] as $route  ): ?>
                <th><?php $this->uet( $route ) ?></th>
                <?php endforeach ?>
                <?php endif ?>
            </tr>
        </thead>
        <tbody>
    <?php foreach( $this->objectList as $object ): ?>
            <!--<tr onClick='document.location.href="";'>-->
            <tr>
                <?php if (!empty($this->framework->routeConfiguration['actions'])): ?>
                <td>
                    <input type="checkbox" name="ids[]" value="<?php echo $object['id'] ?>" />
                </td>
                <?php endif ?>

                <?php foreach( $this->framework->routeConfiguration['tableColumns'] as $key ): ?>
                <td class="row_name">
                    <?php $this->e( $this->getValueString( $object, $key ) ) ?>
                </td>
                <?php endforeach ?>

                <?php if ( isset( $this->framework->routeConfiguration['tableLinkColumns'] ) ): ?>
                <?php foreach( $this->framework->routeConfiguration['tableLinkColumns'] as $route ): ?>
                <td class="row_details">
                    <a href="<?php echo $this->url( $route, $object ) ?>" title="<?php $this->uet( $route ) ?>">
                        <?php $this->uet( $label ) ?>
                    </a>
                </td>
                <?php endforeach ?>
                <?php endif ?>
            </tr>
    <?php endforeach ?>
        </tbody>
    </table>

    <?php if (!empty($this->framework->routeConfiguration['actions'])): ?>
    </form>
    <?php endif ?>


<?php endif ?>
