json.array!(@properties) do |property|
  json.extract! property, :id, :equipment_id, :name
  json.url property_url(property, format: :json)
end
