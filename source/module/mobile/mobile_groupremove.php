<?php
$plid=$_GET['plid'];
$toid=$_GET['to'];//数组
$to=implode(',', $to);
$authorid=DB::fetch_all("select authorid from pre_ucenter_pm_lists where plid=".$plid);
uc_pm_kickchatpm($plid, $authorid[0]['authorid'], $to);
$list=get_member_list($plid);
echo json_encode($list);