class EquipmentType < ActiveRecord::Base
  has_many :equipments, dependent: :destroy
  has_many :equipment_fields, dependent: :destroy
end
