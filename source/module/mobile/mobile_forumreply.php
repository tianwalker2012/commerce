<?php
/*
 * 
 * 
 * fid`='2' , `tid`='7' , `first`='0' , `author`='admin' , `authorid`='1' , `subject`='' , `dateline`='1364186627' , `message`='阿萨飒飒飒飒飒飒飒飒' ,
 `useip`='::1' , `invisible`='0' , `anonymous`='0' , `usesig`='1' , `htmlon`='0' ,
 `bbcodeoff`='-1' , `smileyoff`='-1' , `parseurloff`=0 , `attachment`='0' , `status`='0' , `pid`='14'
 * 
 * 
 * */
$fid='2';
$tid=9;
$first='0';
$author='admin1';
$subject='';
$message='this is just a testing';
$dateline=time();
$authorid='2';
$useip="::1";
$data=array('fid'=>$fid,'tid'=>$tid,
		    'first'=>$first,'author'=>$author,
		    'subject'=>$subject,'message'=>$message,
		    'dateline'=>$dateline,
		    'authorid'=>$authorid,'useip'=>$useip,
		    'invisible'=>0,'anonymous'=>'0',
		    'usesig'=>'1','htmlon'=>'0',
		    'bbcodeoff'=>'-1','smileyoff'=>'-1',
		    'parseurloff'=>'0','status'=>'0');

  $result=insertpost($data);