<?php
$cycleid=$_GET['cycleid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$sql="select uid from pre_forum_groupuser where fid=".$cycleid;
$userlist=DB::fetch_all($sql);
$persons=array();
foreach ($userlist as  $k=>$v){
	array_push($persons, $v['uid']);
}
$result=c::t('forum_thread')->fetch_all_first_by_authorid($persons,$start,$limit);
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
