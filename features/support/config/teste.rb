# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: App Module Env Catcher
###
class Teste
  prepend EnvironmentModule

  Dotenv.require_keys('APP_ENV', 'APP_HOST', 'APP_LANG')

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

# p Teste.check_env_existance('app_lang', 'br')
# p Teste.new.env
p ENV.values

# ENV.clear # Removes every env variable.
# ENV.empty? # Returns true when there are no env variables.
# ENV.fetch() # Retrieves the env variable name.
# ENV.key? # Returns true if there is an env variable with the given name.
# ENV.value?() # Returns true if there is an env variable with the given value.
# ENV.include?() # Returns true if there is an env variable with the given name.
# ENV.keys # Returns every env variable name in an Array.
# ENV.length # Returns the number of env variables.
# ENV.size # Returns the number of env variables.
# ENV.values # Returns every env variable value as an Array.

####
# Returns the name of the env variable with value.
# If the value is not found nil is returned.
####
# ENV.key()

####
# Sets the environment variable name to value.
# If the value given is nil the environment variable is deleted.
# name must be a string.
####
# ENV.store(name, value)
