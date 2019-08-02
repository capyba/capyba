# frozen_string_literal: true

Before do
  page.driver.browser.manage.window.maximize
  @login_page = LoginPage.new
end
