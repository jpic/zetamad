<style type="text/css">
#nav-object { color: #b0aaac; width: 980px; height: 30px; list-style: none; margin-bottom: 10px; }
#nav-object li { display: block; float: left; line-height: 30px; height: 30px; }
#nav-object li.browseby { font-size: 10px; font-family: Lucida, "Lucida Sans", Arial, sans-serif;; padding-right: 8px; }
#nav-object li a { font: bold 15px Times, Arial; color: #b0aaac; text-transform: uppercase; }
#nav-object li a.selected { color: #000; }
#nav-object li.sep { font-size: 9px; padding: 0px 8px; }
</style>

<ul id="nav-object">
        <li class="browseby">Trier par:</li>
        <li><a href="" class="selected">date</a></li>
        <li class="sep">|</li>
        <li><a href="">cat&eacute;gorie</a></li>
        <li class="sep">|</li>
        <li><a href="">popularit&eacute;</a></li>
        <li class="sep">|</li>
        <li>
            <a href="<?php $this->url( 'recipe.random' ) ?>" title="Recette au hasard">
                au hasard
            </a>
        </li>
</ul>
