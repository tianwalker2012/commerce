<?php

$cycleid=$_GET['cycleid'];
$uid=$_GET['uid'];
$result=c::t('forum_groupuser')->delete_by_fid($cycleid,$uid);
echo json_encode(array('result'=>'200'));