class CreateEquipments < ActiveRecord::Migration
  def change
    create_table :equipments do |t|
      t.string :name
      t.references :location, index: true

      t.timestamps
    end
  end
end
