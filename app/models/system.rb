class System < ActiveRecord::Base
  belongs_to :location
  has_many :equipments

  validates :location_id, presence: true
end
