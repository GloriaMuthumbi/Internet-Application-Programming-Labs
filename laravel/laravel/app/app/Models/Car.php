<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;
    public function up()
    {
        Schema::create('cars',function(Blueprint $table){
            $table->bigIncrements('id');
            $table->string('make');
            $table->string('model');
            $table->date('produced_on');
            $table->timestamp();
        });
    }
}
