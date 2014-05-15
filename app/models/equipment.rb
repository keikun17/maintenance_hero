class Equipment < ActiveRecord::Base
  store_accessor :listed_specs
  store_accessor :actual_specs

  after_initialize :add_property_fields_to_specs
  after_save :add_property_fields_to_specs

  def add_property_fields_to_specs
    singleton_class.class_eval do
      store_accessor :listed_specs, Property.pluck(:symbol)
      store_accessor :actual_specs, Property.pluck(:symbol)
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
