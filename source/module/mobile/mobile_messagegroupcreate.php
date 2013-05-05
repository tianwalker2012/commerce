<?php

$from=$_GET['from'];
$persons=$_GET['persons'];//数组
$to=implode(',', $persons);
$subject=$_GET['subject'];
$message=$_GET['message'];
 

/*
$from=1;
$toid=array(2,3,4,5,6,7);//数组
$to=implode(',', $toid);
$subject="this is a test";
 $message="this is a testthis is a testthis is a testthis is a testthis is a test"; 
*/
 
 $result=uc_pm_send($from, $to, $subject, $message,1,0,0,1);
 $sql="select plid from pre_ucenter_pm_indexes where pmid=$result limit 1";
$data=DB::fetch_all($sql);
echo json_encode(array('plid'=>$data[0]['plid'],'subject'=>$subject,'dateline'=>time(),'persons'=>$persons));