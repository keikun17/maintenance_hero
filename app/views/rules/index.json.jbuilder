json.array!(@rules) do |rule|
  json.extract! rule, :id, :failure_mode_id, :name, :property_id, :operation, :operand
  json.url rule_url(rule, format: :json)
end
