# frozen_string_literal: true

require_relative 'dotenv'

# @description: Database Module Env Catcher
module DatabaseModule
  extend EnvironmentModule

  module_function

  Dotenv.require_keys(%w[DB_TYPE DB_HOST DB_USER DB_PASS DB_NAME DB_PORT])

  def default_port
    case driver
    when 'mssql'
      1433
    when 'mysql'
      3306
    when 'pgsql'
      5432
    end
  end

  def driver
    check_env_keys('DB_TYPE', 'mysql')
  end

  def hostname
    check_env_keys('DB_HOST', '127.0.0.1')
  end

  def database
    check_env_keys('DB_NAME', 'forge')
  end

  def password
    check_env_keys('DB_PASS', 'forge')
  end

  def port
    check_env_keys('DB_PORT', default_port)
  end

  def ssh
    check_env_keys('DB_SSHD', false)
  end

  def ssh_port
    check_env_keys('DB_SSHP', "#{default_port}0")
  end

  def username
    check_env_keys('DB_USER', 'forge')
  end
end
