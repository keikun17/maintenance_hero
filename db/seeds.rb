# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

location = Location.find_or_create_by(name: 'Coal')
conveyor_belt = Category.find_or_create_by(name: 'Conveyor Belt')

properties = ['Ply Rating', "Plies", "TC", "BC", "Width", "Length"]
properties.each do |property_name|
  Property.find_or_create_by(name: property_name, category: conveyor_belt)

end
