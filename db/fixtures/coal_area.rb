Location.seed(:name) do |s|
  s.name = "Raw mill L2A-BC1"
end

location_id = Location.find_by(name: "Raw mill L2A-BC1").id

# Systems

System.seed(:name, :location_id) do |s|
  s.name = "Conveying System"
  s.location_id = location_id
end

system_id = System.find_by(name: 'Conveying System').id

# Equipments

Equipment.seed(:name, :system_id) do |s|
  s.name = 'Conveyor Belt'
  s.system_id = system_id
end

Equipment.seed(:name, :system_id) do |s|
  s.name = 'Belt Cleaner'
  s.system_id = system_id
end

Equipment.seed(:name, :system_id) do |s|
  s.name = 'Head Pulley'
  s.system_id = system_id
end

Equipment.seed(:name, :system_id) do |s|
  s.name = 'Idler Rollers'
  s.system_id = system_id
end

