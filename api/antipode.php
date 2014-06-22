<?php 
    // get the users langtitude and longtitude from their ip-address
    $ip  = !empty($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
    
    // get the values from the current IP-address
    $url = "http://freegeoip.net/json/$ip";
    $ch  = curl_init();
    
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
    $data = curl_exec($ch);
    curl_close($ch);
    
    // if there's data, decode it and get the coordinates
    if ($data) {
        $location = json_decode($data);
    
        //get the exact coördinates    
        $lat = $location->latitude;
        $lon = $location->longitude;
        
    } 
    
    // if there isn't any data returned, return the values of the tate's space. 
    else {
        $lat = 38.68551;
        $lon = -96.503906;
    }
    
    // calculate the antipode 
    $lat = $lat*-1; 
    $lon = $lon+180; 
    
    // get the weather report of the coordinates 
    $response = file_get_contents('http://api.openweathermap.org/data/2.5/weather?lat='.$lat.'&lon='.$lon.'');
    
    // decode it in order to get the wind speed and degrees. 
    $response = json_decode($response); 
    $windspeed = $response->wind->speed;
    $angle = $response->wind->deg; 

    // show the speed and angle of the antipode of the current location.
    $arr = array('speed' => $windspeed, 'angle' => $angle); 
    
    echo json_encode($arr); 
?> 

