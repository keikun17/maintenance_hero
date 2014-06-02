class Rule < ActiveRecord::Base
  belongs_to :failure_mode
  belongs_to :property
end

# == Schema Information
#
# Table name: rules
#
#  id              :integer          not null, primary key
#  failure_mode_id :integer
#  name            :string(255)
#  property_id     :integer
#  operation       :string(255)
#  operand         :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#
