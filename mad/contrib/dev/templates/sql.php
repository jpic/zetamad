<?php if ( isset( $this->request->variables['sql'] ) ): ?>
<h2>Your input</h2>
<pre class="sh_sql"><?php echo trim( $this->request->variables['sql'] ) ?></pre>

<h2>Rewrote to</h2>
<pre class="sh_sqlol"><?php echo wordwrap( $this->newSql, 100 ) ?></pre>

<script type="text/javascript" src="http://shjs.sourceforge.net/sh_main.min.js" />
<script type="text/javascript" src="http://shjs.sourceforge.net/sh_sql.min.js" />
<script type="text/javascript">sh_highlightDocument();</script>

<?php endif ?>

<form action="" method="post">
    <textarea name="sql" style="width:100%%; height: 200px;"></textarea>
    <br />
    <input type="submit" />
</form>

<?php if ( isset( $this->rows ) ): ?>
    <table style="width:100%">
    <?php foreach( $this->rows as $row ): ?>
        <?php if ( !isset( $thead ) ): ?>
        <thead>
            <tr>
            <?php foreach( $row as $column => $value ): ?>
                <th><?php echo $column ?></th>
            <?php endforeach ?>
            </tr>
        </thead>
        <tbody>
        <?php endif; $thead=true ?>

        <tr>
        <?php foreach( $row as $column => $value ): ?>
            <td>
                <?php echo $value ?>
            </td>
        <?php endforeach ?>
        </tr>
    <?php endforeach ?>
        </tbody>
    </table>
<?php endif ?>
