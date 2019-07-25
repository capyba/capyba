# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |config|
  config.app_host = AppModule.hostname
  config.default_driver = BrowserModule.driver
  config.default_max_wait_time = BrowserModule.default_max_wait_time
end
