Given(/^a "(.*?)" location exists$/) do |location_name|
  Location.create!(name: location_name)
end
