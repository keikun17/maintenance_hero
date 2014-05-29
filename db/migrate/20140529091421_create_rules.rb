class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.references :failure_mode, index: true
      t.string :name
      t.references :property, index: true
      t.string :operation
      t.string :operand

      t.timestamps
    end
  end
end
