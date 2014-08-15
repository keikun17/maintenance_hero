json.array!(@equipments) do |equipment|
  json.extract! equipment, :id, :name, :system_id
  json.url equipment_url(equipment, format: :json)
end
