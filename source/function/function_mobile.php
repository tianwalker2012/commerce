<?php
function common_simplepush($deviceToken,$plid,$subject,$time,$sender_id)
{
	$passphrase = 'tian@walk2';
	$ctx = stream_context_create();
	stream_context_set_option($ctx, 'ssl', 'local_cert', dirname(__FILE__).DIRECTORY_SEPARATOR."ck.pem");
	stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);
	$fp = stream_socket_client(
			'ssl://gateway.sandbox.push.apple.com:2195', $err,
			$errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);
	if (!$fp)
		exit("Failed to connect: $err $errstr" . PHP_EOL);
	//echo 'Connected to APNS' . PHP_EOL;
	$body['aps'] = array(
			'alert' => $message,
			'sound' => 'default'
	);
	$body['sender_id'] = $sender_id;
	$body['message_id'] = $id;
	$body['group_id'] = $group_id;
	$body['date']=date('y-m-d');
	$payload = json_encode($body);
	$msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;
	$result = fwrite($fp, $msg, strlen($msg));
	fclose($fp);
}


 function get_user_info($uid)
 {      
 	    $back=array();
		$profile=c::t('common_member')->fetch_uid_by_user_id($uid);
		$profiledetail=c::t('common_member_profile')->fetch_all($uid);
		$num=c::t('home_friend')->friendnum($uid);
		$postnum=c::t('forum_post')->postnum($uid);
		if($profile)
		{
			if($profile[0]['avatarstatus'])
			{
				  $profile['avatarstatus']=discuz_uc_avatar($uid,'small',true);
			} else 
			{
				$profile['avatarstatus']=null;
			}
			$back=array('uid'=>$profile[0]['uid'],
				        'email'=>$profile[0]['email'],	 
				        'username'=>$profile[0]['username'],	 
				        'avatar'=>$profile['avatarstatus'],
			            'mobilephone'=>$profiledetail[0]['mobile'],
			            'postion'=>$profiledetail[0]['postion'],
			            'location'=>$profiledetail[0]['resideprovince'].$profiledetail[0]['residecity'].$profiledetail[0]['residedist'].$profiledetail[0]['residecommunity'].$profiledetail[0]['residesuite'],	 
		                'latitude'=>$profiledetail[0]['latitude'],
			            'longitude'=>$profiledetail[0]['longitude'],
			            'bio'=>$profiledetail[0]['bio'],
			            'company'=>$profiledetail[0]['company'],
			            'industry'=>$profiledetail[0]['occupation'],
			            'gender'=>$profiledetail[0]['gender'],
			            'friendnum'=>$num[0]['num'],
			            'postnum'=>$postnum[0]['num'],
			);
			 return $back;
		}else 
		{
			return $back;
		}
		
 }
 
	   function get_array_inner($inner)
	 {
	 	$result=array();
	 	foreach ($inner as $k=>$v){
	 		$result[]=$v[0];
	 	}
	 	return $result;
	 }
	 
	 
	 function ArrMax($data,$arrkey){
		$tree = array();
		foreach ($data as $key=>$val)
		{
		$pro[]=$val[$arrkey];
		}
		array_multisort($pro,SORT_DESC);
		for($j=0;$j<count($pro);$j++){
		for($i=0;$i<count($data);$i++)
		{
		if($pro[$j]==$data[$i][$arrkey]){
		$tree[$j] = $data[$i];
		}
		}
		}
		return $tree;
	 }
	 function start_limit($date,$start,$limit)
	 {
	 	$result=array();
	 	for ($i=$start;$i<=$limit;$i++){
		 		foreach ($date as $k=>$v)
		 		{
		 			$result[]=$date[$i];
		 		}
	 	}
	 	return $result;
	 }

	 
	 function get_proprety_uid($proprety,$uid)
	 {
	 	return c::t('common_member_profile')->get_property($proprety,$uid);
	 }
	 
	 function get_member_list($plid)
	 {
	 	$authorid=DB::fetch_all("select authorid from pre_ucenter_pm_lists where plid=".$plid);
	 	return uc_pm_chatpmmemberlist($authorid[0]['authorid'],$plid);
	 	
	 }

?>