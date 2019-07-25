# frozen_string_literal: true

require 'pg'
require_relative 'gateway'

###
# @description: PostgreSQL Database Module
###
module PostgreSQLModule
  include GatewayModule

  module_function

  @sshd = DatabaseModule.ssh.eql?('true')

  def conn
    return unless DatabaseModule.driver.eql?('pgsql')

    @client = PG::Connection.new(
      host: DatabaseModule.hostname,
      user: DatabaseModule.username,
      password: DatabaseModule.password,
      dbname: DatabaseModule.database,
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
