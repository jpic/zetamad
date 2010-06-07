<table>
    <thead>
        <tr>
            <th>
                Nom
            </th>
            <th>
                Pattern
            </th>
        </tr>
    </thead>
    <tbody>
        <?php foreach( $this->routes as $route ): ?>
        <tr>
            <td>
                <?php echo $route['name'] ?>
            </td>
            <td>
                <?php if ( !empty($route['rails']) && strpos($route['rails'], ':') === false ): ?>
                <a href="<?php $this->url( $route['name'] ) ?>">
                <?php endif ?>
                <?php echo empty( $route['regexp'] ) ? $route['rails'] : $route['regexp'] ?>
                <?php if ( !empty($route['rails']) && strpos($route['rails'], ':') === false ): ?>
                </a>
                <?php endif ?>
            </td>
        </tr>
        <?php endforeach ?>
    </tbody>
</table>