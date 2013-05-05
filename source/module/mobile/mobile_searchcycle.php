<?php
 $info=$_GET['info'];
 $start=$_GET['start'];
$limit=$_GET['limit'];
 $result=c::t('forum_forum')->fetch_like_name($info);
$grouplist=array();
 foreach ($result as $k=>$v){
 	array_push($grouplist, $v['fid']);
 }
$grouplist=implode(',', $grouplist);
if(!empty($grouplist)){
	$result=c::t('forum_forum')->fetch_all_groupmytype($grouplist,$start,$limit);
}

if($result){
echo json_encode(array('total_count'=>count($result),'data'=>$result));
}else {
	echo json_encode(array('total_count'=>0));
}

 