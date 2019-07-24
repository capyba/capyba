# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: App Env Catcher
###
class AppEnvironment
  prepend EnvironmentModule

  required = %w[APP_ENV APP_HOST APP_LANG]

  Dotenv.require_keys(required)

  def env
    check_env_keys('APP_ENV', 'local')
  end

  def host
    check_env_keys('APP_HOST', 'http://localhost')
  end

  def language
    check_env_keys('APP_LANG', 'en')
  end
end

p AppEnvironment.new.host
