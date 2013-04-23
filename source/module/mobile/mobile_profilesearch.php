<?php
 
$userids=array();
$p_list=array();
 $uid=$_GET['searchtext'];
 $user=array();
 $uids=c::t('common_member')->fetch_search($uid);
 foreach ($uids as $k=>$v) {
 	array_push($userids, $v['uid']);
 }
  foreach ($userids as $k=>$v){
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
 	echo  json_encode($back=array('result'=>'error'));
 }