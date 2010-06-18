<form action="" method="POST">

    <table>
        <tr>
            <th>
                Cache
            </th>
            <th>
                Enabled?
            </th>
            <th>
                Do once
            </th>
            <th>
                Do once and submit
            </th>
            <th>
                Enable and submit
            </th>
            <th>
                Disable and submit
            </th>
        </tr>

        <?php foreach( $this->functions as $function ): ?>
        <tr>
            <td>
                <?php $this->uet( $function ) ?>
            </td>
            <td>
                <input type="checkbox" name="<?php echo $function ?>Enable" <?php if ( $this->framework->configuration['applications']['mad'][$function] ) echo ' checked="checked" ' ?> />
            </td>
            <td>
                <input type="checkbox" name="<?php echo $function ?>Once" value="Once" />
            </td>
            <td>
                <input type="submit" name="<?php echo $function ?>Once" value="Once" />
            </td>
            <td>
                <input type="submit" name="<?php echo $function ?>Enable" value="Enable" />
            </td>
            <td>
                <input type="submit" name="<?php echo $function ?>Disable" value="Disable" />
            </td>
        </tr>
        <?php endforeach ?>
    </table>
    
    <input type="submit" value="Save" />

</form>