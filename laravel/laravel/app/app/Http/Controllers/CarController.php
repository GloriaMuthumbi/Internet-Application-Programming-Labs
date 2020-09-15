<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CarController extends Controller
{
    public function allcars(){
        //read allcars
        return Car::all();
    }

    public function particularcar($id){
        //read a paricular car identified by id
    }

    public function newcar(){
        //create a new car
    }
}
