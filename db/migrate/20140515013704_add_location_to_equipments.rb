class AddLocationToEquipments < ActiveRecord::Migration
  def change
    add_column :equipment, :location_id, :integer
    add_index :equipment, :location_id
  end
end
