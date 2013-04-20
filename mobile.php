<?php
define('APPTYPEID', 1115111);
define('CURSCRIPT', 'mobile');
define('IN_UC', true);
define('UC_API', true);
require_once "./source/class/class_core.php";

$discuz = C::app();
//定义各个模块和缓存
$mobilelist = array('login', 'sendmsg', 'addtoken', 'profiledetail', 'profilesearch', 'friendlist', 'friendadd', 'deletefriend','forumpost','forumreply','singlepost','postlist','postone');
$discuz->cachelist = $mobilelist;
$discuz->init();
require DISCUZ_ROOT.'./source/function/function_forum.php';
require DISCUZ_ROOT.'./source/function/function_mobile.php';
require DISCUZ_ROOT.'./source/function/function_friend.php';
//$_GET['mod']是获取来的 动作名称，根据动作的名称判断 去包含那一个要查询的文件
 
if(empty($_GET['mod']) || !in_array($_GET['mod'], $mobilelist)) $_GET['mod'] = 'index';

  
define('CURMODULE', $_GET['mod']);
runhooks();

 
 echo $_GET['mod']."<hr>";
require DISCUZ_ROOT.'./source/module/mobile/mobile_'.$_GET['mod'].'.php';
 
?>