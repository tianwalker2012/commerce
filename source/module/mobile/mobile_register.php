<?php

/* 
$newusername="ysabin123yabin";
 $newpassword="a";
 $newemail="1263s418541094@qq.com";

*/ 

  $newusername = trim($_GET['username']);
  $newpassword = trim($_GET['password']);
  $newemail = strtolower(trim($_GET['email']));
if(!$newusername || !isset($_GET['confirmed']) && !$newpassword || !isset($_GET['confirmed']) && !$newemail) {
	cpmsg('members_add_invalid', '', 'error');
}

if(C::t('common_member')->fetch_uid_by_username($newusername) || C::t('common_member_archive')->fetch_uid_by_username($newusername)) {
	cpmsg('members_add_username_duplicate', '', 'error');
}


     $uid = uc_user_register(addslashes($newusername), $newpassword, $newemail);
if($uid <= 0) {
	if($uid == -1) {
		cpmsg('members_add_illegal', '', 'error');
	} elseif($uid == -2) {
		cpmsg('members_username_protect', '', 'error');
	} elseif($uid == -3) {
		if(empty($_GET['confirmed'])) {
			cpmsg('members_add_username_activation', 'action=members&operation=add&addsubmit=yes&newgroupid='.$_GET['newgroupid'].'&newusername='.rawurlencode($newusername), 'form');
		} else {
			list($uid,, $newemail) = uc_get_user(addslashes($newusername));
		}
	} elseif($uid == -4) {
		cpmsg('members_email_illegal', '', 'error');
	} elseif($uid == -5) {
		cpmsg('members_email_domain_illegal', '', 'error');
	} elseif($uid == -6) {
		cpmsg('members_email_duplicate', '', 'error');
	}
}
$group = C::t('common_usergroup')->fetch($_GET['newgroupid']);
$newadminid = in_array($group['radminid'], array(1, 2, 3)) ? $group['radminid'] : ($group['type'] == 'special' ? -1 : 0);
if($group['radminid'] == 1) {
	cpmsg('members_add_admin_none', '', 'error');
}
if(in_array($group['groupid'], array(5, 6, 7))) {
	cpmsg('members_add_ban_all_none', '', 'error');
}
$profile = $verifyarr = array();
loadcache('fields_register');
$init_arr = explode(',', $_G['setting']['initcredits']);
$password = md5(random(10));
C::t('common_member')->insert($uid, $newusername, $password, $newemail, 'Manual Acting', $_GET['newgroupid'], $init_arr, $newadminid);
if($_GET['emailnotify']) {
	if(!function_exists('sendmail')) {
		include libfile('function/mail');
	}
	$add_member_subject = lang('email', 'add_member_subject');
	$add_member_message = lang('email', 'add_member_message', array(
		'newusername' => $newusername,
		'bbname' => $_G['setting']['bbname'],
		'adminusername' => $_G['member']['username'],
		'siteurl' => $_G['siteurl'],
		'newpassword' => $newpassword,
	));
	if(!sendmail("$newusername <$newemail>", $add_member_subject, $add_member_message)) {
		runlog('sendmail', "$newemail sendmail failed.");
	}
}
 
  $user_inf=get_user_info($uid);
 if($uid)
{
 echo json_encode($user_inf);
}
else
 { 
 	header('HTTP/1.1 error 406' );
 }
  