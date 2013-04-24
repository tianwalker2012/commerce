<?php
 
/*
   $toid= '1' ;
   $subject='subject';
   $message='你才SB';
   $from='2' ;
   $replay='91';*/
$toid=$_GET['to'];
$subject=$_GET['subject'];
$message=$_GET['message'];
$from=$_GET['from'];
$replay=$_GET['replay'];
   if(isset($replay)&&!empty($replay))
   {
   	$msg_id=sendpm($toid, $subject, $message,$from,$replay);
   }
   else {
   $msg_id=sendpm($toid, $subject, $message,$from);
   }
 echo json_encode($msg_id);
 ?>