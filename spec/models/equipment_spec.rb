require 'spec_helper'

describe Equipment do

  before do
    # setup properties, replace with factories later
    length = Property.create!(name: 'Length', symbol: 'length', data_type: 'float', category: wood)
    width = Property.create!(name: 'Width', symbol: 'width', data_type: 'float',  category: wood)
    length_unit = Property.create!(name: 'Length Unit', symbol: 'length_unit', data_type: 'string', category: wood)
    width_unit = Property.create!(name: 'Width Unit', symbol: 'width_unit', data_type: 'string',  category: wood)
  end

  describe "#initialize_with_dynamic_properties" do
    it "should initialize an object with the properties suited for its category" do
    end
  end

  describe "#listed_properties" do
    it "should list all the symbols of the listed propertes" do
      pending
    end
  end

  describe "#actual_properties" do
    it "should list all the symbols of the listed propertes" do
      pending
    end
  end

  describe ".save" do
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
