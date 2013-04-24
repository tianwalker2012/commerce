<?php
echo "<pre>";
//$info=$_GET['info'];
echo $info="音";
 $result=c::t('forum_forum')->fetch_all_for_search($info);
var_dump($result);