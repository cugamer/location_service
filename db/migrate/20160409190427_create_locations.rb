class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :lattitude
      t.string :longitude
      t.string :hemi_n_s
      t.string :hemi_e_w
      t.string :location_title

      t.timestamps
    end
  end
end