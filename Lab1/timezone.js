$(document).ready(function(){
    //returns number of minutes ahead or behind greenwich meridian
    var offset = new Date().getTimezoneOffset();
    //returns the number of mssince 1970/01/01
    var utc_timestamp = timestamp + (60000 * offset);

    $('$time_zone_offset').val(offset);//assigning the offset var a value
    $('$utc_timestamp').val(utc_timestamp);//assigning the utc_timestamp var a value
});