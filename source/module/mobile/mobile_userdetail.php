<?php
  
$uid=$_GET['uid'];

$user_inf=get_user_info($uid);

 
if($user_inf)
{ 
	echo json_encode($user_inf);
}
else
 { 
 	echo  json_encode(array('total_count'=>'0'));
 }
 
?>