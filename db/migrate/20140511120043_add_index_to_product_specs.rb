class AddIndexToProductSpecs < ActiveRecord::Migration
  def change
    add_index :products, [:design_specs], name: :products_gin_design_spec, using: :gin
    add_index :products, [:actual_specs], name: :products_gin_actual_spec, using: :gin
  end
end
