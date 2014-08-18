class EquipmentType < ActiveRecord::Base
  has_many :equipments, dependent: :destroy
  has_many :fields, class_name: "EquipmentField", dependent: :destroy

  accepts_nested_attributes_for :fields, allow_destroy: true

end
