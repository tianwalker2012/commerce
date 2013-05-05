<?php
$start=$_GET['start'];
$limit=$_GET['limit'];
$cycleid=$_GET['cycleid'];
$p_list=array();
$user=array();
$groupfriendlist=array();
$g_list=c::t('forum_groupuser')->groupuserlist($cycleid);
 
foreach ($g_list as $k=>$v)
{
	array_push($groupfriendlist, $v['uid']);
}
 
foreach ($groupfriendlist as $k=>$v){
	$user_inf=get_user_info($v);
	$user[]=array($user_inf);
}
$user=get_array_inner($user);
 if($user)
{
 echo json_encode(array('count_total'=>count($user),
			                      'data'=>$user));
}
else
 { 
 	echo  json_encode(array('total_count'=>0));
 }
