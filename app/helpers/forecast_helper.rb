module ForecastHelper
#   def human_name(var_name)
#     var = Variable.find_by_name(var_name)
#     name = var.nil? ? var_name  : var.human_name    
#   end
  def formater_funtion_for_var(varname)
    case varname
    when "WDIR","DIRPW" then
      lambda {|value| 
        value = value.to_f
        image_name = case value
                     when  0..15 then "00"
                     when  15..45  then "01"
                     when  45..75  then "02"    
                     when  75..105  then "03"    
                     when  105..135  then "04"    
                     when  135..165 then "05"
                     when  165..195 then "06"
                     when  195..225 then "07" 
                     when  225..255 then "08" 
                     when  255..285 then "09"
                     when  285..315 then "010"
                     when  315..345 then "011"
                     when  345..360 then "00"
                     end
        
        puts value
        image_tag("#{image_name}.png", :border=>0, :aling =>"center")

      }
    else
      lambda {|value|  "%.1f" % value }
    end
  end
  
end
