require 'spec_helper'

describe Property do

  let(:wood) { Category.find_or_create_by(name: 'Wood') }

  before do
    length = Property.create!(name: 'Length', symbol: 'length', data_type: 'float', category: wood)
    width = Property.create!(name: 'Width', symbol: 'width', data_type: 'integer',  category: wood)
    length_unit = Property.create!(name: 'Length Unit', symbol: 'length_unit', data_type: 'string', category: wood)
    width_unit = Property.create!(name: 'Width Unit', symbol: 'width_unit', data_type: 'string',  category: wood)
  end

  describe "#listed_properties" do
    it "should list all the symbols of the listed propertes" do
      expect(described_class.listed_properties).to match_array([:listed_length, :listed_width, :listed_length_unit, :listed_width_unit])
    end
  end

  describe "#actual_properties" do
    it "should list all the symbols of the listed propertes" do
      expect(described_class.actual_properties).to match_array([:actual_length, :actual_width, :actual_length_unit, :actual_width_unit])
    end
  end
end
