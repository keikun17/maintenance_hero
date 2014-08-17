class Specification < ActiveRecord::Base
  belongs_to :equipment
end

# == Schema Information
#
# Table name: specifications
#
#  id           :integer          not null, primary key
#  equipment_id :integer
#  name         :string(255)
#  datatype     :string(255)
#  position     :integer
#  created_at   :datetime
#  updated_at   :datetime
#
