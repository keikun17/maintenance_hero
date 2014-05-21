class AddDataTypeToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :data_type, :string
  end
end
