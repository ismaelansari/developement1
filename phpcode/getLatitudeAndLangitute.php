<?php


function get_latlng($address) {
        $address = urlencode(trim($address));
        $details_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" . $address . "&sensor=false&key=AIzaSyAGQC7r17YyESlAGS8raZ0G1Q-r9Q1s4Vk";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $details_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $response = json_decode(curl_exec($ch), true);
        if ($response['status'] != 'OK') {
            return null;
        }
        $latLng = $response['results'][0]['geometry']['location'];
        return $latLng;
    }
    
    $search = $_GET['search'];
    
    if(empty($search)){
       $search = 'Indore';
    }
    $response = get_latlng($search);
    print_r($response);
?>
