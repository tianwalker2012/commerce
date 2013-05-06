<?php

$cycleid=$_GET['cycleid'];
$uid=$_GET['uid'];
$result=c::t('forum_groupuser')->delete_by_fid($cycleid,$uid);
$cycle=get_cycle_member($cycleid);
echo json_encode($cycle);