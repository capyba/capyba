# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: Browser Module Env Catcher
###
module BrowserModule
  extend EnvironmentModule

  module_function

  Dotenv.require_keys('BROWSER')

  def browser_headless
    check_env_keys('BROWSER_HEADLESS', false)
  end

  def default_max_wait_time
    check_env_keys('DEFAULT_MAX_WAIT_TIME', 2)
  end

  def default_selector
    check_env_keys('DEFAULT_SELECTOR', :css).to_sym
  end

  def driver
    browser = check_env_keys('BROWSER', 'firefox')
    browsers = %w[chrome firefox]
    return unless browsers.include?(browser)

    browser = "#{browser}_headless" if browser_headless.eql?('true')
    driver_name(browser)
  end

  def driver_name(browser)
    case browser
    when 'chrome'
      :selenium_chrome
    when 'chrome_headless'
      :selenium_chrome_headless
    when 'firefox_headless'
      :selenium_headless
    else
      :selenium
    end
  end

  def ignore_hidden_elements
    check_env_keys('IGNORE_HIDDEN_ELEMENTS', false)
  end

  def screenshot
    check_env_keys('SCREENSHOT', false)
  end

  def screenshot_type
    check_env_keys('SCREENSHOT_TYPE', 'image/png')
  end

  def screenshot_embedded
    check_env_keys('SCREENSHOT_EMBEDDED', false)
  end

  def screenshot_only_failures
    check_env_keys('SCREENSHOT_ONLY_FAILURES', false)
  end

  def window_size_height
    check_env_keys('WINDOW_SIZE_HEIGHT', 768)
  end

  def window_size_width
    check_env_keys('WINDOW_SIZE_WIDTH', 1366)
  end
end
