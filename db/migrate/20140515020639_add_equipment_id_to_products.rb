class AddEquipmentIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :equipment_id, :integer
    add_index :products, :equipment_id
  end
end
