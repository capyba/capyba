# frozen_string_literal: true

require 'pg'
require_relative 'gateway'

###
# @description: PostgreSQL Database Module
###
module PostgreSQLModule
  include GatewayModule

  module_function

  @driver = Modules::Database.connection
  @sshd = Modules::Database.sshd.to_s.eql?('true')

  def conn
    return unless @driver.eql?('pgsql')

    @client = PG::Connection.new(
      host: Modules::Database.host,
      dbname: Modules::Database.name,
      user: Modules::Database.user,
      password: Modules::Database.pass,
      port: @sshd ? GatewayModule.tunnel : Modules::Database.port
    )
  end

  def exec(script)
    if conn.nil?
      'O driver de Banco de Dados informado não é suportado.'
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
