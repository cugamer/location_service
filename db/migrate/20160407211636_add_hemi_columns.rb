class AddHemiColumns < ActiveRecord::Migration
  def change
  	add_column :checkins, :hemi_n_s, :string
  	add_column :checkins, :hemi_e_w, :string
  end
end