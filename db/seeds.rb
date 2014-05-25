# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

location = Location.find_or_create_by(name: 'Coal')

conveyor_belt = Category.find_or_create_by(name: 'Conveyor Belt')

properties = [
  { name: 'Ply Rating', symbol: 'ply_rating', category: conveyor_belt, data_type: 'integer'},
  { name: 'Plies', symbol: 'ply_count', category: conveyor_belt, data_type: 'integer'},
  { name: 'TC', symbol: 'tc', category: conveyor_belt, data_type: 'float'},
  { name: 'BC', symbol: 'bc', category: conveyor_belt, data_type: 'float'},
  { name: 'Width', symbol: 'width', category: conveyor_belt, data_type: 'float'},
  { name: 'Width Unit', symbol: 'length_unit', category: conveyor_belt, data_type: 'float'},
  { name: 'Length', symbol: 'length', category: conveyor_belt, data_type: 'float'},
  { name: 'Length Unit', symbol: 'length_unit', category: conveyor_belt, data_type: 'float'},
  { name: 'Cover Grade', symbol: 'cover_grade', category: conveyor_belt, data_type: 'string'},
]

properties.each do |property_attribute|
  puts Property.find_or_create_by(property_attribute)
end

unless Property.where(symbol: 'belt_type')
  Property.create({ name: 'Belt type',
                    symbol: 'belt_type',
                    category: conveyor_belt,
                    data_type: 'string',
                    select_options: ['Abrasive Resistant', 'Heat Resistant',
                                     'Flame Resistant', 'Oil Resistant']})
end
