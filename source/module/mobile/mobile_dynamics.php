<?php
 $uid=$_GET['uid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$friendlist=$friendlist=c::t('home_friend')->frienduid($uid);
array_push($friendlist, $uid);
$result=c::t('forum_thread')->fetch_all_first_by_authorid($friendlist,$start,$limit);
 $post=array();
 foreach ($result as $k=>$v){
     $attachment=get_attachment($v);
     $comment=get_comment($v['tid']);
     $v['attachment']=$attachment;
     $v['comment']=$comment;
     $post[]=$v;
 } 
 if(!empty($post)){
 		 echo json_encode(array('total_count'=>count($post),'data'=>$post));
 }else{
 		 echo json_encode(array('total_count'=>0));
 	
 }