<?php
$list=friend_list(3,100);
if($list)
{
	echo json_encode(array('result'=>'success','data'=>$list));
}
else
{
	echo json_encode(array('result'=>'error'));
} 
?>