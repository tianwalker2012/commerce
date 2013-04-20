<?php

 $_G['uid']=2;
 $profile=c::t('common_member')->fetch_uid_by_user_id($_G['uid']);
 $_G['username']=$profile[0]['username'];
 $request=friend_add(1);
 $_G['uid']=1;
 $profile=c::t('common_member')->fetch_uid_by_user_id($_G['uid']);
 $_G['username']=$profile[0]['username'];
 $reply=friend_add(2);
if($request&&$reply)
{
	echo json_encode(array('result'=>'success'));
}
else
{
	echo json_encode(array('result'=>'error'));
}
?>