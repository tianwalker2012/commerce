<?php
 $uid=$_GET['uid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$grouplist=c::t('forum_groupuser')->fetch_all_fid_by_uids($uid);
$grouplist=implode(',', $grouplist);
if(!empty($grouplist)){
	$result=c::t('forum_forum')->fetch_all_groupmytype($grouplist,$start,$limit);
}

$cyclestatus=array();
foreach ($result as $k=>$v){
	$activity=0;
$groupuserlist=c::t('forum_groupuser')->groupuserlist($v['fid']);
$user_list=array();
foreach ($groupuserlist as $k=>$v){
	array_push($user_list, $v['uid']);
}
if(!empty($user_list)){
$sql="select count(tid) activity from pre_forum_thread where authorid in (".implode(',', $user_list).")";
$num=DB::fetch_all($sql);
$activity=$num[0]['activity'];
}
$v['activity']=$activity;
$cyclestatus[]=$v;
}


if($cyclestatus){
echo json_encode(array('total_count'=>count($cyclestatus),'data'=>$cyclestatus));
}else {
	echo json_encode(array('total_count'=>0));
}

