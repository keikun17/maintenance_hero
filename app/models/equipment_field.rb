class EquipmentField < ActiveRecord::Base
  belongs_to :equipment_type
end

# == Schema Information
#
# Table name: equipment_fields
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  field_type        :string(255)
#  equipment_type_id :integer
#  position          :integer
#  created_at        :datetime
#  updated_at        :datetime
#  uuid              :string(255)
#
