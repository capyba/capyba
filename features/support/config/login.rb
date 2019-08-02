# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: Login Module Env Catcher
###
module LoginModule
  extend EnvironmentModule

  module_function

  Dotenv.require_keys(%w[LOGIN_USER LOGIN_PASS])

  def username
    check_env_keys('LOGIN_USER', 'x')
  end

  def password
    check_env_keys('LOGIN_PASS', 'x')
  end
end
