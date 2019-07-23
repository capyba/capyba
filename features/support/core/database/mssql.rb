# frozen_string_literal: true

require 'tiny_tds'
require_relative 'gateway'

###
# @description: Microsoft SQL Server Database Module
###
module MSSQLModule
  include GatewayModule

  module_function

  @driver = Modules::Database.connection
  @sshd = Modules::Database.sshd.to_s.eql?('true')

  def conn
    return unless @driver.eql?('mssql')

    @client = TinyTds::Client.new(
      host: Modules::Database.host,
      username: Modules::Database.user,
      password: Modules::Database.pass,
      database: Modules::Database.name,
      port: @sshd ? GatewayModule.tunnel : Modules::Database.port,
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
