class AddSpecificationsToEquipments < ActiveRecord::Migration
  def change
    add_column :equipments, :specifications, :text
  end
end
