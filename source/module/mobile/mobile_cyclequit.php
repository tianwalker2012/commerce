<?php

$cycleid=$_GET['cycleid'];
$uid=$_GET['uid'];
$result=c::t('forum_groupuser')->delete_by_fid($cycleid,$uid);
update_group_member($fid,-1);
$cycle=get_cycle_member($cycleid);
echo json_encode($cycle);