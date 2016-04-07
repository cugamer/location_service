class ChangeCheckinsTableTypes < ActiveRecord::Migration
  def change
  	remove_column :checkins, :user_id, :string
  	remove_column :checkins, :lattitude, :string
  	remove_column :checkins, :longitude, :string
  	add_column :checkins, :user_id, :integer
  	add_column :checkins, :lattitude, :decimal
  	add_column :checkins, :longitude, :decimal
  end
end