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
	 	$profile['avatarstatus']=$profile['avatarstatus']="http://www.enjoyxue.com/commerce/uc_server/avatar.php?uid=".$profile['uid']."&size=small";
		$back=array('uid'=>$profile[0]['uid'],
			        'email'=>$profile[0]['email'],	 
			        'username'=>$profile[0]['username'],	 
			        'avatar'=>$profile['avatarstatus'],
		            'mobilephone'=>$profiledetail[$uid]['mobile'],
		            'postion'=>$profiledetail[$uid]['postion'],
		            'location'=>$profiledetail[$uid]['resideprovince'].$profiledetail[$uid]['residecity'].$profiledetail[$uid]['residedist'].$profiledetail[$uid]['residecommunity'].$profiledetail[$uid]['residesuite'],	 
	                'latitude'=>$profiledetail[$uid]['latitude'],
		            'longitude'=>$profiledetail[$uid]['longitude'],
		            'bio'=>$profiledetail[$uid]['bio'],
		            'company'=>$profiledetail[$uid]['company'],
		            'industry'=>$profiledetail[$uid]['occupation'],
		            'gender'=>$profiledetail[$uid]['gender'],
		            'friendnum'=>$num[$uid]['num'],
		            'postnum'=>$postnum[$uid]['num'],
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
	 
	 
	 
	 function get_member($list,$plid)
	 {
	 	$persons=array();
	 	$name=DB::fetch_all("select subject from pre_ucenter_pm_lists where plid=".$plid);
	 	foreach ($list['member'] as $k=>$v){
	 		array_push($persons, $v);
	 	}
	 	if(!empty($persons)){
          $data=array('author'=>$list['author'],'name'=>$name[0]['subject'],'persons'=>$persons);
	 	}else{
	 	 $data=array('total_count'=>0);
	 	}
	 	return $data;
	 }
	 
	 function get_cycle_member($gid)
	 {
	 	 
	 	
	 	$sql ="select g.uid from pre_forum_groupuser g where g.fid=".$gid;
	 	$result=DB::fetch_all($sql);
	 	$persons=array();
	 	foreach ($result as $k=>$v){
	 		array_push($persons, $v['uid']);
	 	}
	 	$sql ="select f.fid,f.name from pre_forum_forum f  ";
	 	$sql.=" where f.fid=".$gid;
	 	$result=DB::fetch_all($sql);
	 	if(!empty($result)){
	 		$data=array('cycleid'=>$result[0]['fid'],'name'=>$result[0]['name'],'persons'=>$persons);
	 	}else {
	 		$data=array('total_count'=>0);
	 	}
      return $data;	 	
	 }
	 
	 
	 
	 

?>