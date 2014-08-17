json.array!(@equipments_field) do |equipment_field|
  json.extract! equipment_field, :id, :name, :field_type, :equipment_type_id, :position
  json.url equipment_field_url(equipment_field, format: :json)
end
