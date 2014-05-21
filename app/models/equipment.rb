class Equipment < ActiveRecord::Base
  belongs_to :category
  has_many :properties, through: :category

  validates :category_id, presence: true

  after_initialize :add_property_fields_to_specs
  before_save :add_property_fields_to_specs
  before_create :add_property_fields_to_specs

  def self.initialize_with_dynamic_properties(equipment_params)
    equipment = self.new(category_id: equipment_params["category_id"])
    equipment.attributes = equipment_params
    equipment
  end

  def add_property_fields_to_specs
    singleton_class.class_eval do
      hstore_accessor :listed_specs, Hash[Property.listed_properties.collect{|prop| [prop, 'string']}]
      hstore_accessor :actual_specs, Hash[Property.actual_properties.collect{|prop| [prop, 'string']}]
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
