require 'spec_helper'

describe Property, :type => :model do

  let(:wood) { Category.find_or_create_by(name: 'Wood') }

  before do
    length = Property.create!(name: 'Length', symbol: 'length', data_type: 'float', category: wood)
    width = Property.create!(name: 'Width', symbol: 'width', data_type: 'integer',  category: wood)
    length_unit = Property.create!(name: 'Length Unit', symbol: 'length_unit', data_type: 'string', category: wood)
    width_unit = Property.create!(name: 'Width Unit', symbol: 'width_unit', data_type: 'string',  category: wood)
  end

  describe "#design_properties" do
    it "should list all the symbols of the design propertes" do
      expect(described_class.design_properties).to match_array([:design_length, :design_width, :design_length_unit, :design_width_unit])
    end
  end

  describe ".initialize_with_taggings" do
    let(:whitelisted_params) do
      {"category_id"=>"1",
       "name"=>"Resistance Type",
       "symbol"=>"resistance_type",
       "position"=>"",
       "data_type"=>"string",
       "select_options"=>"heat,abrasive"
      }
    end

    it "takes an attribute with comma separated select_options and turns it into array" do
      a = Property.initialize_with_taggings(whitelisted_params)
      expect(a.select_options).to match_array(['heat', 'abrasive'])
    end
  end

  describe ".save" do
    it "saves array data types" do
      shape = Property.create!(name: 'Shape',
                               symbol: 'shape',
                               data_type: 'string',
                               category: wood,
                               select_options: ['square', 'triangle','circle'])
      expect(shape.select_options).to match_array(['square', 'triangle', 'circle'])
    end
  end

  describe "#actual_properties" do
    it "should list all the symbols of the design propertes" do
      expect(described_class.actual_properties).to match_array([:actual_length, :actual_width, :actual_length_unit, :actual_width_unit])
    end
  end
end

# == Schema Information
#
# Table name: properties
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  symbol         :string(255)
#  position       :integer
#  data_type      :string(255)
#  select_options :string(255)      default([]), is an Array
#
