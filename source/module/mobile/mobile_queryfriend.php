<?php
$uid=$_GET['uid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$p_list=array();
$user=array();
$groupfriendlist=array();
$friendlist=c::t('home_friend')->frienduid($uid);
$grouplist=c::t('forum_groupuser')->fetch_all_fid_by_uids($uid);
foreach ($grouplist as $k=>$v){
$g_list=c::t('forum_groupuser')->groupuserlist($v);
	 
}
foreach ($g_list as $k=>$v)
{
	array_push($groupfriendlist, $v['uid']);
}
$friendlist=array_merge($friendlist,$groupfriendlist);
  $num=count($friendlist);
if($num>0){
  $frienduid=implode(',', $friendlist);
 $result=c::t('common_member')->fetch_mysql_friend($frienduid,$start,$limit);
}



 if($result)
{
 echo json_encode($back=array('total_count'=>$num,
			                      'data'=>$result));
}
else
 { 
 	echo  json_encode($back=array('total_count'=>0));
 }
