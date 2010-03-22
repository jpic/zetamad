<style>
/*Init 100%*/
#center_column { width: 980px; padding: 0; }
#center_column a { text-decoration: none;}
#left_column, .breadcrumb { display: none; }

#nav-recipe { color: #b0aaac; width: 980px; height: 30px; list-style: none; margin-bottom: 10px; }
#nav-recipe li { display: block; float: left; line-height: 30px; height: 30px; }
#nav-recipe li.browseby { font-size: 10px; font-family: Verdana; padding-right: 8px; }
#nav-recipe li a { font: bold 15px Times, Arial; color: #b0aaac; text-transform: uppercase; }
#nav-recipe li a.selected { color: #000; }
#nav-recipe li.sep { font-size: 9px; padding: 0px 8px; }

.recipe { width: 740px; float: left;}
.recipe .recipe-left { width: 240px; float: left; }
.recipe .recipe-left #recipe-photo { vertical-align: bottom; width: 240px; height: 240px; }
.recipe .recipe-left #recipe-video { position: absolute; margin-top: 10px; width: 240px; height: 130px; position: relative; }
.recipe .recipe-left #recipe-video a { display: block; width: 240px; height: 130px; text-align: center; z-index: 123999; position: absolute; padding-top: 40px; }
.recipe .recipe-left #recipe-video #background-video { opacity: 0.5; filter : alpha(opacity=50); position: absolute; background: url('http://storage.canalblog.com/21/51/314534/43401831_p.jpg') center center no-repeat; width: 240px; height: 130px; -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; }

