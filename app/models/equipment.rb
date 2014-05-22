class Equipment < ActiveRecord::Base
  has_many :properties, through: :categories
  belongs_to :category

  validates :category_id, presence: true

  after_initialize :add_property_fields_to_specs, unless: "category.nil?"
  before_save :add_property_fields_to_specs
  before_create :add_property_fields_to_specs

  def self.initialize_with_dynamic_properties(equipment_params)
    equipment = self.new(category_id: equipment_params["category_id"])
    equipment.attributes = equipment_params
    equipment
  end

  def add_property_fields_to_specs
    _category_properties = self.category.properties
    # singleton_class.class_eval do
    self.class.class_eval do
      _category_properties.each do |property|
        hstore_accessor :listed_specs, Hash[property.listed_sym, property.data_type]
        hstore_accessor :listed_specs, Hash[property.actual_sym, property.data_type]
      end
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
