# frozen_string_literal: true

require 'dotenv'

# @description: Environment Module Dotenv Loader
module EnvironmentModule
  module_function

  Dotenv.load(File.expand_path('.env', Dir.pwd))

  def check_env_keys(key, default)
    default = default.to_s
    if ENV.key?(key) && ENV[key].to_s.empty?
      ENV.store(key, default)
    else
      ENV.fetch(key, default)
    end
  end
end
