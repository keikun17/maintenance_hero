require 'rails_helper'

describe Product, :type => :model do

  let(:wood) { Equipment.find_or_create_by(name: 'Wood') }

  before do
    # setup properties, replace with factories later
    length = Property.create!(name: 'Length', symbol: 'length', data_type: 'float', equipment: wood)
    width = Property.create!(name: 'Width', symbol: 'width', data_type: 'integer',  equipment: wood)
    length_unit = Property.create!(name: 'Length Unit', symbol: 'length_unit', data_type: 'string', equipment: wood)
    width_unit = Property.create!(name: 'Width Unit', symbol: 'width_unit', data_type: 'string',  equipment: wood)
  end

  describe "#initialize_with_dynamic_properties" do
    let(:product_params) do
      {equipment_id: wood.id, actual_length: '42', actual_length_unit: 'meter'}
    end
    it "should initialize an object with the properties and data typest suited for its equipment" do
      product = Product.initialize_with_dynamic_properties(product_params)
      expect(product).to be_an_instance_of(Product)
      expect(product.actual_length).to eq(42.0)
      expect(product.actual_length).not_to eq('42.0')
      expect(product.actual_length_unit).to eq('meter')
    end
  end


  describe ".save" do

    it "saves the dynamic attributes" do
      product = described_class.new(equipment: wood)

      product.design_length = '42'
      product.design_length_unit = 'meter'
      product.actual_length = '24'
      product.actual_length_unit = 'meter'

      product.design_width = '69'
      product.design_width_unit = 'meter'
      product.actual_width = '96'
      product.actual_width_unit = 'meter'

      product.save

      expect(product.design_length).to eq(42.0)
      expect(product.design_length_unit).to eq('meter')
      expect(product.actual_length).to eq(24.0)
      expect(product.actual_length_unit).to eq('meter')

      expect(product.design_width).to eq(69)
      expect(product.design_width_unit).to eq('meter')
      expect(product.actual_width).to eq(96)
      expect(product.actual_width_unit).to eq('meter')
    end
  end

end

# == Schema Information
#
# Table name: products
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
#  equipment_id  :integer
#
