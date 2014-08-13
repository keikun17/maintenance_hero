class Equipment < ActiveRecord::Base
  validates :name, presence: true

  has_many :products
  has_many :properties, -> { order("position asc") }
end

# == Schema Information
#
# Table name: equipments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
