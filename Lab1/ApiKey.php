<?php
include_once 'DBConnector.php';

if($_SERVER['REQUEST_METHOD'] !== 'POST'){
    //don't allow users to visit this page via a url
    header('HTTP/1.0 403 Forbidden');
    echo 'You are forbidden from viewing this page!';
}else{
    $api_key = null;
    $api_key = generateApiKey(64);//generate an API key characters long
    header("Content-type: application/json;");
    //our response if a json is one
    echo generateResponse($api_key);
}

function generateApiKey($str_length){
    $chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

    $bytes = openssl_random_pseudo_bytes(3*$str_length/4+1);

    //convert base 64 to base 62 by mapping + and / to something from base 62 map
    //use the first 2 random bytes for the new characters
    $repl = unpack('C2',$bytes);

    $first = $chars[$repl[1]%62];
    $second = $chars[$repl[2]%62];

    return strtr(substr(base64_encode($bytes),0,$str_length),'+/',"$first$second");
}
function saveApiKey($api_key){
    session_start();
    $con = new DBConnector();
    $user = $_SESSION['username'];
    $query = mysqli_query($con->conn, "SELECT * FROM user WHERE username='$user'");
    $array = $query->fetch_assoc();
    $user_id = $array['user_id'];
    $saved = mysqli_query($con->conn, "INSERT INTO api_keys(user_id,api_key) VALUES('$user_id','$api_key')") or die(mysqli_error($con->conn));

    if($saved === true){
        return true;
    }
    return false;

}

function generateResponse($api_key){
    if(saveApiKey($api_key)){
        $res = ['success' => 1, 'message' => $api_key];
    }else{
        $res = ['success' => 0, 'message' => 'Something went wrong, Please regenerate the API key'];
    }
    return json_encode($res);
}

?>