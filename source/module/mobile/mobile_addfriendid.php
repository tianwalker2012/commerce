<?php
/*1212121212*/
  $uid=$_GET['uid'];

  $friendid=$_GET['friendid'];

 $_G['uid']=$uid;
 $profile=c::t('common_member')->fetch_uid_by_user_id($_G['uid']);
 $_G['username']=$profile[0]['username'];
 $request=friend_add($friendid);
 $_G['uid']=$friendid;
   $profile=c::t('common_member')->fetch_uid_by_user_id($_G['uid']);
 $_G['username']=$profile[0]['username'];
   $reply=friend_add($uid);
if($request&&$reply)
{
	echo json_encode(array('result'=>'200'));
}
else
{
	echo json_encode(array('result'=>'403'));
}
?>