<?php
 
/*
$toid=$_GET['to'];
$subject=$_GET['subject'];
$message=$_GET['message'];
$from=$_GET['from'];
$replay=$_GET['replay'];
*/
   $toid= '1' ;
   $subject='subject';
   $message='你才SB';
   $from='2' ;
   $replay='91';
   if(isset($replay)&&!empty($replay))
   {
   	$msg_id=sendpm($toid, $subject, $message,$from,$replay);
   }
   else {
   $msg_id=sendpm($toid, $subject, $message,$from);
   }
   if($msg_id){
    $profile=c::t('common_member')->fetch_all_username_by_uid($toid);
    common_simplepush($pd->field_value, $profile[1].":".$message,$from,$msg_id);
    echo json_encode(array('result'=>'success','data'=>array('msgid'=>$msg_id)));
   }else
   {
   	echo json_encode(array('result'=>'error'));
   }
 ?>