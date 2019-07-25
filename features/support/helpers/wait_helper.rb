# frozen_string_literal: true

require 'capybara/dsl'

###
# Helpers Module
###
module WaitHelper
  include Capybara::DSL

  module_function

  def wait_current_url_helper(url)
    wait = Selenium::WebDriver::Wait.new(timeout: 60)
    wait.until { page.current_url.include?(url.to_s) }
  end
end
