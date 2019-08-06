# frozen_string_literal: true

require_relative 'dotenv'

# @description: App Module Env Catcher
module AppModule
  extend EnvironmentModule

  module_function

  Dotenv.require_keys(%w[APP_ENV APP_HOST APP_LANG])

  def env
    check_env_keys('APP_ENV', 'local')
  end

  def hostname
    check_env_keys('APP_HOST', 'http://localhost')
  end

  def language
    check_env_keys('APP_LANG', 'en')
  end
end
