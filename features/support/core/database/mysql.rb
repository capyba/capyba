# frozen_string_literal: true

require 'mysql2'
require_relative 'gateway'

###
# @description: MySQL Database Module
###
module MySQLModule
  include GatewayModule

  module_function

  @sshd = DatabaseModule.ssh.eql?('true')

  def conn
    return unless DatabaseModule.driver.eql?('mysql')

    @client = Mysql2::Client.new(
      host: DatabaseModule.hostname,
      username: DatabaseModule.username,
      password: DatabaseModule.password,
      database: DatabaseModule.database,
      port: @sshd ? GatewayModule.tunnel : DatabaseModule.port
    )
  end

  def exec(script)
    if conn.nil?
      I18n.t('database.error_message.driver.unsupported')
    else
      conn
      @hash = @client.query(script.to_s)
      close
      @hash
    end
  end

  def close
    @client.close
  end
end
