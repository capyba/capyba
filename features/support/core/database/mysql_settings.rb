# frozen_string_literal: true

require 'mysql2'

require_relative 'settings'

# @description: Database MYSQL Settings Module
module DatabaseMYSQLSettingsModule
  include DatabaseSettingsModule

  module_function

  def connection
    Mysql2::Client.new(mysql_settings)
  end

  def settings
    DatabaseSettingsModule.settings
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
end
