<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$latitude  = 22.718281;
$longitude = 75.855324;

$geocodeFromLatLong = file_get_contents('https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyAGQC7r17YyESlAGS8raZ0G1Q-r9Q1s4Vk&latlng='.trim($latitude).','.trim($longitude).'&sensor=false'); 

$output = json_decode($geocodeFromLatLong);
$status = $output->status;
$address = ($status=="OK")?$output->results[1]->formatted_address:'';
echo '<pre>';
print_r($address);
die('Hello');
?>
