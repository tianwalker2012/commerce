<?php
/*1212121212*/
echo $uid=$_GET['uid'];

echo $friendid=$_GET['friendid'];

 $_G['uid']=$uid;
 $profile=c::t('common_member')->fetch_uid_by_user_id($_G['uid']);
 $_G['username']=$profile[0]['username'];
 $request=friend_add($friendid);
 echo "123";
 $_G['uid']=$friendid;
 echo $profile=c::t('common_member')->fetch_uid_by_user_id($_G['uid']);
 $_G['username']=$profile[0]['username'];
 echo $reply=friend_add($uid);
if($request&&$reply)
{
	echo json_encode(array('result'=>'success'));
}
else
{
	echo json_encode(array('result'=>'error'));
}
?>