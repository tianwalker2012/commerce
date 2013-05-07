<?php
define('DIRECTORY_SEPARATO','/');
function set_home($uid, $path ) { 
    $dir1=date('Ym');
    $dir2=date('d');
	if(!is_dir($path.$dir1)){
		mkdir($path.$dir1,0777);
	}
	if(!is_dir($path.$dir1.DIRECTORY_SEPARATO.$dir2)){
		mkdir($path.$dir1.DIRECTORY_SEPARATO.$dir2,0777);
	}
	}
	
 function get_home($uid,$path) { 
 	  $dir1=date('Ym');
	  $dir2=date('d');
	 return $path.$dir1.DIRECTORY_SEPARATO.$dir2.DIRECTORY_SEPARATO;
	}
	
function rand_22()
{
	$pattern = '1234567890abcdefghijklmnopqrstuvwxyz';
	$code1="";
	$code2="";
	for($i = 0; $i < 6; $i++) {
	        $code1 .= $pattern{mt_rand(0, 10)};
	};
	for($i = 0; $i < 16; $i++) {
	        $code2 .= $pattern{mt_rand(0, 36)};
	};
	return $code1.$code2;
}
    if(!empty($_FILES)){
 	 $pid=$_GET['pid'];
 	 $type=$_GET['type'];
     $path=DISCUZ_ROOT.'data'.DIRECTORY_SEPARATO.'attachment'.DIRECTORY_SEPARATO.'forum'.DIRECTORY_SEPARATO;
     $pathpost= get_home($pid,$path); 
	 if(!is_dir($pathpost)) {
	  set_home($uid, $path);
	  $pathpost= get_home($uid,$path); 
	 }
	 $file_name=rand_22();
	 $ext=pathinfo($_FILES['postupload']['name'], PATHINFO_EXTENSION);
	 $attachment=date('Ym').DIRECTORY_SEPARATO.date('d').DIRECTORY_SEPARATO.$file_name.".".$ext;
	 $max=move_uploaded_file($_FILES['postupload']['tmp_name'], $pathpost.DIRECTORY_SEPARATO.$file_name.'.'.$ext);
	if($max){
	    $num=DB::fetch_all("update pre_forum_post set attachment=attachment+1 where pid=".$pid);
		  $post=DB::fetch_all("select * from pre_forum_post where pid=".$pid);
		  $tabid=$post[0]['tid']%10;
		   $data=array('pid'=>$pid,'uid'=>$post[0]['authorid'],
		            'tid'=>$post[0]['tid'],'filename'=>$_FILES['postupload']['name'],
		            'fsize'=>$_FILES['postupload']['size'],
		             'attachment'=>$attachment,
		             'tableid'=>$tabid,
		            'dateline'=>time(),'isimage'=>$type,
		            );
	   $res=c::t('forum_attachment_n')->addaction($data);
	   if($res){
	   echo json_encode(array("url"=>"www.enjoyxue.com/commerce/data/attachment/forum/.$attachment"));
	   }else {
	   echo json_encode(array("total_count"=>"0"));
	   }
	  
	}
    }else {
      $pid=$_GET['pid'];
	echo "<form method='post' action='http://www.enjoyxue.com/commerce/mobile.php?mod=uploadpost&pid=$pid'". "enctype='multipart/form-data'>
	<input type=file name='postupload' />
	<input type=submit name='submit' />
	</form> ";
 }
 ?>