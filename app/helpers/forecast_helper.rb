module ForecastHelper
#   def human_name(var_name)
#     var = Variable.find_by_name(var_name)
#     name = var.nil? ? var_name  : var.human_name    
#   end


  def formater_funtion_for_var(varname)
    case varname
    when "WDIR","DIRPW" then
      lambda {|var| 
        formater_for_direction(var)        
      }
    when "SURFZ" then
      lambda { |var|  
        formater_for_surf_size2(var)
      }
    else
      lambda {|var|  "%.1f" % var.value }
    end
  end


  def formater_for_surf_size2(var)
    ""
  end
    

  def formater_for_surf_size(var)
    value = var.value.to_f
    delta = value*@fpoint.throttle
    
    return ("%.1f" % value)  if delta == 0.0
    
    fl = (value - delta)*3.2808399
    cl = (value + delta)*3.2808399
    
    #str = ("%.1f" % (fl*3.2808399)  )+ "&nbsp;-&nbsp;" +("%.1f" % (cl*3.2808399))
    #"<span style=\"font-size:10px;\">"+str+"</span>"
   # ""
    ["%.1f" % fl,"%.1f" % cl]
  end


  def formater_for_swell_class(var)
    


    
  end
  

    
  def formater_for_direction(var)
    value = var.value.to_f
    angle_code = case value
                 when  0..11.25   then "N" 
                 when  11.25..33.75  then "NNE"
                 when  33.75..56.25  then "NE"  
                 when  56.25..78.5  then "ENE"    
                 when  78.5..101   then "E"
                 when  101..123.5  then "ESE"    
                 when  123.5..146 then "SE"
                 when  146..168.5 then "SSE"
                 when  168.5..191 then "S"
                 when  191..213.5 then "SSW"
                 when  213.5..236 then "SW"
                 when  236..258.5 then "WSW" 
                 when  258.5..281 then "W" 
                 when  281..303.5 then "WNW"
                 when  303.5..326 then "NW"
                 when  326..348.75 then "NNW"
                 when  348.75..360 then "N"
                 end
    
    "<span style=\"font-size:9px;\">" +  angle_code +
      "</span>" + "<br/>" + image_tag("#{angle_code}.png", :border=>0, :aling =>"center")  
      
    
    
  end
    
  def inject_br(str)
    str.split.join("<br/>")
  end
  
end
