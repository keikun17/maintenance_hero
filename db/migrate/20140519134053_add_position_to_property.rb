class AddPositionToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :position, :integer
  end
end
