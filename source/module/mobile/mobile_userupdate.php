<?php

/*$realname=$_POST['realname'];
$birthyear=$_POST['birthyear'];
$birthmonth=$_POST['birthmonth'];
$birthday=$_POST['birthday'];
$birthprovince=$_POST['birthprovince'];
$resideprovince=$_POST['resideprovince'];
$affectivestatus=$_POST['affectivestatus'];
$lookingfor=$_POST['lookingfor'];
$bloodtype=$_POST['bloodtype'];

$email=$_POST['email'];
$mobilephone=$_POST['mobilephone'];
$postion=$_POST['postion'];
$location=$_POST['location'];
$latitude=$_POST['latitude'];
$longitude=$_POST['longitude'];
$bio=$_POST['bio'];
$company=$_POST['company'];
$industry=$_POST['industry'];
$gender=$_POST['gender'];
 
$infomation=array($realname=$_POST['realname'],
$mobile=$_POST['mobilephone'],
$postion=$_POST['postion'],
$location=$_POST['location'],
$latitude=$_POST['latitude'],
$longitude=$_POST['longitude'],
$company=$_POST['company'],
$industry=$_POST['industry'],
$gender=$_POST['gender']
);*/
 $infomation=array(
	'realname'=>'nicke',
	'mobile'=>'15852951529',
	'postion'=>'国家主席',
	'location'=>'北京',
	'company'=>'netscout',
	'industry'=>'IT',
	'gender'=>1,
	'uid'=>1
);
 
$result=c::t('common_member_profile')->updateinfo($infomation);
if($result)
{
	echo json_encode(array('result'=>'success'));
}

 