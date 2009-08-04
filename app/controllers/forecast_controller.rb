class ForecastController < ApplicationController
  

  def view
    @dates = Forecast.find_by_sql("select distinct forecast_date from  forecasts")
    @dates_by_day =  {}
    @dates.sort! {|a,b| 
          
      # puts "#{a.forecast_date} - #{b.forecast_date}"
      a.forecast_date <=> b.forecast_date 
     
      
      
      }
    
    @dates.each { |date|
      formated_date = date.forecast_date.strftime("%Y-%m-%d %Hh")
      puts formated_date
      if @dates_by_day[formated_date].nil?
        @dates_by_day[formated_date] = Array.new
      end
      @dates_by_day[formated_date] << date.forecast_date.strftime("%Hh") 
    }
    @keys = @dates_by_day.keys.sort
    @all = Forecast.find(:all)
    @variables = Variable.find(:all)
  end

end
