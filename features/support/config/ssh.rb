# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: SSH Module Env Catcher
###
module SSHModule
  include EnvironmentModule

  module_function

  def env
    {
      ssh_host: ENV.fetch('SSH_HOST', 'localhost'),
      ssh_user: ENV.fetch('SSH_USER', ''),
      ssh_pass: ENV.fetch('SSH_PASS', ''),
      ssh_port: ENV.fetch('SSH_PORT', 22)
    }
  end
end
