<?php
include "DBConnector.php";
    session_start();
    if(!isset($_SESSION['username'])){
        header("Location:login.php");
    }

    function fetchUserApiKey(){
        $con = new DBConnector();
        $user = $_SESSION['username'];
        $query = mysqli_query($con->conn, "SELECT * FROM user WHERE username='$user'");
        $array = $query->fetch_assoc();
        $user_id = $array['id'];
        $saved = mysqli_query($con->conn, "SELECT * FROM api_keys WHERE user_id = '$user_id' ORDER BY `api_keys`.`id` DESC") or die(mysqli_error($con->conn));
        $user_key = $saved->fetch_assoc();
        return $user_key['api_key'];
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Private Page</title>
    <script src="jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="validate.js"></script>
    <link rel="stylesheet" type="text/css" href="validate.css">
    <!--Bootstrap file -->

    <script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

    <!--cs--> 
    <script rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"></script>
    <script rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css.map"></script>
    <script rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"></script>
    <script rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css.map"></script>
    <script rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.css"></script>
    <script rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.css.map"></script>
    <script rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.min.css"></script>
    <script rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-theme.min.css.map"></script>
</head>
<body>
        <p> This is a private page </p>
        <p> We want to protect it </p>
        <p><a href="logout.php">Logout</p>
        <hr>
        <h3>Here we will create an API the will allow Users/Developer to order items from external systems</h3>
        <hr>
        <h4>We now put this feature of allowing users to generate an API key. Click the button to generate the API key.</h4>

        <button class="btn btn-primary" id="api-key-btn"> Generate APi key</button><br><br>
        <!--This text area will hold the API key-->
        <strong>Your API key: </strong>(Note that if your API key is already is already in use by an already running applications, generation a new key will stop the application from funtioning)<br>
        <textarea cols="100" row="2" id="api_key" name="api_key" readonly><?php echo fetchUserApiKey();?></textarea>

        <h3>Service description</h3>
        We have a service/API that allows external applications to order food and also
        pull all order status by using order if. Lets do it.
        <hr>
</body>
</html>