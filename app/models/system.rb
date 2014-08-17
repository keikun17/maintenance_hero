class System < ActiveRecord::Base
  belongs_to :location
  has_many :equipments

  validates :location_id, presence: true
end

# == Schema Information
#
# Table name: systems
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  location_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
