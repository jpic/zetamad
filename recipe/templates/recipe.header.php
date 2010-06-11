<style type="text/css">
#nav-object { color: #b0aaac; width: 980px; height: 30px; list-style: none; margin-bottom: 10px; }
#nav-object li { display: block; float: left; line-height: 30px; height: 30px; }
#nav-object li.browseby { font-size: 10px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; padding-right: 8px; }
#nav-object li a { font: bold 15px Times, Arial; color: #b0aaac; text-transform: uppercase; }
#nav-object li a.selected { color: #000; }
#nav-object li.sep { font-size: 9px; padding: 0px 8px; }
</style>

<ul id="nav-object">
        <li class="browseby">Recettes:</li>
        <li>
            <a title="Liste des recettes triées par date" href="<?php $this->url( 'recipe.listByDate') ?>" <?php if ( $this->request->variables['prefixedUrl'] == madFramework::url( 'recipe.listByDate' ) ): ?>class="selected"<?php endif ?>>
                date
            </a>
        </li>
        <li class="sep">|</li>
        <li>
            <a title="Liste des recettes classées alphab&eacute;tiquement" href="<?php $this->url( 'recipe.list') ?>" <?php if ( $this->request->variables['prefixedUrl'] == madFramework::url( 'recipe.list' ) ): ?>class="selected"<?php endif ?>>
                toutes
            </a>
        </li>
        <li class="sep">|</li>
        <li><a title="Liste des catégories de recette" href="<?php $this->url( 'recipe.categoryList' ) ?>" >cat&eacute;gories</a></li>
        <!--
        <li class="sep">|</li>
        <li><a href="">popularit&eacute;</a></li>
        -->
        <li class="sep">|</li>
        <li>
            <a title="Ouvrir une recette au hasard!" href="<?php $this->url( 'recipe.random' ) ?>" title="Recette au hasard"  <?php if ( !empty( $_SESSION['recipe.random'] ) ): ?>class="selected"<?php unset( $_SESSION['recipe.random'] ); endif ?>>
                au hasard
            </a>
        </li>
</ul>
