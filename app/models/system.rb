class System < ActiveRecord::Base
  belongs_to :location
  has_many :equipments
end
