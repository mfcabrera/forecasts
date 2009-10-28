class ForecastPoint < ActiveRecord::Base
  set_table_name "forecast_points"
  validates_numericality_of :upper_throttle, :lower_throttle, :lat, :lon
  validates_presence_of :name
  validates_uniqueness_of :lat, :scope => :lon, :message => "Already have a
  point with that Lon value"
  validates_uniqueness_of :lon, :scope => :lat, :message => "Already have a
  point with that Lat Value"

  
end
