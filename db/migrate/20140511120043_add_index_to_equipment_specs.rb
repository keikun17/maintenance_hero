class AddIndexToEquipmentSpecs < ActiveRecord::Migration
  def change
    add_index :equipments, [:listed_specs], name: :equipments_gin_listed_specs, using: :gin
    add_index :equipments, [:actual_specs], name: :equipments_gin_actual_specs, using: :gin
  end
end
