class CreateEquipmentsField < ActiveRecord::Migration
  def change
    create_table :equipments_field do |t|
      t.string :name
      t.string :field_type
      t.belongs_to :equipment_type, index: true
      t.integer :position

      t.timestamps
    end
  end
end
