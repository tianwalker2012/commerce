<?php
$start=$_GET['start'];
$limit=$_GET['limit'];

$result=c::t('forum_forum')->fetch_all_grouptype($start,$limit);
if($result){
echo json_encode(array('total_count'=>count($result),'data'=>$result));
}else {
	echo json_encode(array('total_count'=>0));
}