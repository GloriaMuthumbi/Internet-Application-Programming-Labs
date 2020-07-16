<?php
class FileUploader{
    //Member variables
    private static $target_directory = "uploads/";
    private static $size_limit = 50000; // in bytes
    private $uploadOk = false;
    private $file_original_name;
    private $file_type;
    private $file_size;
    private $final_file_name;


    function __construct($file_temp_name){
        $this->file_temp_name = $file_temp_name;
    }
    //getters and setters
    public function setOriginalName($name){
        $this->file_original_name = $name;
    }
    public function getOriginalName(){
        return $this->file_original_name;
    }
    public function setFileType($type){
        $this->file_type = $type;
    }
    public function getFileType(){
        return $this->file_type;
    }
    public function setFileSize($size){
        $this->file_size = $size;
    }
    public function getFileSize(){
        return $this->file_size;
    }
    public function setFinalFileName($final_name){
        $this->final_file_name = $final_name;
    }
    public function getFinalFileName(){
        return $this->final_file_name;
    }
    
    //methods
    public function uploadFile(){
        $con = new DBConnector;

        if($this->uploadOk){
            if(move_uploaded_file($this->file_temp_name, $this->final_file_name)){
                return true;
            }
        }
        return false;
    
    }
    public function fileAlreadyExists(){
        if(file_exists($final_file_name)){
            echo "Sorry, file already exists.";
            $uploadOk = false;
        }
    }
    public function saveFilePathTo(){

    }
    public function moveFile(){
        
    }
    public function fileTypeIsCorrect(){
        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
            echo "Sorry, your file is not in the corrected format.(only JPG, JPEG, PNG & GIF files are allowed)";
            $uploadOk = false;
        }
        $check = getimagesize($this->file_temp_name);
        if($check !== false){
            return true;
        }else{
            $uploadOk = false;
        }
    }
    public function fileSizeIsCorrect(){
        if($_FILES["fileToUpload"]["size"]> $size_limit){
            echo "Sorry, your file is too large...";
            $uploadOk = false;
        }
        return true;
    }
    public function fileWasSelected(){
        if(!is_null($file_original_name)){
            return true;
        }
        $uploadOk = false;
    }
}
?>