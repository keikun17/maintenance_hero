class Equipment < ActiveRecord::Base
  belongs_to :system
  validates :system_id, presence: true
end

# == Schema Information
#
# Table name: equipments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  system_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
