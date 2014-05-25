class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :description
      t.hstore :design_specs
      t.hstore :actual_specs
      t.string :itemcode
      t.date :installed_at
      t.date :replaced_at
      t.date :failure_mode

      t.timestamps
    end
    add_index :products, :itemcode
  end
end
