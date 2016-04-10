class ChangeDbValueTypes < ActiveRecord::Migration
  def change
  	remove_column :checkins, :lattitude
  	add_column :checkins, :lattitude, :string
  	remove_column :checkins, :longitude
  	add_column :checkins, :longitude, :string
  	remove_column :locations, :company_id
  	add_column :locations, :company_id, :integer
  end
end