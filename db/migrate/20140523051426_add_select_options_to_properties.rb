class AddSelectOptionsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :select_options, :string, array: true, default: '{}'
    add_index :properties, :select_options, using: 'gin'
  end
end
