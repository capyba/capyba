# frozen_string_literal: true

require 'pg'

require_relative 'settings'

###
# @description: Database PGSQL Settings Module
###
module DatabasePGSQLSettingsModule
  include DatabaseSettingsModule

  module_function

  def connection
    PG::Connection.new(pgsql_settings)
  end

  def settings
    DatabaseSettingsModule.settings
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
