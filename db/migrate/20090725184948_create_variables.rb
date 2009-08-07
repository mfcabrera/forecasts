class CreateVariables < ActiveRecord::Migration
  def self.up
    create_table :variables do |t|
      t.string :name
      t.string :human_name
      t.string :description
      t.float  :throttle
      t.timestamps
    end
  end

  def self.down
    drop_table :variables
  end
end
