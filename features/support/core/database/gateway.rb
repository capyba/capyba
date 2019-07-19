# frozen_string_literal: true

require 'net/ssh/gateway'

require_relative '../../config/modules'

###
# @description: SSH Gateway Tunnel Module
###
module GatewayModule
  include Modules

  module_function

  def tunnel
    gateway = Net::SSH::Gateway.new(
      Modules::SSH.host,
      Modules::SSH.user,
      password: Modules::SSH.pass,
      port: Modules::SSH.port
    )
    host = Modules::Database.host
    port = Modules::Database.port
    local_port = Modules::Database.localPort
    gateway.open(host, port, local_port)
  end
end
