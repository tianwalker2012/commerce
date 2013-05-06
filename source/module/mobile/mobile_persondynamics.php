<?php
  $uid=$_GET['uid']; 
$start=$_GET['start'];
$limit=$_GET['limit'];
 
$singleuid=array($uid);

$result=c::t('forum_thread')->fetch_all_first_by_authorid($singleuid,$start,$limit);
 $post=array();
 foreach ($result as $k=>$v){
     $attachment=get_attachment($v);
     $comment=get_comment($v['pid']);
     $v['attachment']=$attachment;
     $v['comment']=$comment;
     $post[]=$v;
 } 
 
 if(!empty($post)){
 		 echo json_encode(array('total_count'=>count($post),'data'=>$post));
 }else{
 		 echo json_encode(array('total_count'=>0));
 	
 }