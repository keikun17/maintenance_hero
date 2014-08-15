class Location < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :systems, dependent: :destroy
  has_many :equipments, through: :systems, dependent: :destroy
end
