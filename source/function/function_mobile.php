<?php
function common_simplepush($deviceToken,$message,$sender_id,$id,$group_id=null)
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


 


?>