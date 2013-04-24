<?php
$plid=$_GET['plid'];
$toid=$_GET['to'];//数组
$to=implode(',', $to);
$authorid=DB::fetch_all("select authorid from pre_ucenter_pm_lists where plid=".$plid);
 
 uc_pm_appendchatpm($plid, $authorid[0]['authorid'], $to);
$list=uc_pm_chatpmmemberlist($authorid[0]['authorid'],$plid);
 
echo json_encode($list);