require 'active_record/fixtures'


class LoadDefaultData < ActiveRecord::Migration
  def self.up
    down
    models = self.default_models
    models.each do |m|   
      Fixtures.create_fixtures(self.default_directory, m)
    end    
  end

  def self.down
    models = self.default_models
    models.each do |m|
      eval("#{m.singularize.camelize}.delete_all")
    end
    
  end

  def self.default_directory
    File.join(File.dirname(__FILE__), "defaults" )
  end

  def self.default_models
    files, names = Dir.glob("#{self.default_directory}/*.yml"), []
    unless files.blank?
      files.each { |f| names << File.basename(f, '.yml') }
      names
    else
      []
    end
  end
  
  
end
