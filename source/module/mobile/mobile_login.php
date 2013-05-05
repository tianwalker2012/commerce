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
		  $profile['avatarstatus']=discuz_uc_avatar($profile['uid'],'small',true);
	}
	$back=array('uid'=>$profile['uid'],
		        'email'=>$profile['email'],	 
		        'username'=>$profile['username'],	 
		        'avatar'=>$profile['avatarstatus'],
	            'mobilephone'=>$profiledetail[1]['mobile'],
	            'postion'=>$profiledetail[1]['postion'],
	            'location'=>$profiledetail[1]['resideprovince'].$profiledetail['residecity'].$profiledetail['residedist'].$profiledetail['residecommunity'].$profiledetail['residesuite'],	 
                'latitude'=>$profiledetail[1]['latitude'],
	            'longitude'=>$profiledetail[1]['longitude'],
	            'bio'=>$profiledetail[1]['bio'],
	            'company'=>$profiledetail[1]['company'],
	            'industry'=>$profiledetail[1]['industry'],
	            'gender'=>$profiledetail[1]['gender'],
	            'friendnum'=>$num[0]['num'],
	            'postnum'=>$postnum[0]['num'],
	);
	echo json_encode($back);
}
else
 { 
 	header('HTTP/1.1 200 OK');  
 }
 
?>