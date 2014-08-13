# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

location = Location.find_or_create_by(name: 'Coal')

conveyor_belt = Equipment.find_or_create_by(name: 'Conveyor Belt')

properties = [
  { name: 'Ply Rating', symbol: 'ply_rating', equipment: conveyor_belt, data_type: 'integer'},
  { name: 'Plies', symbol: 'ply_count', equipment: conveyor_belt, data_type: 'integer'},
  { name: 'TC', symbol: 'tc', equipment: conveyor_belt, data_type: 'float'},
  { name: 'BC', symbol: 'bc', equipment: conveyor_belt, data_type: 'float'},
  { name: 'Width', symbol: 'width', equipment: conveyor_belt, data_type: 'float'},
  { name: 'Width Unit', symbol: 'length_unit', equipment: conveyor_belt, data_type: 'float'},
  { name: 'Length', symbol: 'length', equipment: conveyor_belt, data_type: 'float'},
  { name: 'Length Unit', symbol: 'length_unit', equipment: conveyor_belt, data_type: 'float'},
  { name: 'Cover Grade', symbol: 'cover_grade', equipment: conveyor_belt, data_type: 'string'},
]

properties.each do |property_attribute|
  puts Property.find_or_create_by(property_attribute)
end

unless Property.where(symbol: 'belt_type')
  Property.create({ name: 'Belt type',
                    symbol: 'belt_type',
                    equipment: conveyor_belt,
                    data_type: 'string',
                    select_options: ['Abrasive Resistant', 'Heat Resistant',
                                     'Flame Resistant', 'Oil Resistant']})
end
