class AddEquipmentTypeIdToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :equipment_type_id, :integer
    add_index :equipments, :equipment_type_id
  end
end
