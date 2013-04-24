<?php

$from=$_GET['from'];
$toid=$_GET['to'];//数组
$to=implode(',', $to);
$subject=$_GET['subject'];
$message=$_GET['message'];
$result=uc_pm_send($from, $to, $subject, $message,1,0,0,1);
$prety='token';
$proprety=get_proprety_uid($proprety,1);
foreach ($toid as $k=>$v)
{
 common_simplepush($proprety[0][$proprety],$result, $subject,time(),$v);
}

echo json_encode(array('plid'=>$result));