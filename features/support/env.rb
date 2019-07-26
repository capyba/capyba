# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'mysql2'
require 'os'
require 'selenium-webdriver'

require_relative File.join(Dir.pwd, '/features/support/core/functions/path')

app = File.expand_path('features/support/config/app')
browser = File.expand_path('features/support/config/browser')
wait = File.expand_path('features/support/helpers/wait_helper')

require_relative Path.new.convert(app)
require_relative Path.new.convert(browser)
require_relative Path.new.convert(wait)

World(WaitHelper)

Capybara.configure do |config|
  config.app_host = AppModule.hostname
  config.default_driver = BrowserModule.driver
  config.default_max_wait_time = BrowserModule.default_max_wait_time
  config.default_selector = BrowserModule.default_selector
  config.ignore_hidden_elements = BrowserModule.ignore_hidden_elements
end
