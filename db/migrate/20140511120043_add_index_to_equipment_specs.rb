class AddIndexToEquipmentSpecs < ActiveRecord::Migration
  def change
    add_index :equipment, [:listed_specs], name: :equipments_gin_listed_spec, using: :gin
    add_index :equipment, [:actual_specs], name: :equipments_gin_actual_spec, using: :gin
  end
end
