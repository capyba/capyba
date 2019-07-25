# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: SSH Module Env Catcher
###
module SSHModule
  extend EnvironmentModule

  module_function

  def hostname
    check_env_keys('SSH_HOST', 'localhost')
  end

  def password
    check_env_keys('SSH_PASS', nil)
  end

  def port
    check_env_keys('SSH_PORT', 22)
  end

  def username
    check_env_keys('SSH_USER', nil)
  end
end
