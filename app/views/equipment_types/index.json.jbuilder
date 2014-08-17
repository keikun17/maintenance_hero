json.array!(@equipments_type) do |equipment_type|
  json.extract! equipment_type, :id, :name
  json.url equipment_type_url(equipment_type, format: :json)
end
