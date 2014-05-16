require 'spec_helper'

describe Equipment do

  before do
    # setup properties, replace with factories later
    wood = Category.create(name: 'Wood')
    length = Property.create!(name: 'Length', symbol: 'length', category: wood)
    width = Property.create!(name: 'Width', symbol: 'width', category: wood)
  end

  describe "#save" do
    it "saves" do
      equipment = described_class.new
      equipment.save.should_not be_false
    end

  end

end

# == Schema Information
#
# Table name: equipment
#
#  id           :integer          not null, primary key
#  description  :text
#  listed_specs :hstore
#  actual_specs :hstore
#  itemcode     :string(255)
#  installed_at :date
#  replaced_at  :date
#  failure_mode :date
#  created_at   :datetime
#  updated_at   :datetime
#  location_id  :integer
#  category_id  :integer
#
