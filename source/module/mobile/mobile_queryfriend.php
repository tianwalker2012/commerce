<?php
 echo "<pre>";
$uid=$_GET['uid'];
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
foreach ($friendlist as $k=>$v){
	$user_inf=get_user_info($v);
	$user[]=array($user_inf);
}
foreach ($user as $k=>$v)
{
	$p_list[]=$v[0];
}
 if($user)
{
 echo json_encode($back=array('result'=>'success',
			                      'data'=>$p_list));
}
else
 { 
 	echo  json_encode($back=array('result'=>'没有联系人'));
 }
