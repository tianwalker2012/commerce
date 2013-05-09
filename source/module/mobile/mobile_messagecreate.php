<?php
 
$from=$_GET['from'];
$to=$_GET['to'];
$message=$_GET['message'];
$pmtype=$_GET['pmtype'];
$type=$_GET['type'];
$plid= $_GET['plid'];

 /*$from=1;
$toid=array(2,3,4,5);//数组
$to=implode(',', $toid);
$subject="New Group";
$message="A New Group"; 
   

echo "<pre>";
$from=1;
$message="what is  new group";
$subject="a_message";
$pmtype=1;
$plid=44;*/
$pmid=0;
if($pmtype==1){
$pm=DB::fetch_all("select max(pmid) pmid from pre_ucenter_pm_indexes where plid=".$plid);
$pmid=$pm[0]['pmid'];
} 

$result=uc_pm_send($from, $to, $subject, $message,1,$pmid,0,$pmtype);
$sql="select max(pmid) pmid from pre_ucenter_pm_indexes ";
$data=DB::fetch_all($sql);
echo json_encode(array('plid'=>$data[0]['plid']));