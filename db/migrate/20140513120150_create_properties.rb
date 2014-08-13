class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :equipment, index: true
      t.string :name

      t.timestamps
    end
  end
end
