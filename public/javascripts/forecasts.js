
function getUserTime (local_time,local_utc) {

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
    var hours = local_time;



  //      alert(local_utc)
        
        if(hours + offset  <= 0) {
            hours = 24 + hours + offset;
            day = "-1";
        }
        else  if(hours + offset  > 24){
            hours = hours + offset  - 24;
            day = "+1";
        }
        else {
            hours = hours + offset             
        }
       
        

    
    if (hours < 10) {
        hours = "0"+hours;
     }

    document.write(hours+"h");
    
    //    document.write(hours+"h ("+ day +"d)");        
    //}
}

/**
* write the correct date for a utc location 
* taking into account month changes.
* For example, for 2009
* getLocalDay(10,1,2,-5) = Wed 30
* getLocalDay(11,30,23,5) = Tue 01
*  
*/

    function getLocalDay(utc_month,utc_day,utc_time) {
      
        var weekdays=new Array(7);
        weekdays[0]="Sun";
        weekdays[1]="Mon";
        weekdays[2]="Tue";
        weekdays[3]="Wed";
        weekdays[4]="Thu";
        weekdays[5]="Fri";
        weekdays[6]="Sat";

        var myDate = new Date();
        var tmpDate = new Date();
        
        var local_utc_offset = -1 *  myDate.getTimezoneOffset() / 60;
        
        var criteria = utc_time + local_utc_offset
        
        tmpDate.setMonth(utc_month-1);       
        tmpDate.setDate(utc_day);               
        var current_week_day = tmpDate.getDay();
        
        var year = myDate.getFullYear();

        var current_day = utc_day;
        var current_month_days = daysInMonth(utc_month,year);

        //repl.print(current_week_day);
      
      if(criteria <= 0) { // previous day 
          current_week_day = current_week_day - 1;
          if(current_week_day < 0){
              current_week_day = 6;
          }                       
          //we should also check if we are movin to the previous month
          
          if((utc_day - 1) <= 0){ // fuck we are... so
              current_day = daysInMonth(utc_month-1,year);
              
              
          } 
          else  { //we are in the same month so
              current_day = utc_day - 1;              
          }
      }
      
      if(criteria > 23) { // following day       
          current_week_day = current_week_day + 1;
          if(current_week_day > 6){
              current_week_day = 0;
          }                       
          //we should also check if we are movin to the following month

          if((utc_day + 1) > current_month_days  ){ // fuck we are... so
              current_day = 1;  
          } 
          else { // we are in the same month so..
              current_day = utc_day + 1;
          }
          
      }      
      
      if(current_day < 10) {
          current_day = "0"+current_day;
      }
      
       
      document.write(weekdays[current_week_day] + "<br/>" + current_day)

//      repl.print(weekdays[current_week_day]);
//      repl.print(current_day);

  }


function daysInMonth(iMonth, iYear)
{
	return 32 - new Date(iYear, iMonth-1, 32).getDate();
}


function getLocalTimeOffset (local_time) {

    var mydate=new Date();
    var offset = mydate.getTimezoneOffset() / 60;
    var day = 0;
    var hour = 0;
    offset = offset * -1;
    var hours = local_time*1;
    
    if(hours + offset  < 0) {
        hours = 24 + hours + offset;
        day="+1";
    }
    else  if(hours + offset  >= 24){
        day = "-1";
    }
            

    if(day != 0)    
        //repl.print(day)
        document.write("<span class=\"offset\"> ("+ day +")</span>");        
    
}
