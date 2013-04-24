<?php
$uid=$_GET['uid'];
$fid=$_GET['cycleid'];

$name=DB::fetch_all("select username from pre_ucenter_members where uid=$uid");
 
  $index=c::t('forum_groupuser')->insert($fid,$uid,$name[0]['username'],time());
  echo json_encode(array('result'=>200));