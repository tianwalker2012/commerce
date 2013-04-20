<?php
/*
 $uid=$_GET['to'];
$token=$_GET['subject'];
 
*/
$uid= 1 ;
 $token='subjesst11111';
$flag=c::t('common_member_profile')->updatetoken($uid,$token);
if($flag)
{
	echo json_encode(array('result'=>'success'));
}
else
{
	echo json_encode(array('result'=>'error'));
	
}