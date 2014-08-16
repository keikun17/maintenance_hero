class Equipment < ActiveRecord::Base
  belongs_to :system
  validates :system_id, presence: true
end
