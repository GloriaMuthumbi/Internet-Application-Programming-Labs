<?php
//these are the login page codes
include_once 'DBConnector.php';
include_once 'user.php';

$con = new DBConnector;
if(isset($_POST['btn-login'])){
    $username = $_POST['username'];
    $password = $_POST['password'];
    $instance = User::create();
    $instance->setPassword($password);
    $instance->setUsername($username);

    if($instance->isPasswordCorrect()) {
        $instance->login();
        $con->closeDatabase();
        $instance->createUserSession();
    } else {
        $con->closeDatabase();
        $instance->createFormErrorSessions("Username or Password is incorrect.");
       header("Location:login.php");
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <script type="text/javascript" src="validate.js"></script>
        <link rel="stylesheet" type="text/css" href="validate.css">
    </head>
    <body>
    <!--'=$_SERVER['PHP_SELF']' means that we are submitting this form to itself for processing-->
        <form method="post" name="login" id="login" action="<?php echo $_SERVER['PHP_SELF']?>">
            <table align="center">
                <tr>
                    <td><input type="text" name="username" placeholder="Username" required/></td>
                <tr>
                <tr>
                    <td><input type="password" name="password" placeholder="Password" required/></td>
                <tr>
                <tr>
                    <td><button type="submit" name="btn-login"><strong>LOGIN</strong></button></td>
                <tr>
            </table>
        </form>
        
    </body>
</html>