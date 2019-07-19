# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: Browser Module Env Catcher
###
module BrowserModule
  include EnvironmentModule

  module_function

  def env
    {
      browser: ENV.fetch('BROWSER', 'firefox'),
      browser_headless: ENV.fetch('BROWSER_HEADLESS', false),
      default_max_wait_time: ENV.fetch('DEFAULT_MAX_WAIT_TIME', 2),
      ignore_hidden_elements: ENV.fetch('IGNORE_HIDDEN_ELEMENTS', false),
      screenshot: ENV.fetch('SCREENSHOT', false),
      screenshot_type: ENV.fetch('SCREENSHOT_TYPE', 'image/png'),
      screenshot_embedded: ENV.fetch('SCREENSHOT_EMBEDDED', false),
      screenshot_only_failures: ENV.fetch('SCREENSHOT_ONLY_FAILURES', false),
      window_size_width: ENV.fetch('WINDOW_SIZE_WIDTH', 1366),
      window_size_height: ENV.fetch('WINDOW_SIZE_HEIGHT', 768)
    }
  end
end
