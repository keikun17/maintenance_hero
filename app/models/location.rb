class Location < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :equipments, dependent: :destroy
end
