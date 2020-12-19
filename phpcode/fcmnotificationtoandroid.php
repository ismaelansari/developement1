<?php

  function fcmNotification($device_token = array() ,$data = array()){
   
    $registration_ids =  $device_token;
    $message = array(
      "message" => $data
    );
  
    $url = 'https://fcm.googleapis.com/fcm/send';
    $fields = array(
    'registration_ids' => $registration_ids,
    'data' => $message,
    );
    $headers = array(
    'Authorization: key=' . "AAAAORSizbQ:APA91bEveAbKk5JvuUsWXYmpucla7kMCdi6VY1ZWR0igOAimVC4Iqw6onTJJy98JPEl8n5HDDxFAgeSzNOPSPybQwaM_YEqc5J0y8HT4t5e5rHZlXLSml-W0B6TNAnU7VKN-Mi0iWYmV",
    'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
    $result = curl_exec($ch);
    if ($result === FALSE)
      {
      die('Curl failed: ' . curl_error($ch));
      }
    curl_close($ch);
    }

    $data = array(
      'title' => 'hello Sir',
      'body'  => 'hello Shir kaiso ho',
    );

    $token = array('f106gwPTeP0:APA91bFBnEDORIW921Vdivl0gKuFkhs8FGrIuZC3REpr7aWq7eREK0mLWCDS_YLFcKqfWW-DR4S1rafseHiVUIIxoI-YlgGixt5gtb5vWHFNclkPjwVStYhFmVqqjquPQd4L3TfLgfIj');

    fcmNotification($token,$data);

?>
