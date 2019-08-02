# frozen_string_literal: true

Given('I visit {string}') do |url|
  visit url
end

When('I search for {string}') do |word|
  find("input[name='q']").send_keys word, :enter
end

Then('the result is shown') do
  expect(page).to have_css("div[id='search']", wait: 10)
end

# For login
When('I enter my credentials') do
  @login_page.proceed
end

Then('the login is done') do
  expect(page.current_url).to have_text 'https://myaccount.google.com'
end
