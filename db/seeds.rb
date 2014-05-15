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
  { name: 'Ply Rating', symbol: 'ply_rating', category: conveyor_belt},
  { name: 'Plies', symbol: 'ply_count', category: conveyor_belt},
  { name: 'TC', symbol: 'tc', category: conveyor_belt},
  { name: 'BC', symbol: 'bc', category: conveyor_belt},
  { name: 'Width', symbol: 'width', category: conveyor_belt},
  { name: 'Length', symbol: 'length', category: conveyor_belt},
  { name: 'Length Unit', symbol: 'length_unit', category: conveyor_belt}
]

properties.each do |property_attribute|
  puts "1"
  puts Property.find_or_create_by(property_attribute)
end
