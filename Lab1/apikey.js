$(document).ready(function(){
    $('#api-key-btn').click(function(event){
        //confirm that they want to generate the key
        var confirm_key = confirm("You are about to generate a new API key");
        if(!confirm_key){
            return;
        }
        $.ajax({
            url:"ApiKey.php",
            type: "post",
            success: function(data){
                if(dta['success'] == 1){
                    //if everything went fine, set the key in the text area
                    $('#api_key').val(data['message']);
                }else{
                    alert("Something went wrond. Please try again");
                }
            }
        });
    });
});