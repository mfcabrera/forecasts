class ForecastController < ApplicationController
  
  layout 'standard'
  
  def view

    @max_h = 80 #maximum height for surf size table
    
    @date_format = "%a %d"
    @time_format = "%H"
    @f_offset = 4 #when are we going to start showing the forecasts?
    @max_per_row = 31 #how many per row
    
    
    float_regex =  /^-?[0-9]+\.?[0-9]*$/
    
    @lat = fix_number(params[:lat])
    @lon = fix_number(params[:lon])
    
        
    @fpoint = ForecastPoint.find_by_lat_and_lon(@lat,@lon)
        
    unless @fpoint
      render :nothing => true
      return
    end


    # unless ( @lat =~ float_regex and  @lon =~ float_regex )
    #   #TODO: Error pages when the parameters are malformed
    #   render :nothing => true            
    # else
    @all = Forecast.find_all_by_lat_and_lon(@lat,@lon)
    if @all.size == 0
      #TODO: put an empty message
      render :nothing => true        
    end

    #get forecast metadata
    @meta = GribMeta.find(:all)[0]

    
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
    @variables = Variable.find(:all,:order => "position")
    @max_per_row = @f_offset + @dates.size / 2                  
    
  end

  private
  def fix_number(num)
    num = num.to_f
    if (num-(num.to_i) ) > 0
      num
    else
      num.to_i
    end
  end



end
