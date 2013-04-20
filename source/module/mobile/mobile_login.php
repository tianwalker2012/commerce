<?php
 
$username=$_GET['username'];
$pwd=$_GET['password'];
$profile=c::t('common_member')->check_login($username,$pwd);
if($profile)
{
	if($profile['avatarstatus'])
	{
		$profile['avatarstatus']=discuz_uc_avatar($profile['uid'],'small',true);
	}
	$back=array('uid'=>$profile['uid'],
		        'email'=>$profile['email'],	 
		        'username'=>$profile['username'],	 
		        'avatarstatus'=>$profile['avatarstatus'],	 
			     );
	echo json_encode($back=array('result'=>'success',
			                      'data'=>$back));
}
else
 { 
 	echo  json_encode($back=array('result'=>'error'));
 }
 
?>