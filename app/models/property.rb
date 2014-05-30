class Property < ActiveRecord::Base
  DATA_TYPES = %w( string integer float time array hash )

  belongs_to :category

  validates :category_id, presence: true
  validates :name, presence: true, uniqueness: {scope: :category}
  validates :symbol, presence: true, uniqueness: {scope: :category}
  validates :data_type, presence: true

  default_scope -> { order(position: :desc) }

  acts_as_list scope: :category

  def actual_key
    ('actual_' + symbol)
  end

  def design_key
    ('design_' + symbol)
  end

  def actual_sym
    actual_key.to_sym
  end

  def design_sym
    design_key.to_sym
  end

  def self.design_properties
    all.collect{|x| x.design_sym }
  end

  def self.actual_properties
    all.collect{|x| x.actual_sym}
  end

  def self.initialize_with_taggings(whitelisted_params)
    tags = whitelisted_params.delete('select_options') || ""
    whitelisted_params.merge!('select_options' => tags.split(','))

    Property.new(whitelisted_params)
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
