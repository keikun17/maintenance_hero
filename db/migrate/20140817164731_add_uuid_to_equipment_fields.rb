class AddUuidToEquipmentFields < ActiveRecord::Migration
  def change
    add_column :equipment_fields, :uuid, :string
    add_index :equipment_fields, :uuid
  end
end
