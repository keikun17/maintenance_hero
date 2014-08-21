When(/^I fill in "(.*)" with "(.*)"$/) do |field_string, value|
  field = field_string.split(' ').join('_')
  fill_in field, with: value
end

When(/^I press "(.*)"$/) do |button|
  click_button button
end

When(/^I click "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I select "(.*?)" from "(.*?)"$/) do |value, field_string|
  field = field_string.split(' ').join('_')
  select(value, from: field)
end

def field_from_string(field_string)
  field_string.split(' ').join('_')
end
