# frozen_string_literal: true

require 'tiny_tds'

require_relative 'settings'

###
# @description: Database MSSQL Settings Module
###
module DatabaseMSSQLSettingsModule
  include DatabaseSettingsModule

  module_function

  def connection
    TinyTds::Client.new(mssql_settings)
  end

  def settings
    DatabaseSettingsModule.settings
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
end
