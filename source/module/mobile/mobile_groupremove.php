<?php
$plid=$_GET['plid'];
$persons=$_GET['persons'];//数组
$to=implode(',', $persons);
$authorid=DB::fetch_all("select authorid from pre_ucenter_pm_lists where plid=".$plid);
uc_pm_kickchatpm($plid, $authorid[0]['authorid'], $to);
$list=get_member_list($plid);
 $data=get_member($list,$plid);
 echo json_encode($data);