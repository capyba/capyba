# frozen_string_literal: true

require 'ostruct'

require_relative 'gateway'
require_relative File.expand_path('features\support\config\database')

###
# @description: Database Settings Module
###
module DatabaseSettingsModule
  include DatabaseModule
  include GatewayModule

  module_function

  def driver
    DatabaseModule.driver
  end

  def settings
    OpenStruct.new(
      hostname: DatabaseModule.hostname,
      username: DatabaseModule.username,
      password: DatabaseModule.password,
      database: DatabaseModule.database,
      port: ssh ? GatewayModule.tunnel : DatabaseModule.port
    )
  end

  def ssh
    DatabaseModule.ssh.eql?('true')
  end
end
