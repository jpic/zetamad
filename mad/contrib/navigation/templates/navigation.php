<style>
#tabAdminFixed { position: fixed; bottom: 0; right: 0; height: 25px; z-index: 99; direction: ltr; }
#tabAdminFixed #adminMenu { position: relative; margin-right: 20px; float: left; border: 1px solid #999999; border-bottom: 0; }
#tabAdminFixed #adminMenu li.tabMenu {
	position: relative;
	width: 160px;
	background: -moz-linear-gradient(#e0dcd0, #c2b9a9);
	background-color: #e0dcd0;
	cursor: pointer;
	font-family:'lucida grande',tahoma,verdana,arial,sans-serif;
	font-size: 11px;
	display: block;
	float: left;
	height: 16px;
	padding: 4px 10px;
	color: #333333;
	font-weight: bold;
}
#tabAdminFixed #adminMenu li.tabMenu:hover { background: -moz-linear-gradient(#f0ede6, #e0dcd0); background-color: #e0dcd0; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu { position: absolute; z-index: 999; bottom: 24px; left: -1px; background: #f0ede6; border: 1px solid #999999; border-bottom: 0; visibility: hidden; width: 170px;}
#tabAdminFixed #adminMenu li.tabMenu:hover > ul.adminSubMenu { visibility: visible; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu li { margin: 0 5px; cursor: default; list-style-type: none; height: 12px; padding: 4px 10px; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu li.last { padding-bottom: 10px; border-bottom: 1px solid #999999; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu li a { color: #333333; font-weight: bold; display: inline; }
#tabAdminFixed #adminMenu li.tabMenu ul.adminSubMenu li a:hover { color: #000; text-decoration: underline; }
</style>


<!--[if lte IE 6]>
<style type="text/css">
body { background-position: fixed; }
#tabAdminFixed { position: absolute; top: expression( ignore = - this.offsetHeight + document.documentElement.clientHeight + document.documentElement.scrollTop + "px" ); }
</style>

<script type="text/javascript">
$(document).ready(function(){

 $("ul#adminMenu li").hover(function(){
   $(this).addClass("hover");
   $('> .dir',this).addClass("open");
   $('ul:first',this).css('visibility', 'visible');
 },function(){
   $(this).removeClass("hover");
   $('.open',this).removeClass("open");
   $('ul:first',this).css('visibility', 'hidden');
 });

});
</script>
<![endif]-->

<div id="tabAdminFixed">
    <ul id="adminMenu">
    <?php
    foreach( $this->navigation as $application => $links ):
    ?>
	<li class="tabMenu">
        <?php $this->uet( $application ) ?>
		<ul class="adminSubMenu">
            <?php
            $forloop = 0;
            foreach( $links as $url => $label ):
            ?>
			<!--<li <?php if ( count( $forloop ) == $forloop+1 ): ?>class="last"<?php endif ?>>-->
            <li>
                <a href="<?php echo $url ?>">
                    <?php echo $label ?>
                </a>
            </li>
            <?php
                $forloop++;
            endforeach;
            ?>
		</ul>
	</li>
    <?php
    endforeach
    ?>
    </ul>
</div>
