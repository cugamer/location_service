class AddIndexToLocations < ActiveRecord::Migration
  def change
  	add_index :locations, :lattitude
  end
end