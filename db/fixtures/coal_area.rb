Location.seed(:name) do |s|
  s.name = "Raw mill L2A-BC1"
end

location_id = Location.find_by(name: "Raw mill L2A-BC1").id

# Systems

System.seed(:name, :location_id) do |s|
  s.name = "Conveying System"
end

system_id = System.find_by(name: 'Conveying System')

# Equipments

Equipment.seed(:name, :system_id) do |s|
  s.name = 'Conveyor Belt'
end

Equipment.seed(:name, :system_id) do |s|
  s.name = 'Belt Cleaner'
end

Equipment.seed(:name, :system_id) do |s|
  s.name = 'Head Pulley'
end

Equipment.seed(:name, :system_id) do |s|
  s.name = 'Idler Rollers'
end

