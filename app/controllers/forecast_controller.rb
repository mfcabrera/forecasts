class ForecastController < ApplicationController
  
  layout 'standard'
  def view
    
    float_regex =  /^-?[0-9]+\.?[0-9]*$/
    
    @lat = params[:lat]
    @lon = params[:lon]
    
    unless ( @lat =~ float_regex and  @lon =~ float_regex )
      #TODO: Error pages when the parameters are malformed
      render :nothing => true            
    else
      @all = Forecast.find_all_by_lat_and_lon(@lat,@lon)
      if @all.size == 0
        #TODO: put an empty message
        render :nothing => true
      end
    end

    
    @dates = Forecast.find_by_sql("select distinct forecast_date from  forecasts")
    @dates_by_day =  {}
    @dates.sort! {|a,b| 
          
      # puts "#{a.forecast_date} - #{b.forecast_date}"
      a.forecast_date <=> b.forecast_date       
      }
    
    @dates.each { |date|
      formated_date = date.forecast_date.strftime("%Y-%m-%d")
      
      if @dates_by_day[formated_date].nil?
        @dates_by_day[formated_date] = Array.new
      end
      @dates_by_day[formated_date] << date.forecast_date.strftime("%Hh") 
    }
    @keys = @dates_by_day.keys.sort
    @variables = Variable.find(:all)
    
  end

end
