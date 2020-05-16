<?php
include_once 'DBConnector.php';
include_once 'user.php';
//data insert code starts here
if(isset($_POST['btn-save'])){
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
	$city = $_POST['city_name'];
	
	//create user object
	/*Note the way we create our object using a constructor that
	will be used to initialize our variables.*/
	$user = new User($first_name,$last_name,$city);
	if(!$user->valiteForm()){
		$user->createFormErrorSessions();
		header("Refresh:0");
		die();
    }
    $res = $user->save();

	//checks if the operation was esuccessful
    if($res){
        echo"Save operation was successful";
    }else{
        echo"An error occured!";
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="validate.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab1</title>
</head>
<body><!--Mumo added the = sign before server and removed the required from the html tags to remove html validation.-->
    <form method="post" name="user_details" id="user_details" onsubmit="return validateForm()" action="<?=$_SERVER['PHP_SELF']?>">
        <table align="center">
        
			<tr>
				<td>
					<div id="form-errors">
						<?php
							session_start();
							if(!empty($_SESSION['form_errors'])) {
								echo " " . $_SESSION['form_errors'];
								unset($_SESSION['form_errors']);
							}
						?>
					</div>
				</td>
			</tr>
            <tr>
                <td><input type="text" name="first_name" required placeholder="First Name"/></td>
            </tr>
            <tr>
                <td><input type="text" name="last_name" placeholder="Last Name"/></td>
            </tr>
            <tr>
                <td><input type="text" name="city_name" placeholder="City"/></td>
            </tr>
            <tr>
                <td><button type="submit" name="btn-save"><strong>SAVE</strong></button></td>
            </tr>
        </table>
    </form>
	<script type="text/javascript" src="validate.js"></script>
</body>
</html>