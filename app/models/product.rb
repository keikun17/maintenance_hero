# A Product has multiple properties. These properties are then are subivided
# into two :
#
# 1. 'Design properties' or the design specifications
# 2. 'Actual properties' or the specifications of the product that is/was
#    actually used.
#
# The list of these properties are accessed as 'design_specs' and
# 'actual_specs' respectively.
#
#
class Product < ActiveRecord::Base

  has_many :properties, through: :equipment
  belongs_to :equipment

  validates :equipment_id, presence: true

  after_initialize :add_property_fields_to_specs, unless: "equipment.nil?"
  before_save :add_property_fields_to_specs
  before_create :add_property_fields_to_specs

  def self.initialize_with_dynamic_properties(product_params)
    product_params.with_indifferent_access

    product = self.new(equipment_id: product_params[:equipment_id])
    product.attributes = product_params
    product
  end

  def add_property_fields_to_specs
    _equipment_properties = self.equipment.properties
    # singleton_class.class_eval do
    self.class.class_eval do
      _equipment_properties.each do |property|
        hstore_accessor :design_specs, Hash[property.design_sym, property.data_type]
        hstore_accessor :actual_specs, Hash[property.actual_sym, property.data_type]
      end
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
