# Passing in :name here as a constraint. Read more about seed-fu constrains here
# https://github.com/mbleigh/seed-fu
Location.seed(:name) do |s|
  s.name = "Raw mill"
end

location_id = Location.find_by(name: "Raw mill").id

System.seed(:name, :location_id) do |s|
  s.name = "Conveyor"
end
