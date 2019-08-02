# frozen_string_literal: true

require_relative 'settings'
require_relative 'mssql_settings'
require_relative 'mysql_settings'
require_relative 'pgsql_settings'
require_relative File.expand_path('features\support\config\locale')

# @description: Database Class
class Database
  include DatabaseSettingsModule
  include DatabaseMSSQLSettingsModule

  def initialize
    @driver = DatabaseSettingsModule.driver
  end

  def conn
    database(@driver) if %w[mssql mysql pgsql].include?(@driver)
  end

  def database(driver)
    case driver
    when 'mssql'
      DatabaseMSSQLSettingsModule.connection
    when 'mysql'
      DatabaseMYSQLSettingsModule.connection
    when 'pgsql'
      DatabasePGSQLSettingsModule.connection
    end
  end

  def database_query(script)
    @driver.eql?('mssql') ? conn.execute(script) : conn.query(script)
  end

  def execute(script)
    database_query(script)
  rescue NoMethodError => e
    puts "\n>>> #{I18n.t('database.error_message.driver.unsupported')} <<<\n"
  rescue StandardError => e
    puts "\n>>> #{I18n.t('database.error_message.query.execution')} <<<\n"
  ensure
    conn.close unless e
  end
end
