json.array!(@equipment) do |equipment|
  json.extract! equipment, :id, :description, :listed_specs, :actual_specs, :itemcode, :installed_at, :replaced_at, :failure_mode
  json.url equipment_url(equipment, format: :json)
end
