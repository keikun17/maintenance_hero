class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.references :equipment, index: true
      t.string :name
      t.string :datatype
      t.integer :position

      t.timestamps
    end
  end
end
