# frozen_string_literal: true

Given('the browser is at the Google search page') do
  @home_page.load
end

When('the user searches for {string}') do |word|
  find("input[name='q']").send_keys word, :enter
end

Then('web page links for {string} are shown') do |word|
  expect(page).to have_css("div[id='search']", wait: 10)
  expect(page).to have_text word
end

# For login
When('the user enters its credentials') do
  @login_page.proceed
end

Then('the login is done') do
  expect(page.current_url).to have_text 'https://myaccount.google.com'
end
