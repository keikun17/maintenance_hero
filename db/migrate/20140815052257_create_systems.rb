class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name
      t.references :location, index: true

      t.timestamps
    end
  end
end
