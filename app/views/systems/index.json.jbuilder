json.array!(@systems) do |system|
  json.extract! system, :id, :name, :location_id
  json.url system_url(system, format: :json)
end
