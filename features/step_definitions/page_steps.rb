When(/^I go to the "(.*?)" page$/) do |location_string|
  location = parse_location_string(location_string)
  visit(eval(location))
end

Then(/^(?:|I) should be on the "(.*)" page$/) do |location_string|
  location = parse_location_string(location_string)
  expect(current_path).to eq(location)
end

def parse_location_string(location_string)
  location = location_string.split(' ').join('_') + '_path'
end
