<?php
$plid=$_GET['plid'];
$toid=$_GET['to'];//数组
$to=implode(',', $to);
$list=get_member_list($plid);
$data=get_member($list,$plid);
 echo json_encode($data);