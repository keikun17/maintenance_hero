class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :equipment
  has_many :properties
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
