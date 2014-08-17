class CreateEquipmentsType < ActiveRecord::Migration
  def change
    create_table :equipments_type do |t|
      t.string :name

      t.timestamps
    end
  end
end
