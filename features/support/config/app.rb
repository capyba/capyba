# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: App Module Env Catcher
###
module AppModule
  include EnvironmentModule

  module_function

  Dotenv.require_keys('APP_ENV', 'APP_HOST')

  def env
    {
      app_env: ENV.fetch('APP_ENV', 'production'),
      app_host: ENV.fetch('APP_HOST', 'http://localhost')
    }
  end
end
