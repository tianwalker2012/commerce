<?php

function set_home($uid, $dir ) {
		  $uid = sprintf("%09d", $uid);
		  $dir1 = substr($uid, 0, 3);
		  $dir2 = substr($uid, 3, 2);
		  $dir3 = substr($uid, 5, 2);
		  if(!is_dir($dir.$dir1)){
		  	mkdir($dir.$dir1, 0777);
		  } 
		  if(!is_dir($dir.$dir1.DIRECTORY_SEPARATOR.$dir2)){
		  	mkdir($dir.$dir1.DIRECTORY_SEPARATOR.$dir2, 0777);
		  }
		  if(!is_dir($dir.$dir1.DIRECTORY_SEPARATOR.$dir2.DIRECTORY_SEPARATOR.$dir3)){
             mkdir($dir.$dir1.DIRECTORY_SEPARATOR.$dir2.DIRECTORY_SEPARATOR.$dir3, 0777);
		  }
	}
	
 function get_home($uid,$path) {
	    $uid = sprintf("%09d", $uid);
		$dir1 = substr($uid, 0, 3);
		$dir2 = substr($uid, 3, 2);
		$dir3 = substr($uid, 5, 2);
	 return $path.DIRECTORY_SEPARATOR.$dir1.DIRECTORY_SEPARATOR.$dir2.DIRECTORY_SEPARATOR.$dir3;
	}s
 if(!empty($_FILES)){
 	      $uid=$_GET['uid'];
 	    if($uid<10)
 	    {
 	        $uids="0".$uid;
 	    }
 	    else 
 	    {
 	        $len=strlen($uid);
             $uids=substr($uid,$len-2,$len);
 	    }
     $path=DISCUZ_ROOT.'uc_server'.DIRECTORY_SEPARATOR.'data'.DIRECTORY_SEPARATOR.'avatar'.DIRECTORY_SEPARATOR;
	 $pathavatar= get_home($uid,$path); 
	 if(!is_dir($pathavatar)) {
	  set_home($uid, $path);
	  $pathavatar= get_home($uid,$path); 
	 }
	 
 	$max=move_uploaded_file($_FILES['avatarupload']['tmp_name'], $pathavatar.DIRECTORY_SEPARATOR.$uids."_avatar_small.jpg");
 	 DB::fetch_all("update pre_common_member set avatarstatus=1 where uid=".$uid);
 	 echo json_encode(array('avatar'=>"http://www.enjoyxue.com/commerce/uc_server/avatar.php?uid=".$uid."&size=small"));
	}else {
      $uid=$_GET['uid'];
	echo "<form method='post' action='http://www.enjoyxue.com/commerce/mobile.php?mod=uploadavatar&uid=$uid'". "enctype='multipart/form-data'>
	<input type=file name='avatarupload' />
	<input type=submit name='submit' />
	</form> ";
 }
 ?>