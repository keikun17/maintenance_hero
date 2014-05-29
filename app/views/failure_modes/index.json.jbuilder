json.array!(@failure_modes) do |failure_mode|
  json.extract! failure_mode, :id, :category_id, :name
  json.url failure_mode_url(failure_mode, format: :json)
end
