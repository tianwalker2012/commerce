<?php
  
$uid=$_GET['uid'];
$profile=c::t('common_member')->fetch_uid_by_user_id($uid);
 
$profiledetail=c::t('common_member_profile')->fetch_all($uid);
$num=c::t('home_friend')->friendnum($uid);
$postnum=c::t('forum_post')->postnum($uid);
if($profile)
{
	if($profile[0]['avatarstatus'])
	{
		  $profile['avatarstatus']=discuz_uc_avatar($uid,'small',true);
	} else 
	{
		$profile['avatarstatus']=null;
	}
	$back=array('uid'=>$profile[0]['uid'],
		        'email'=>$profile[0]['email'],	 
		        'username'=>$profile[0]['username'],	 
		        'avatar'=>$profile['avatarstatus'],
	            'mobilephone'=>$profiledetail[0]['mobile'],
	            'postion'=>$profiledetail[0]['postion'],
	            'location'=>$profiledetail[0]['resideprovince'].$profiledetail[0]['residecity'].$profiledetail[0]['residedist'].$profiledetail[0]['residecommunity'].$profiledetail[0]['residesuite'],	 
                'latitude'=>$profiledetail[0]['latitude'],
	            'longitude'=>$profiledetail[0]['longitude'],
	            'bio'=>$profiledetail[0]['bio'],
	            'company'=>$profiledetail[0]['company'],
	            'industry'=>$profiledetail[0]['industry'],
	            'gender'=>$profiledetail[0]['gender'],
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