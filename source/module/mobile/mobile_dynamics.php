<?php
$uid=$_GET['uid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$friendlist=c::t('common_member')->querymysqfriend($uid);
$post=array();
 $result=c::t('forum_thread')->fetch_all_first_by_authorid($friendlist,$start,$limit);
 if(!empty($result)){
 echo json_encode(array('total_count'=>count($result),'data'=>$result));
 }else{
 	 echo json_encode(array('total_count'=>0));
 	
 }