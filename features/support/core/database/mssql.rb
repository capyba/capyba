# frozen_string_literal: true

require 'tiny_tds'
require_relative 'gateway'

###
# @description: Microsoft SQL Server Database Module
###
module MSSQLModule
  include GatewayModule

  module_function

  @sshd = DatabaseModule.ssh.eql?('true')

  def conn
    return unless DatabaseModule.driver.eql?('mssql')

    @client = TinyTds::Client.new(
      host: DatabaseModule.hostname,
      username: DatabaseModule.username,
      password: DatabaseModule.passname,
      database: DatabaseModule.database,
      port: @sshd ? GatewayModule.tunnel : DatabaseModule.port,
      login_timeout: 60,
      timeout: 300
    )
  end

  # Used for insert, update or delete
  def action(script)
    conn
    @result = execute(script).do
    close
    @result
  end

  def insert(script)
    conn
    @result = execute(script).insert
    close
    @result
  end

  def execute(script, each = false)
    if conn.nil?
      I18n.t('database.error_message.driver.unsupported')
    else
      case each
      when true
        @client.execute(script.to_s).each
      when false
        @client.execute(script.to_s)
      end
    end
  end

  def close
    @client.close
  end
end
