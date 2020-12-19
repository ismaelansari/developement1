<?php

	$token = 'af44ddb179838984128456f62570cf887973f3c746defab9e931c824aeb597d9';
	
	$alert = 'Hello Shiv';
	$passphrase='';
	$Certificate='certificate.pem';

	$ctx = stream_context_create();
	stream_context_set_option($ctx, 'ssl', 'local_cert', $Certificate);
	stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);


	$fp =stream_socket_client(
			'ssl://gateway.sandbox.push.apple.com:2195', $err, $errstr, 60, STREAM_CLIENT_CONNECT | STREAM_CLIENT_PERSISTENT, $ctx);


	if (!$fp)
		exit("Failed to connect: $err $errstr" . PHP_EOL);

	$body['aps']=[
		'alert' => $alert,
		'sound' => 'default',
		'badge' => 1,
	];

	$payload = json_encode($body);
	$msg=chr(0).pack('n', 32).pack('H*', trim($token)) . pack('n', strlen($payload)).$payload;
	$result=fwrite($fp, $msg, strlen($msg));
	fclose($fp);
?> 
