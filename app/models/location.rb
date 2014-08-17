class Location < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :systems, dependent: :destroy
  has_many :equipments, through: :systems, dependent: :destroy
end

# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