.recipe .recipe-right { float: right; width: 480px;}
.recipe .recipe-right .recipe-header { height: 360px; position: relative; border-top: 1px solid #dadada; border-bottom: 1px solid #dadada; padding: 9px 0; }
.recipe .recipe-right .recipe-header h2 { color: #232323; font-size: 26px; font-family: Times, Georgia, Arial; font-weight: normal;}
.recipe .recipe-right .recipe-header .recipe-author { color: #232323; font-size: 18px; font-family: Times; padding-top: 10px;}
.recipe .recipe-right .recipe-header .recipe-author a { color: #b49135; }
.recipe .recipe-right .recipe-header .recipe-author a:hover { color: #232323; }
.recipe .recipe-right .recipe-header .recipe-intro { text-align: justify; margin-top: 10px; font-family: Verdana; font-size: 11px; color: #969696; word-spacing: 0.5px; line-height: 18px;}
.recipe .recipe-right .recipe-header .links-intro a { font-weight: bold; font-family: Verdana; font-size: 11px; color: #539893; border-bottom: 1px solid #969696; display: block; float: left; margin-right: 20px; margin-top: 10px;}
.recipe .recipe-right .recipe-header .links-intro a:hover { color: #c21123; border-bottom: 1px solid #cf6875;}
.recipe .recipe-right .recipe-header .share-recipe p.lovedit { background: url('themes/mmarket/img/recipe-love.jpg') 0 1px no-repeat; padding-left: 15px; font-style: italic; font-family: Verdana; font-size: 11px; color: #969696; padding-bottom: 10px;}
.recipe .recipe-right .recipe-header .share-recipe { position: absolute; bottom: 10px; left: 0; }

.recipe .recipe-left .recipe-author, .recipe .recipe-right .recipe-description { margin-top: 40px; }
.recipe .recipe-left .recipe-author .author-name, .recipe .recipe-right .recipe-title-steps { font-size: 18px; color: #969696; font-family: Times; border-bottom: 1px solid #dadada; margin-bottom: 7px; padding-bottom: 7px; }
.recipe .recipe-left .recipe-author .author-photo { float: left; margin-right: 7px; margin-bottom: 2px; border: 1px solid #dadada; vertical-align: bottom; width: 87px; height: 87px; }
.recipe .recipe-left .recipe-author .author-description { line-height: 19px; font-size: 11px; color: #969696; font-family: Verdana; text-align: justify;}

.recipe .recipe-right .recipe-description .step-title { text-transform:uppercase; font-weight: bold; font-family: Verdana; font-size: 11px; color: #232323; padding-bottom: 10px;}
.recipe .recipe-right .recipe-description .step-desc { font-family: Verdana; font-size: 11px; color: #969696; line-height: 19px; padding-bottom: 20px;}

.recipe .recipe-right .recipe-infos { overflow: auto; border-bottom: 1px dashed #dadada; margin-bottom: 20px; padding-bottom: 7px; }
.recipe .recipe-right .recipe-infos-block { float: left; margin-right: 15px; color: #AB1D37; font-size: 11px; font-family: Verdana; padding: 5px; }

#recipe-column { float: right; width: 220px; }
#recipe-column .block {  border: 1px solid #dadada; padding: 10px; }
#recipe-column .block h3 { font-size: 22px; font-family: Times; color: #232323; font-weight: normal; border-bottom: 1px solid #dadada; padding-bottom: 10px; margin-bottom: 10px; }
#recipe-column .block ul { margin: 0; padding: 0; }
#recipe-column .block li { padding: 0; margin: 0; font-size: 11px; font-family: Verdana; color: #969696; line-height: 21px;}
#recipe-column .block li .att { color: #ab1d37; }
#recipe-column .block li .recipe-step { text-transform: uppercase; font-weight:bold; }

a.btn-block { display: block; height: 30px; width: 180px; margin: 0 auto; margin-top: 10px; text-align: center; font-size: 16px; font-style: italic; font-family: Times; color: #fff; line-height: 30px; background: #929da3; }
a.btn-block:hover { background: #539893; }
</style>
<ul id="nav-recipe">
        <li class="browseby">Trier par:</li>
        <li><a href="" class="selected">date</a></li>
        <li class="sep">|</li>
        <li><a href="">cat&eacute;gorie</a></li>
        <li class="sep">|</li>
        <li><a href="">popularit&eacute;</a></li>
        <li class="sep">|</li>
        <li><a href="">au hasard</a></li>
</ul>

<div class="recipe">
        <div class="recipe-left">
                <div id="recipe-photo">
                        <img src="http://storage.canalblog.com/21/51/314534/43401831_p.jpg" alt="recette X" height="240" width="240" />
                </div>
                <!--if video-->
                <div id="recipe-video">
                        <a href="#link" title="Jouer la vid&eacute;o"><img src="<?php echo $this->getAbsoluteStaticUrl( 'recipe/img/btn-play.png '); ?>" /></a>
                        <div id="background-video">
                        </div>
                </div>
                <!--if video-->
                <div class="recipe-author">
                        <p class="author-name">Laurent Touchet</p>
                        <p class="author-description">
                                <img class="author-photo" src="http://www.blobidesign.com/other/mmhome/img/avatar-mrbean.jpg" width="87" height="87" title="Photo profil X" />
                                Beaucoup de r&eacute;actions &agrave; ce que j'ai pu constater, et &eacute;tant parfaitement insensible aux mauvaises langues, il est bien entendu hors de question que mon blog cesse son activit&eacute;. Pas tant que je ne l'aurai pas d&eacute;cid&eacute; de par moi-m&ecirc;me quoi qu'il arrive. Beaucoup de contretemps et d'impr&eacute;vus depuis novembre, je reviendrai tr&egrave;s prochainement en douceur, sur un rythme peut-&ecirc;tre un peu d&eacute;cousu au d&eacute;part, puis plus soutenu par la suite.
                        </p>
                        <a href="#" class="btn-block" style="width: 100%;">Voir le profil</a>
                </div>
        </div>
        <div class="recipe-right">
                <div class="recipe-header">
                        <h2><?php echo $this->object['title']; ?></h2>
                        <p class="recipe-author">Par&nbsp;<a href="#lien">Laurent Touchet</a></p>
                        <p class="recipe-intro">
                                Ce g&acirc;teau n'est pas un entremet, il est plus riche, on en servira de plus petites parts au dessert. Pour un cercle de 21 cm de diam&egrave;tre, on comptera environ 8 parts.
                                <br />
                                Important : Les framboises crues ( fra&icirc;ches ou surgel&eacute;es ) devront &ecirc;tre mix&eacute;es finement. La pur&eacute;e obtenue devra &ecirc;tre filtr&eacute;e en pressant &agrave; la cuill&egrave;re &agrave; travers une petite passoire. On pr&eacute;voiera un peu plus de framboises afin d'obtenir 100 g de pur&eacute;e filtr&eacute;e ( compter 150 g de fruits entiers, quitte &agrave; conserver le petit restant de la pur&eacute;e de fruits pour agr&eacute;menter un yahourt ).
                        </p>
                        <div class="links-intro">
                                <a href="#">J'aime cette recette</a>
                                <a href="#">Commenter la recette</a>
                        </div>
                        <div class="share-recipe">
                                <p class="lovedit">788 personnes ont aim&eacute; cette recette</p>
                                <a href="#">
                                        <img src="http://www.madeleinemarket.com/themes/mmarket/img/lg-bookmark-mm.gif" />
                                </a>
                        </div>
                </div>
                <div class="recipe-description">
                        
                        <div class="recipe-title-steps">Pr&eacute;paration</div>
                        <div class="recipe-infos">
                                <p class="recipe-infos-block">Pr&eacute;paration: <span class="bold">45min</span></p>
                                <p class="recipe-infos-block">Cuisson: <span class="bold">30min</span></p>
                                <p class="recipe-infos-block" style="margin-right: 0;">Personnes: <span class="bold">6</span></p>
                        </div>
                        
                        <p class="step-title clear">Pr&eacute;parer la base mi-sabl&eacute;e au coco</p>
                                
                        <p class="step-desc">Beurrer le cercle et le chemiser de papier sulfuris&eacute;. Le poser sur une plaque de four, recouverte elle-m&ecirc;me de papier sulfuris&eacute;. Dans un saladier, travailler le beurre en cr&egrave;me ( fouet &eacute;l&eacute;ctrique ). Dans un autre saladier, m&eacute;langer la coco r&acirc;p&eacute;e avec l'eau chaude. Ajouter le sucre et la semoule de bl&eacute; fine. Tamiser au-dessus le m&eacute;lange de farine et bicarbonate. M&eacute;langer &agrave; la cuill&egrave;re puis verser dans le beurre en cr&egrave;me. Travailler le tout &agrave; la main jusqu'&agrave; obtention d'une boule de p&acirc;te tr&egrave;s friable.</p>
                        
                        <p class="step-desc">Aplatir la p&acirc;te dans le cercle pr&eacute;par&eacute; &agrave; la main, tasser uniform&eacute;ment, r&eacute;server. Pr&eacute;chauffer le four &agrave; 170&deg;C.</p>
                        
                        <p class="step-title">Pr&eacute;parer la garniture aux amandes</p>
                                
                        <p class="step-desc">Mixer les amandes enti&egrave;res non mond&eacute;es en poudre fine. Dans un saladier, travailler le beurre mou avec le sucre ( fouet &eacute;l&eacute;ctrique ) jusqu'&agrave; ce qu'il devienne cr&eacute;meux. Ajouter les oeufs, fouetter, puis la poudre d'amandes, fouetter de nouveau pour homog&eacute;n&eacute;iser. Verser la pr&eacute;paration dans le cercle sur la base au coco, lisser et enfourner &agrave; 170&deg;C pendant 40 minutes environ. Retirer du four, laisser totalement refroidir, d&eacute;cercler et faire glisser sur une grille en prenant soin de retirer le papier sulfuris&eacute; dessous.</p>
                        
                        <p class="step-title">Pr&eacute;parer le gla&ccedil;age brillant cacao &amp; framboise</p>
                                
                        <p class="step-desc">Tamiser le cacao amer dans un bol. Mixer longuement les framboises ( pr&eacute;alablement gratt&eacute;es au couteau en cas de givre puis d&eacute;congel&eacute;es si elles ne sont pas fra&icirc;ches ) en pur&eacute;e fine. Filtrer cette pur&eacute;e au travers d'une petite passoire en pressant bien &agrave; l'aide d'une cuill&egrave;re afin d'en extraire les p&eacute;pins. Pr&eacute;lever 100 g de cette pur&eacute;e, r&eacute;server.</p>
                        
                        <p class="step-desc">Tremper la g&eacute;latine 10 minutes dans de l'eau froide. Verser le sucre, l'eau et les 100 g de pur&eacute;e filtr&eacute;e de framboises dans une casserole d'environ 16 cm de diam&egrave;tre. Chauffer le tout en remuant &agrave; la spatule en bois jusqu'&agrave; dissolution du sucre. Hors du feu, ajouter le cacao amer tamis&eacute; en remuant ( il restera des grumeaux ). Remettre sur le feu, porter &agrave; &eacute;bullition sans cesser de remuer vigoureusement &agrave; la spatule en bois et laisser bouillir une bonne minute toujours en remuant. Retirer du feu, ajouter le beurre en d&eacute;s, bien m&eacute;langer.</p>
                        
                        <p class="step-desc">Laisser la temp&eacute;rature descendre aux alentours de 60&deg;C avant d'ajouter la g&eacute;latine bien essor&eacute;e. M&eacute;langer doucement et de mani&egrave;re concentrique afin de chasser les bulles d'air ( partir du centre et tourner doucement jusqu'&agrave; atteindre les bords de la casserole ).</p>
                        
                        <p class="step-desc">Napper le g&acirc;teau de ce gla&ccedil;age lorsque celui-ci atteint la consistance id&eacute;ale. Personnellement j'ai laiss&eacute; refroidir. R&eacute;cup&eacute;rer le chocolat qui aura coul&eacute; au dessous dans un saladier afin de le r&eacute;utiliser si n&eacute;cessaire pour uniformiser les bords du g&acirc;teau, &agrave; l'aide d'une spatule. D&eacute;placer le g&acirc;teau sur un plat de service et r&eacute;frig&eacute;rer 1 nuit.</p>
                        
                        <p class="step-desc">D&eacute;corer &eacute;ventuellement de coco r&acirc;p&eacute;e, d'amandes et de framboises. En fonction de la temp&eacute;rature, on sortira le g&acirc;teau du frigo 15 &agrave; 30 minutes avant de le d&eacute;guster.</p>
                </div>
        </div>
</div>

<div id="recipe-column">
        <div class="block">
                <h3>Ingr&eacute;dients</h3>
                <ul>
                        <li><span class="recipe-step">La base mi-sabl&eacute;e coco :</span></li>
                        <li><span class="att">150g</span> de farine</li>
                        <li><span class="att">150g</span> de coco r&acirc;p&eacute;e</li>
                        <li><span class="att">30g</span> de semoule de bl&eacute; fine</li>
                        <li><span class="att">100g</span> de sucre</li>
                        <li><span class="att">45g</span> d'eau chaude</li>
                        <li><span class="att">1 pinc&eacute;e</span> de bicarbonate</li>
                </ul>
                <a class="btn-block" href="#">Voir les produits</a>
        </div>
        <div class="block">
                <h3>Produits de la recette</h3>
                -
                <a class="btn-block" href="#">Voir les produits</a>
        </div>
        <div class="block">
                <h3>Id&eacute;es recette</h3>
                -
                <a class="btn-block" href="#">Voir les produits</a>
        </div>
</div>

<a href="<?php echo $this->generateUrl( 'recipe.edit', array( 'id'=> $this->object['id'] ) ) ?>">edit</a>
