<?php

//模糊查询
$username=$_GET['username'];
$username="admin";
$profileback=c::t('common_member')->fetch_search($username);

if($profileback)
{
	$profile=array();
	 
	foreach ($profileback as $k=>$v)
	{
		 
		$profile[]=array('username'=>$v['username'],
				       'uid'=>$v['uid'],
				       'email'=>$v['email'],
				       'avatar'=>$v['uid'],
				           );
	}
	echo json_encode(array('result'=>'success',
			               'date'=>$profile,
			              ));         
 }
else
{
	echo json_encode(array('result'=>'error'));
}
 