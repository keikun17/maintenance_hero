location_names = %w(L2A-BC1 Crusher Coal)

location_names.each do |location_name|
  Location.find_or_create_by(name: location_name)
end
