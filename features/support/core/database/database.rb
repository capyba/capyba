# frozen_string_literal: true

require 'mysql2'
require 'pg'
require 'tiny_tds'

require_relative File.expand_path('features\support\core\database\gateway')
require_relative File.expand_path('features\support\config\database')
require_relative File.expand_path('features\support\config\locale')

# @description: Database Class
class Database
  include GatewayModule

  def initialize
    @driver = DatabaseModule.driver
    @ssh = DatabaseModule.ssh.eql?('true')
    @successful = true
  end

  def connection
    database(@driver) if %w[mssql mysql pgsql].include?(@driver)
  end

  def database(driver)
    case driver
    when 'mssql'
      TinyTds::Client.new(mssql_settings)
    when 'mysql'
      Mysql2::Client.new(mysql_settings)
    when 'pgsql'
      PG::Connection.new(pgsql_settings)
    end
  end

  def execute(script)
    connection.query(script)
  rescue NoMethodError
    @successful = false
    puts "\n>>> #{I18n.t('database.error_message.driver.unsupported')} <<<\n"
  rescue StandardError
    @successful = false
    puts "\n>>> #{I18n.t('database.error_message.query.execution')} <<<\n"
  ensure
    connection.close if @successful
  end

  def settings
    OpenStruct.new(
      host: DatabaseModule.hostname,
      username: DatabaseModule.username,
      password: DatabaseModule.password,
      database: DatabaseModule.database,
      port: @ssh ? GatewayModule.tunnel : DatabaseModule.port
    )
  end

  def mssql_settings
    OpenStruct.new(
      host: settings.hostname,
      username: settings.username,
      password: settings.password,
      database: settings.database,
      port: settings.port,
      login_timeout: 60,
      timeout: 300
    ).to_h
  end

  def mysql_settings
    OpenStruct.new(
      host: settings.hostname,
      username: settings.username,
      password: settings.password,
      database: settings.database,
      port: settings.port
    ).to_h
  end

  def pgsql_settings
    OpenStruct.new(
      host: settings.hostname,
      user: settings.username,
      password: settings.password,
      dbname: settings.database,
      port: settings.port,
      connect_timeout: 60
    ).to_h
  end
end

# query = 'select * from teste'
# select = 'select * from teste'
insert = "insert into teste(column1) values('Teste') RETURNING *"
p Database.new.execute(insert)
# p Database.new.instance_variables
