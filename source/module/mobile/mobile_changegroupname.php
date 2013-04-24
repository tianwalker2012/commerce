<?php
$plid=$_GET['plid'];
$subject=$_GET['name'];
$subject='greatgroup';
$result=DB::fetch_all("update pre_ucenter_pm_lists set subject ='".$subject."' where plid=".$plid);
echo json_encode(array(200));