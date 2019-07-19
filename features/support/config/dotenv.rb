# frozen_string_literal: true

require 'dotenv'

###
# @description: Environment Module Dotenv Loader
###
module EnvironmentModule
  Dotenv.load(File.expand_path('../../../.env', File.dirname(__FILE__)))
end
