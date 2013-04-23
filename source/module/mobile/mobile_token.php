<?php
 $uid=$_GET['uid'];
$token=$_GET['token'];
$flag=c::t('common_member_profile')->updatetoken($uid,$token);
if($flag)
{
	echo json_encode(array('result'=>'success'));
}
else
{
	echo json_encode(array('result'=>'error'));
	
}