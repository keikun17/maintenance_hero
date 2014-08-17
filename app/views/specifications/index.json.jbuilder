json.array!(@specifications) do |specification|
  json.extract! specification, :id, :equipment_id, :name, :datatype, :position
  json.url specification_url(specification, format: :json)
end
