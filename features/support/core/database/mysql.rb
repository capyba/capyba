# frozen_string_literal: true

require 'mysql2'
require_relative 'gateway'

###
# @description: MySQL Database Module
###
module MySQLModule
  include GatewayModule

  module_function

  @driver = Modules::Database.connection
  @sshd = Modules::Database.sshd.to_s.eql?('true')

  def conn
    return unless @driver.eql?('mysql')

    @client = Mysql2::Client.new(
      host: Modules::Database.host,
      username: Modules::Database.user,
      password: Modules::Database.pass,
      database: Modules::Database.name,
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
