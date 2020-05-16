<?php

interface Crud{
	//these methods have to implemented by any class that implements the interface.
	public function save();
	public static function readAll();
	public function readUnique();
	public function search();
	public function update();
	public function removeOne();
	public function removeAll();

	//added these methods for lab2
	public function valiteForm();
	public function createFormErrorSessions();
}

?>