<?php
 
 $info=$_GET['info'];
 $result=c::t('forum_forum')->fetch_like_name($info);
 echo json_encode($result);