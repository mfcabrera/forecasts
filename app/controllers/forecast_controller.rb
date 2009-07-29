class ForecastController < ApplicationController
  

  def view
    @dates = Forecast.find_by_sql("select distinct forecast_date from forecasts")
    @all = Forecast.find(:all)
    @variables = Variable.find(:all)
  end

end
