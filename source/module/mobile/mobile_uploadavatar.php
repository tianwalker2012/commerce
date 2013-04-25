<?php 
$uid=$_GET['uid'];

if(empty($_FILES["upavatar"])){
echo "<form method=post action='http://localhost/commerce/mobile.php?mod=uploadavatar' enctype='multipart/form-data'>
<input name='upavatar' type='file'>
<br>
<input name='suavatar' type='submit' value='上传头像'>
</form>";
}
else{
	var_dump($_FILES["upavatar"]);
}
?>