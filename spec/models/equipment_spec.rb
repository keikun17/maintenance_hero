require 'spec_helper'

describe Equipment do

  before do
    # setup properties, replace with factories later
    wood = Category.create(name: 'Wood')
    length = Property.create!(name: 'Length', symbol: 'length', category: wood)
    width = Property.create!(name: 'Width', symbol: 'width', category: wood)
  end

  describe "#new" do
    it "can be initialized with dynamic attributes" do
      equipment = Equipment.new(listed_length: '12', actual_length: '13')
      expect(equipment.listed_length).to eq('12')
      expect(equipment.actual_length).to eq('13')

    end

  end

  describe "#save" do
    it "saves the dynamic attributes" do
      equipment = described_class.new
      equipment.listed_length = '42'
      equipment.actual_length = '24'
      equipment.listed_width = '69'
      equipment.actual_width = '96'
      equipment.save

      expect(equipment.listed_length).to eq('42')
      expect(equipment.actual_length).to eq('24')
      expect(equipment.listed_width).to eq('69')
      expect(equipment.actual_width).to eq('96')
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
