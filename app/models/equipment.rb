class Equipment < ActiveRecord::Base

  after_initialize :add_property_fields_to_specs
  after_save :add_property_fields_to_specs

  def add_property_fields_to_specs
    singleton_class.class_eval do
      listed_properties = Property.pluck(:symbol).collect{|x| 'listed_' + x}
      actual_properties = Property.pluck(:symbol).collect{|x| 'actual_' + x}

      hstore_accessor :listed_specs, Hash[listed_properties.collect{|prop| [prop, 'string']}]
      hstore_accessor :actual_specs, Hash[actual_properties.collect{|prop| [prop, 'string']}]
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
