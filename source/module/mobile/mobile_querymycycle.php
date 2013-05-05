<?php
 $uid=$_GET['uid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$grouplist=c::t('forum_groupuser')->fetch_all_fid_by_uids($uid);
$grouplist=implode(',', $grouplist);
if(!empty($grouplist)){
	$result=c::t('forum_forum')->fetch_all_groupmytype($grouplist,$start,$limit);
}

if($result){
echo json_encode(array('total_count'=>count($result),'data'=>$result));
}else {
	echo json_encode(array('total_count'=>0));
}

