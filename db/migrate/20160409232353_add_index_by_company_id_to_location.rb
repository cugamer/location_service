class AddIndexByCompanyIdToLocation < ActiveRecord::Migration
  def change
  	add_index :locations, :company_id
  end
end