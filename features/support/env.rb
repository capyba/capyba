# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'

require_relative File.expand_path('features/support/config/app')
require_relative File.expand_path('features/support/config/browser')
require_relative File.expand_path('features/support/helpers/wait_helper')

World(WaitHelper)

Capybara.configure do |config|
  config.app_host = AppModule.hostname
  config.default_driver = BrowserModule.driver
  config.default_max_wait_time = BrowserModule.default_max_wait_time
  config.default_selector = BrowserModule.default_selector
  config.ignore_hidden_elements = BrowserModule.ignore_hidden_elements
end
