# frozen_string_literal: true

Before do
  # Get browser's user agent
  @user_agent = page.driver.execute_script('return navigator.userAgent')

  # Maximize the browser
  page.driver.browser.manage.window.maximize

  @home_page = Home.new
end

Before('@login') do
  @login_page = LoginPage.new
end
