json.array!(@equipments) do |equipment|
  json.extract! equipment, :id, :name, :location_id
  json.url equipment_url(equipment, format: :json)
end
