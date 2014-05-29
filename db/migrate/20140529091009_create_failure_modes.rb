class CreateFailureModes < ActiveRecord::Migration
  def change
    create_table :failure_modes do |t|
      t.references :category, index: true
      t.string :name

      t.timestamps
    end
  end
end
