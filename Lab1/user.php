<?php
include "Crud.php";
include "Authenticator.php";
include_once 'DBConnector.php';
class User implements Crud, Authenticator {
    private $conn;
    private $first_name;
    private $last_name;
    private $city_name;

    //new variables for login in
    private $username;
    private $password;

    function __construct($first_name,$last_name,$city_name,$username,$password){//error of few arguments
        $this->first_name = $first_name;
        $this->last_name = $last_name;
        $this->city_name = $city_name;
        $this->username = $username;
        $this->password = $password;
    }
    //php doesn't allow multiple constructors so we are faking one.
    /*public static function create(){
        $instance = new self($first_name,$last_name,$city_name,$username,$password);//error few arguments got rid by adding them
        return $instance;
    }*/

    public static function create() {
        $reflection = new ReflectionClass("User");
        $instance = $reflection->newInstanceWithoutConstructor();
        return $instance;
        //error occured here
        //$instance = new self();
        //return $instance;
    }

    public function setUsername($username){
        $this->username = $username;
    }

    public function getUsername(){
        return $this->username;
    }

    public function setPassword($password){
        $this->password = $password;
    }

    public function getPassword(){
        return $this->password;
    }

    public function setUserId($user_id){
        $this->user_id = $user_id;
    }

    public function getUserId(){
        return $this->user_id;
    }

    public static function connection(\PDO $pdo){
        $this->conn = $pdo;
    }

    public function save(){

        $con = new DBConnector;

        $fn = $this->first_name;
        $ln = $this->last_name;
        $city = $this->city_name;
        $uname = $this->username;
        $this->hashPassword();//our function to hash the password
        $pass = $this->password;
        $res = mysqli_query($con->conn,"INSERT INTO user(first_name,last_name,user_city,username,password) VALUES('$fn','$ln','$city','$uname','$pass')") or die("Error ".mysqli_error($con->conn));
        $con->closeDatabase();
        return $res;
    }
    public static function readAll(){
        $con = new DBConnector;
        $res = mysqli_query($con->conn,"SELECT * FROM user") or die("Error ".mysqli_error($con->conn));
        $con->closeDatabase();
        return $res;
    }
    public function readUnique(){
        return null;
    }public function search(){
        return null;
    }public function update(){
        return null;
    }public function removeOne(){
        return null;
    }public function removeAll(){
        return null;
    }
    public function valiteForm(){
        //returns true if the values are not empty
        $fn = $this->first_name;
        $ln = $this->last_name;
        $city = $this->city_name;
        if($fn == "" || $ln == "" || $city == ""){
            return false;
        }
        return true;
    }
    public function createFormErrorSessions(){
        session_start();
        $_SESSION['form_errors'] = "All fields are required";
    }
    public function hashPassword(){
        //inbuilt function to hash passwords of users
        $this->password = password_hash($this->password,PASSWORD_DEFAULT);
    }

    public function isPasswordCorrect(){

        $con = new DBConnector;
        
        $res = mysqli_query($con->conn,"SELECT password, username FROM user") or die("Error ".mysqli_error($con->conn));

        while($row = mysqli_fetch_assoc($res)){
            if(password_verify($this->getPassword(),$row['password']) && $this->getUsername()==$row['username']){
                mysqli_free_result($res);
                $found = true;
            }
        }
        $con->closeDatabase();
        return $found;
    }

    public function login(){
        //password is correct, so we load the protected page
        if($this->isPasswordCorrect()){
            header("location:private_page.php");
        }
    }

    public function createUserSession(){
        session_start();
        $_SESSION['username'] = $this->getUsername();
    }

    public function isUserExist(){
        
    }

    public function logout(){
        session_start();
        unset($_SESSION['username']);
        session_destroy();
        header("Location:lab1.php");//returns to sign up page when the user logs out
    }
}


?>