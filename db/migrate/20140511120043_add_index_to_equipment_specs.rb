class AddIndexToEquipmentSpecs < ActiveRecord::Migration
  def change
    add_index :equipment, [:design_specs], name: :equipments_gin_design_spec, using: :gin
    add_index :equipment, [:actual_specs], name: :equipments_gin_actual_spec, using: :gin
  end
end
