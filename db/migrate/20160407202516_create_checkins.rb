class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :user_id
      t.string :lattitude
      t.string :longitude

      t.timestamps
    end
  end
end