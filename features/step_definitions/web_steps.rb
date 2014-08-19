When(/^I fill in "(.*)" with "(.*)"$/) do |field_string, value|
  field = field_string.split(' ').join('_')
  fill_in field, with: value
end

When(/^I press "(.*)"$/) do |button|
  click_button button
end
