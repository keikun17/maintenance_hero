class AddSymbolToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :symbol, :string
  end
end
