class FailureMode < ActiveRecord::Base
  belongs_to :equipment
end

# == Schema Information
#
# Table name: failure_modes
#
#  id          :integer          not null, primary key
#  equipment_id :integer
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
