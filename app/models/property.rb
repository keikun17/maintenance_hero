class Property < ActiveRecord::Base
  belongs_to :user
end

# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
