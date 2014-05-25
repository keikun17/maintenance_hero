json.array!(@products) do |product|
  json.extract! product, :id, :description, :design_specs, :actual_specs, :itemcode, :installed_at, :replaced_at, :failure_mode
  json.url product_url(product, format: :json)
end
