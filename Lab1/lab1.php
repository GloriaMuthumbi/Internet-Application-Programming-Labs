<?php
include_once 'DBConnector.php';
include_once 'user.php';
include_once 'fileUploader.php';

$con = new DBConnector;

if (isset($_POST['btn-save'])) {
	$first_name = $_POST['first_name'];
	$last_name = $_POST['last_name'];
	$city_name = $_POST['city_name'];

	$username = $_POST['username'];
	$password = $_POST['password'];

	$utc_timestamp = $_POST['utc_timestamp'];
	$offset = $_POST['time_zone_offset'];

	$file_size = $_FILES["fileToUpload"]["size"];
	$target_directory = "uploads/";
	$file_original_name = $_FILES["fileToUpload"]["name"];
	$file_temp_name = $_FILES["fileToUpload"]["tmp_name"];

	$fileToUpload = addslashes(file_get_contents($_FILES["fileToUpload"]["tmp_name"]));

	$uploader = new FileUploader($file_temp_name);
	$user = new User($first_name,$last_name,$city_name,$username,$password,$fileToUpload);

	$uploader->setOriginalName($file_original_name);
	$uploader->setFileSize($file_size);
	$uploader->setFinalFileName($target_directory.basename($file_original_name));
	$pic = $uploader->getFinalFileName();
	$uploader->setFileType(strtolower(pathinfo($pic,PATHINFO_EXTENSION)));

	$uploader->fileWasSelected();
	$uploader->fileAlreadyExists();
	$uploader->fileTypeIsCorrect();
	$uploader->fileSizeIsCorrect();

	$user->setFirstName($first_name);
	$user->setLastName($last_name);
	$user->setCityName($city_name);
	$user->setUserName($username);
	$user->setPassword($password);
	$user->setProfilePic($pic);

	$user->setUtcTimestamp($utc_timestamp);
	$user->setTimeZoneOffset($offset);


	if (!$user->validateForm()) {
		$user->createFormErrorSessions('All fields are required');
		header("Refresh:0");
		die();
	}

	if ($user->isUserExist()) {
		$user->createFormErrorSessions('Username has been taken');
		header("Refresh:0");
		die();
	}

	if (!$uploader->uploadFile()) {
		$user->createFormErrorSessions('File not uploaded');
		header("Refresh:0");
		die();
	}

	$res = $user->save();


	if ($res) {
		echo "<div class=head1 style=\"color:#00FF00\">Save operation was successful!</div>";
	} else {
		echo "<div class=head1 style=\"color:#FF0000\">An error occured!</div>";
		unlink($pic);
	}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="validate.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="timezone.js"></script>

    <title>Sign Up</title>
</head>
<body><!--Mumo added the = sign before server and removed the required from the html tags to remove html validation.-->
    <form method="post" align="center" name="user_details" id="user_details" onsubmit="return validateForm()" enctype="multipart/form-data" action="<?=$_SERVER['PHP_SELF']?>">
        <div id="form-errors">
			<?php 
			session_start();
			if (!empty($_SESSION['form_errors'])) {
				echo " ". $_SESSION['form_errors'];
				unset($_SESSION['form_errors']);
			}
			 ?>
		</div>
		<input type="hidden" name="utc_timestamp" id="utc_timestamp" value="">
		<input type="hidden" name="time_zone_offset" id="time_zone_offset" value="">
		<div><input type="text" name="first_name" placeholder="first name..."></div>
		<div><input type="text" name="last_name" placeholder="last name..."></div>
		<div><input type="text" name="city_name" placeholder="city name..."></div>
		<div><input type="text" name="username" placeholder="user name..."></div>
		<div><input type="password" name="password" placeholder="password..."></div>
		<div><label for="fileToUpload">Profile image:</label><input type="file" name="fileToUpload" id="fileToUpload"></div>
		<div><button type="submit" name="btn-save"><strong>SAVE</strong></button></div>

		<input type="hidden" name="utc_timestamp" id="utc_timestamp" value=""/>
		<input type="hidden" name="time_zone_offset" id="time_zone_offset" value=""/>
		<div><a href="login.php">Login</a></div>
    </form>
	<!--<script type="text/javascript" src="validate.js"></script>-->
</body>
</html>
<!--ALTER TABLE tablename ADD(colname coltype,....) adds more fields to the database-->