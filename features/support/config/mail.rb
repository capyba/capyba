# frozen_string_literal: true

require_relative 'dotenv'

# @description: Mail Module Env Catcher
module MailModule
  extend EnvironmentModule

  module_function

  def address
    check_env_keys('MAIL_ADDR', nil)
  end

  def hash
    check_env_keys('MAIL_HASH', nil)
  end

  def hostname
    check_env_keys('MAIL_HOST', nil)
  end

  def name
    check_env_keys('MAIL_NAME', nil)
  end

  def password
    check_env_keys('MAIL_PASS', nil)
  end

  def port
    check_env_keys('MAIL_PORT', 587)
  end

  def type
    check_env_keys('MAIL_TYPE', 'smtp')
  end

  def username
    check_env_keys('MAIL_USER', nil)
  end
end
