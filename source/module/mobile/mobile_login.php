<?php
$email=$_GET['email'];
$pwd=$_GET['password'];
$profile=c::t('common_member')->check_login($email,$pwd);
$profiledetail=c::t('common_member_profile')->fetch_all($profile['uid']);
$num=c::t('home_friend')->friendnum($profile['uid']);
$postnum=c::t('forum_post')->postnum($profile['uid']); 

if($profile)
{
	$profile['avatarstatus']="http://www.enjoyxue.com/commerce/uc_server/avatar.php?uid=".$profile['uid']."&size=small";
	$back=array('uid'=>$profile['uid'],
		        'email'=>$email,	 
		        'username'=>$profile['username'],	 
		        'avatar'=>$profile['avatarstatus'],
	            'mobilephone'=>$profiledetail[$profile['uid']]['mobile'],
	            'postion'=>$profiledetail[$profile['uid']]['postion'],
	            'location'=>$profiledetail[$profile['uid']]['resideprovince'].$profiledetail[$profile['uid']]['residecity'].$profiledetail[$profile['uid']]['residedist'].$profiledetail[$profile['uid']]['residecommunity'].$profiledetail[$profile['uid']]['residesuite'],	 
                'latitude'=>$profiledetail[$profile['uid']]['latitude'],
	            'longitude'=>$profiledetail[$profile['uid']]['longitude'],
	            'bio'=>$profiledetail[$profile['uid']]['bio'],
	            'company'=>$profiledetail[$profile['uid']]['company'],
	            'industry'=>$profiledetail[$profile['uid']]['industry'],
	            'gender'=>$profiledetail[$profile['uid']]['gender'],
	            'friendnum'=>$num[0]['num'],
	            'postnum'=>$postnum[0]['num'],
	);
	echo json_encode($back);
}
else
 { 
 	echo json_encode(array('200'));
 }
 
?>