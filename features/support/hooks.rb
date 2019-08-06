# frozen_string_literal: true

require 'browser'

Before do
  page.driver.browser.manage.window.maximize
  @ua = page.driver.execute_script('return navigator.userAgent')
  browser = Browser.new(@ua)
  p browser.platform
  @login_page = LoginPage.new
end
