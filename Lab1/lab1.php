<?php
include_once 'DBConnector.php';
include_once 'user.php';

if(isset($_POST['btn-save'])){
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $city = $_POST['city_name'];

	$user = new User($first_name,$last_name,$city);
	if(!$user->valiteForm()){
		$user->createFormErrorSessions();
		header("Refresh:0");
		die();
	}
	$res = $user->save();
	
	if($res){
		echo "Save operation was successful";
	}else{
		echo "An error occured!";
	}
}?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Title goes here</title>
		<script type="text/javascript" src="validate.js"></script>
		<link rel="stylesheeet" type"text/css" href="validate.css">
	</head>
	<body>
		<form method="post" name="user_details" id="user_details" onsubmit="return validateForm()" action="<?=SERVER['PHP_SELF']?>">
			<table align="center">
				<tr>
				<td>
					<div id="form-error">
					<?php
						session_start();
						if(!empty($_SESSION['form_errors'])){
							echo "".$_SESSION['form_errors'];
							unset($_SESSION['form_errors']);
						}
					?>
				</td>
				</tr>
				<tr>
					<td><input type="text" name="first_name" required placeholder="First Name" /></td>
				</tr>
				<tr>
					<td><input type="text" name="last_name" placeholder="Last Name" /></td>
				</tr>
				<tr>
					<td><input type="text" name="city_name" placeholder="City" /></td>
				</tr>
				<tr>
					<td><button type="submit" name="btn-save"><strong>SAVE</strong></button></td>
				</tr>
			</table>
		</form>
	</body>
</html>