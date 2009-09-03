module ForecastHelper
#   def human_name(var_name)
#     var = Variable.find_by_name(var_name)
#     name = var.nil? ? var_name  : var.human_name    
#   end
  def partial_for_var(var_name)
    "variables/simple_float.html.rb"
  end
  
end
