<?php
$uid=$_GET['uid'];
$fid=$_GET['cycleid'];

$name=DB::fetch_all("select username from pre_ucenter_members where uid=$uid");
 
$index=c::t('forum_groupuser')->insert($fid,$uid,$name[0]['username'],time());
update_group_member($fid,1);
$cycle=get_cycle_member($fid);

echo json_encode($cycle);