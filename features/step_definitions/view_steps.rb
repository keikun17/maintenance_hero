Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

# Open the current Capybara page using the `launchy` gem
Then /^show me the page$/ do
  save_and_open_page
end
