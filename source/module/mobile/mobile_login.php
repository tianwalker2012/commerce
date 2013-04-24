<?php
  
$username=$_GET['username'];
$pwd=$_GET['password'];
$profile=c::t('common_member')->check_login($username,$pwd);
$profiledetail=c::t('common_member_profile')->fetch_all($profile['uid']);
$num=c::t('home_friend')->friendnum($profile['uid']);
$postnum=c::t('forum_post')->postnum($profile['uid']);
if($profile)
{
	if($profile['avatarstatus'])
	{
		echo $profile['avatarstatus']=discuz_uc_avatar($profile['uid'],'small',true);
	}
	$back=array('uid'=>$profile['uid'],
		        'email'=>$profile['email'],	 
		        'username'=>$profile['username'],	 
		        'avatar'=>$profile['avatarstatus'],
	            'mobilephone'=>$profiledetail['mobile'],
	            'postion'=>$profiledetail['postion'],
	            'location'=>$profiledetail['resideprovince'].$profiledetail['residecity'].$profiledetail['residedist'].$profiledetail['residecommunity'].$profiledetail['residesuite'],	 
                'latitude'=>$profiledetail['latitude'],
	            'longitude'=>$profiledetail['longitude'],
	            'bio'=>$profiledetail['bio'],
	            'company'=>$profiledetail['company'],
	            'industry'=>$profiledetail['industry'],
	            'gender'=>$profiledetail['gender'],
	            'friendnum'=>$num[0]['num'],
	            'postnum'=>$postnum[0]['num'],
	);
	echo json_encode($back=array('result'=>'success',
			                      'data'=>$back));
}
else
 { 
 	echo  json_encode($back=array('result'=>'error'));
 }
 
?>