class Equipment < ActiveRecord::Base
  belongs_to :system
  belongs_to :equipment_type

  validates :system_id, presence: true
  validates :equipment_type_id, presence: true

  serialize :specifications, Hash
end

# == Schema Information
#
# Table name: equipments
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  system_id         :integer
#  created_at        :datetime
#  updated_at        :datetime
#  equipment_type_id :integer
#
