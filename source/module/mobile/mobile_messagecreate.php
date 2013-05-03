<?php
$toid=$_GET['to'];
$subject=$_GET['subject'];
$message=$_GET['message'];
$from=$_GET['from'];
$plid=$_GET['plid']; 
$type=$_GET['type'];
   if(isset($plid)&&!empty($plid))
   {
   	$msg_id=sendpm($toid, $subject, $message,$from,$plid);
   }
   else {
   $msg_id=sendpm($toid, $subject, $message,$from);
   }
 echo json_encode(array('pmid'=>$msg_id));
 ?>