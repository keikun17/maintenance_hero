require 'spec_helper'

describe Equipment do

  let(:wood) { Category.find_or_create_by(name: 'Wood') }

  before do
    # setup properties, replace with factories later
    length = Property.create!(name: 'Length', symbol: 'length', data_type: 'float', category: wood)
    width = Property.create!(name: 'Width', symbol: 'width', data_type: 'integer',  category: wood)
    length_unit = Property.create!(name: 'Length Unit', symbol: 'length_unit', data_type: 'string', category: wood)
    width_unit = Property.create!(name: 'Width Unit', symbol: 'width_unit', data_type: 'string',  category: wood)
  end

  describe "#initialize_with_dynamic_properties" do
    let(:equipment_params) do
      {category_id: wood.id, actual_length: '42', actual_length_unit: 'meter'}
    end
    it "should initialize an object with the properties and data typest suited for its category" do
      equipment = Equipment.initialize_with_dynamic_properties(equipment_params)
      expect(equipment).to be_an_instance_of(Equipment)
      expect(equipment.actual_length).to eq(42.0)
      expect(equipment.actual_length).not_to eq('42.0')
      expect(equipment.actual_length_unit).to eq('meter')
    end
  end


  describe ".save" do

    it "saves the dynamic attributes" do
      equipment = described_class.new(category: wood)

      equipment.design_length = '42'
      equipment.design_length_unit = 'meter'
      equipment.actual_length = '24'
      equipment.actual_length_unit = 'meter'

      equipment.design_width = '69'
      equipment.design_width_unit = 'meter'
      equipment.actual_width = '96'
      equipment.actual_width_unit = 'meter'

      equipment.save

      expect(equipment.design_length).to eq(42.0)
      expect(equipment.design_length_unit).to eq('meter')
      expect(equipment.actual_length).to eq(24.0)
      expect(equipment.actual_length_unit).to eq('meter')

      expect(equipment.design_width).to eq(69)
      expect(equipment.design_width_unit).to eq('meter')
      expect(equipment.actual_width).to eq(96)
      expect(equipment.actual_width_unit).to eq('meter')
    end
  end

end

# == Schema Information
#
# Table name: equipment
#
#  id           :integer          not null, primary key
#  description  :text
#  design_specs :hstore
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
