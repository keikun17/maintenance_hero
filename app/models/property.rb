class Property < ActiveRecord::Base
  belongs_to :category

  validates :category_id, presence: true
  validates :name, presence: true, uniqueness: {scope: :category}
  validates :symbol, presence: true, uniqueness: {scope: :category}
end

# == Schema Information
#
# Table name: properties
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
