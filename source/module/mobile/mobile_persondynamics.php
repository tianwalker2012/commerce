<?php
$uid=$_GET['uid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$result=c::t('forum_thread')->fetch_all_by_authorid($uid,$start,$limit);
echo json_encode(array('result'=>'success','data'=>$result));