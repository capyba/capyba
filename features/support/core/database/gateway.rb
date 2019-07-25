# frozen_string_literal: true

require 'net/ssh/gateway'
require_relative File.expand_path('features/support/config/ssh')

###
# @description: SSH Gateway Tunnel Module
###
module GatewayModule
  include SSHModule

  module_function

  def tunnel
    gateway = Net::SSH::Gateway.new(
      SSHModule.hostname,
      SSHModule.username,
      password: SSHModule.password,
      port: SSHModule.port
    )
    host = DatabaseModule.host
    port = DatabaseModule.port
    ssh_port = DatabaseModule.ssh_port
    gateway.open(host, port, ssh_port)
  end
end
