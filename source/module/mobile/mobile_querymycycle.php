<?php
 $uid=$_GET['uid'];
 $start=$_GET['start'];
$limit=$_GET['limit'];
$grouplist=c::t('forum_groupuser')->fetch_all_fid_by_uids($uid);
$grouplist=implode(',', $grouplist);
$result=c::t('forum_forum')->fetch_all_grouptype($grouplist,$start,$limit);
 echo json_encode(array('data'=>$result));