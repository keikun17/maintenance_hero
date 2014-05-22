class Property < ActiveRecord::Base
  DATA_TYPES = %w( string integer float time array hash )

  belongs_to :category

  validates :category_id, presence: true
  validates :name, presence: true, uniqueness: {scope: :category}
  validates :symbol, presence: true, uniqueness: {scope: :category}
  validates :data_type, presence: true

  default_scope -> { order(position: :desc) }

  acts_as_list scope: :category

  def actual_sym
    ('actual_' + symbol).to_sym
  end

  def listed_sym
    ('listed_' + symbol).to_sym
  end

  def self.listed_properties
    all.collect{|x| x.listed_sym }
  end

  def self.actual_properties
    all.collect{|x| x.actual_sym}
  end
end

# == Schema Information
#
# Table name: properties
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  symbol      :string(255)
#  position    :integer
#  data_type   :string(255)
#
