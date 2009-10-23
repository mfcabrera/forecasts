
function getLocalTime (utc_time) {

    var mydate=new Date();
    var offset = mydate.getTimezoneOffset() / 60;
    var day = 0;
    var hour = 0;
    offset = offset * -1;
      
        
// logic used 
// if(offset > 0)
// if offset > 0 that means a negative offset
// so if hours - offset  < 0
// the guy is in the previous day so we put a +1d 
// if otherwise, the offset < 0
// the guys is located hours before the forecast so we adjust it. if 
// hours + offset is > 24 the guys is located at the next day, so we put a -1d
// in other cases we put just the hours + offset

    var hours = utc_time;
    
    if(hours + offset <= 0) {
        day = "-1";
        hours = 24 + hours + offset;
    }
    else  if(hours + offset > 24){
        hours = hours - 24;
        day = "+1";
    }
    else {
        hours = hours + offset + 0

    }
    if (hours < 10) {
        hours = "0"+hours;
    }
        
    
    
    if(day == 0) {
        document.write(hours+"h");
    } else {
        document.write(hours+"h ("+ day +"d)");        
    }

    

}
