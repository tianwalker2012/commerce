<?php
$uid=$_GET['uid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$friendlist=c::t('common_member')->querymysqfriend($uid);
$post=array();
$result=c::t('forum_thread')->fetch_all_first_by_authorid($friendlist,$start,$limit);
echo json_encode(array('result'=>'success','data'=>$result));