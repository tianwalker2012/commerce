<?php
 
$from=$_GET['authorid'];
$persons=$_GET['persons'];//数组
$to=implode(',', $persons);
$subject=$_GET['name'];
$message=$_GET['message'];
 
 /*
$from=1;
$toid=array(2,3,4,5);//数组
$to=implode(',', $toid);*/
$subject="New Group";
$message="A New Group"; 
  
 
$result=uc_pm_send($from, $to, $subject, $message,1,0,0,1);
$sql="select plid from pre_ucenter_pm_indexes where pmid=$result limit 1";
$data=DB::fetch_all($sql);
echo json_encode(array('plid'=>$data[0]['plid']));