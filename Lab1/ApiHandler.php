<?php
include_once "DBConnector.php";

class ApiHandler{
    private $meal_name;
    private $meal_units;
    private $unit_price;
    private $status;
    private $user_api_key;

    //getters and setters

    public function setMealName($meal_name){
        $this->meal_name = $meal_name;
    }
    public getMealName(){
        return $this->meal_name;
    }
    public function setMealUnits($meal_units){
        $this->meal_units = $meal_units;
    }
    public function getMealUnits(){
        return $this->meal_units;
    }
    public function setUnitPrice($unit_price){
        $this->unit_price = $unit_price;
    }
    public function getUnitPrice(){
        return $this->unit_price
    }
    public function setStatus($status){
        $this->status = $status;
    }
    public function getStatus(){
        return $this->status;
    }
    public function setUserApiKey($user_api_key){
        $this->user_api_key = $user_api_key
    }
    public function getUserApiKey(){
        return $this->user_api_key;
    }

    public function createOrder(){
        //save the order
        $con = new DBConnector;
        $res = mysqli_query($con->conn, "INSERT INTO orders (order_name,units,unit_price,order_status" VALUES($this->meal_name,$this->meal_units,$this->unit_price,$this->status)) or die(mysqli_error($con->conn));
    }

    public function checkOrderStatus(){
        $con = new DBConnector();
		$order = mysqli_query($con->conn, "SELECT * FROM orders WHERE order_id = '$id' ")->fetch_assoc();

		return $order['order_status'];
    }
    public function fetchAllOrders(){

    }
    public function checkApiKey(){
        return true;
    }
    public function checkContentType(){
        
    }

}

?>