<?php
$plid=$_GET['plid'];
$start=$_GET['start'];
$limit=$_GET['limit'];
$lastint=$plid % 10;
$sql="select * from pre_ucenter_pm_messages_$lastint order by dateline desc limit $start,$limit ";
$result=DB::fetch_all($sql);
echo json_encode($result);