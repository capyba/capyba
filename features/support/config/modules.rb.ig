# frozen_string_literal: true

require_relative 'app'
require_relative 'browser'
require_relative 'database'
require_relative 'mail'
require_relative 'report'
require_relative 'ssh'

###
# @description: Main Module for Environment Variables
###
module Modules
  include AppModule
  include BrowserModule
  include DatabaseModule
  include MailModule
  include ReportModule
  include SSHModule

  module_function

  def check_env_keys(key_name, default_value, class_module)
    key = key_name.to_s.downcase.split(':').last
    if ENV.key?(key) && ENV[key].to_s.empty?
      ENV[key] = default_value.to_s
      class_module.env[key_name] = ENV[key]
    end
    class_module.env[key_name]
  end

  def check_db_env_keys(key_name, default_value, db_name, db_key)
    configuration = get_database_configuration(db_name)
    key = key_name.to_s.downcase.split(':').last
    value = default_value.to_s
    db_key = db_key.to_s.downcase.to_sym
    check_empty_key(key, value, configuration, db_key)
  end

  def check_empty_key(key, value, configuration, db_key)
    if ENV.key?(key) && ENV[key].to_s.empty?
      ENV[key] = value
      configuration[db_key] = ENV[key]
    end
    configuration[db_key]
  end

  def get_database_configuration(database_name)
    DatabaseModule.env[:connections][database_name.to_sym]
  end

  # AppModule
  module App
    module_function

    def env
      Modules.check_env_keys(:app_env, 'production', AppModule)
    end

    def host
      Modules.check_env_keys(:app_host, 'http://localhost', AppModule)
    end

    def lang
      Modules.check_env_keys(:app_lang, 'en', AppModule)
    end
  end

  # BrowserModule
  module Browser
    module_function

    def browser
      Modules.check_env_keys(:browser, 'firefox', BrowserModule)
    end

    def browser_headless
      Modules.check_env_keys(:browser_headless, false, BrowserModule)
    end

    def driver
      browser_name = browser
      browser_name += '_headless' if browser_headless.eql? 'true'
      driver_name(browser_name)
    end

    def driver_name(browser)
      case browser
      when 'chrome'
        :selenium_chrome
      when 'chrome_headless'
        :selenium_chrome_headless
      when 'firefox_headless'
        :selenium_headless
      else
        :selenium
      end
    end

    def driver_waiter
      Modules.check_env_keys(:default_max_wait_time, 2, BrowserModule)
    end

    def ignore_hidden_elements
      Modules.check_env_keys(:ignore_hidden_elements, false, BrowserModule)
    end

    def screenshot
      Modules.check_env_keys(:screenshot, false, BrowserModule)
    end

    def screenshot_type
      Modules.check_env_keys(:screenshot_type, 'image/png', BrowserModule)
    end

    def screenshot_embedded
      Modules.check_env_keys(:screenshot_embedded, false, BrowserModule)
    end

    def screenshot_only_failures
      Modules.check_env_keys(:screenshot_only_failures, false, BrowserModule)
    end

    def window_size_width
      Modules.check_env_keys(:window_size_width, 1366, BrowserModule)
    end

    def window_size_height
      Modules.check_env_keys(:window_size_height, 768, BrowserModule)
    end
  end

  # DatabaseModule
  module Database
    module_function

    def database
      Modules.check_env_keys(:db_type, 'mysql', DatabaseModule)
    end

    def sshd
      Modules.check_env_keys(:db_sshd, false, DatabaseModule)
    end

    def connection
      return if database.nil?

      if %w[mysql pgsql mssql sqlite].include?(database)
        Modules.get_database_configuration(database)[:driver]
      else
        Modules.get_database_configuration('mysql')[:driver]
      end
    end

    def host
      Modules.check_db_env_keys(:db_host, '127.0.0.1', connection, 'host')
    end

    def port
      Modules.check_db_env_keys(:db_port, '5432', connection, 'port')
    end

    def name
      Modules.check_db_env_keys(:db_name, 'forge', connection, 'database')
    end

    def user
      Modules.check_db_env_keys(:db_user, 'forge', connection, 'username')
    end

    def pass
      Modules.check_db_env_keys(:db_pass, '', connection, 'password')
    end

    def connection_port
      if connection.to_s.eql?('pgsql')
        '54320'
      elsif connection.to_s.eql?('mysql')
        '33060'
      elsif connection.to_s.eql?('mssql')
        '14330'
      else
        ''
      end
    end

    def local_port
      @port = connection_port
      driver = connection
      Modules.check_db_env_keys(:db_sshp, @port, driver, 'local_port')
    end
  end

  # MailModule
  module Mail
    module_function

    def driver
      Modules.check_env_keys(:mail_type, 'smtp2', MailModule)
    end

    def host
      Modules.check_env_keys(:mail_host, 'smtp.mailgun.org', MailModule)
    end

    def port
      Modules.check_env_keys(:mail_port, 587, MailModule)
    end

    def user
      Modules.check_env_keys(:mail_user, '', MailModule)
    end

    def pass
      Modules.check_env_keys(:mail_pass, '', MailModule)
    end

    def hash
      Modules.check_env_keys(:mail_hash, 'tls', MailModule)
    end

    def addr
      Modules.check_env_keys(:mail_addr, 'hello@example.com', MailModule)
    end

    def name
      Modules.check_env_keys(:mail_name, 'Example', MailModule)
    end
  end

  # ReportModule
  module Report
    module_function

    def extension
      Modules.check_env_keys(:report_type, 'html', ReportModule)
    end

    def only_defects
      Modules.check_env_keys(:report_only_defects, false, ReportModule)
    end

    def include_evidences
      Modules.check_env_keys(:report_include_evidences, false, ReportModule)
    end
  end

  # SSHModule
  module SSH
    module_function

    def host
      Modules.check_env_keys(:ssh_host, 'localhost', SSHModule)
    end

    def user
      Modules.check_env_keys(:ssh_user, '', SSHModule)
    end

    def pass
      Modules.check_env_keys(:ssh_pass, '', SSHModule)
    end

    def port
      Modules.check_env_keys(:ssh_port, 22, SSHModule)
    end
  end
end
