# frozen_string_literal: true

require_relative 'dotenv'

# @description: Report Module Env Catcher
module ReportModule
  extend EnvironmentModule

  module_function

  def include_evidences
    check_env_keys('REPORT_INCLUDE_EVIDENCES', false)
  end

  def only_defects
    check_env_keys('REPORT_ONLY_DEFECTS', false)
  end

  def type
    check_env_keys('REPORT_TYPE', 'html')
  end
end
