<?php
define('DIRECTORY_SEPARATO','/');
define('WWW','http://www.enjoyxue.com');

    if(!empty($_FILES)){
 	 $from=$_GET['from'];
	 $to=$_GET['to'];
	 $pmtype=$_GET['pmtype'];  ///私聊   0     群聊  1
	 $plid= $_GET['plid'];
	 $type=$_GET['type']; //0 普通文本消息    1  语音信息      2  图片信息
     $path=DISCUZ_ROOT.'data'.DIRECTORY_SEPARATO.'attachment'.DIRECTORY_SEPARATO.'pm'.DIRECTORY_SEPARATO;
     $pathpost= get_home($pid,$path); 
	 if(!is_dir($pathpost)) {
	  set_home($uid, $path);
	  $pathpost= get_home($uid,$path); 
	 }
	 $file_name=rand_22();
	 $ext=pathinfo($_FILES['postupload']['name'], PATHINFO_EXTENSION);
	 $attachment=date('Ym').DIRECTORY_SEPARATO.date('d').DIRECTORY_SEPARATO.$file_name.".".$ext;
	 
	 $max=move_uploaded_file($_FILES['postupload']['tmp_name'], $pathpost.DIRECTORY_SEPARATO.$file_name.'.'.$ext);
	 $thumb="";
	 if($max){
	  if($type==2){
			 $im=get_image_attachment($pathpost.DIRECTORY_SEPARATO.$file_name.'.'.$ext, '70', '70', $pathpost.'/', $file_name,'thumb');
             if($im){
             $thumb=WWW.'/commerce/data/attachment/pm/'.date('Ym').DIRECTORY_SEPARATO.date('d').DIRECTORY_SEPARATO.$file_name."_thumb.jpg";
             }
	  }
	}
	$pmid=0;
	if($pmtype==1){
	$pm=DB::fetch_all("select max(pmid) pmid from pre_ucenter_pm_indexes where plid=".$plid);
	$pmid=$pm[0]['pmid'];
	} 
	  $pmatt=WWW.'/commerce/data/attachment/pm/'.$attachment;
	  $result=uc_pm_send($from, $to, $subject, $pmatt,1,$pmid,0,$pmtype);
      $sql="select   plid from pre_ucenter_pm_indexes where pmid=$result ";
	$data=DB::fetch_all($sql);
    $amind=$data[0]['plid']%10;
    $sql1="update pre_ucenter_pm_messages_".$amind." set pmtype=$type,thumb='".$thumb."' where   pmid=".$result;
	DB::fetch_all($sql1);  
	echo json_encode(array('pmid'=>$result));
    }else {
     $from=$_GET['from'];
	 $to=$_GET['to'];
	 $pmtype=$_GET['pmtype'];  //0 普通文本消息    1  语音信息      2  图片信息
	 $plid= $_GET['plid'];
 	 $type=$_GET['type'];  //私聊   0     群聊  1
	echo "<form method='post' action='http://www.enjoyxue.com/commerce/mobile.php?mod=uploadpm&plid=$plid&type=$type&from=$from&to=$to&pmtype=$pmtype&'". "enctype='multipart/form-data'>
	<input type=file name='postupload' />
	<input type=submit name='submit' />
	</form> ";
 }
 ?>