class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :category, index: true
      t.string :name

      t.timestamps
    end
  end
end
