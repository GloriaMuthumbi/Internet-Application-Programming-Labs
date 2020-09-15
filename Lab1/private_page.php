<?php
include_once "DBConnector.php";
    session_start();
    if(!isset($_SESSION['username'])){
        header("Location:login.php");
    }

    function fetchUserApiKey(){
        $con = new DBConnector();
        $user = $_SESSION['username'];
        $query = mysqli_query($con->conn, "SELECT * FROM user WHERE username='$user'");
        $array = $query->fetch_assoc();
        $user_id = $array['user_id'];
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
    <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="validate.js"></script>
    <link rel="stylesheet" type="text/css" href="validate.css">
    <script type="text/javascript" src="apikey.js"></script>
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

    <p align="right"><a href="logout.php">Logout</a></p>
	<hr>
	<h3>Here, we will create an API that will allow Users/Developer to order items from external sytems</h3>
	<hr>
	<h4>We now put this feature of allowing users to generate API key. Click the button to generate API key</h4>
	<button class="btn btn-primary" id="api-key-btn">Generate API Key</button> <br><br>
	<strong>Your API key:</strong>(Note that if your API key is already in use by already running application, generating a new key will stop the application from functioning)<br>
	<textarea cols="100" rows="2" id="api_key" readonly><?php echo fetchUserApiKey(); ?></textarea>
	<h3>Service description:</h3>
	We have a service/API that allows external applications to order food and also pull all order status by using order id. Let's do it
	<hr>
</body>
</html>