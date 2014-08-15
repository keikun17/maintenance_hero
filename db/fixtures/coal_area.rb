# Passing in :name here as a constraint. Read more about seed-fu constrains here
# https://github.com/mbleigh/seed-fu
Location.seed(:name) do |s|
  s.name = "Raw mill L2A-BC1"
end

location_id = Location.find_by(name: "Raw mill L2A-BC1").id

System.seed(:name, :location_id) do |s|
  s.name = "Conveying System"
end
