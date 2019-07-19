# frozen_string_literal: true

require_relative 'dotenv'

###
# @description: Report Module Env Catcher
###
module ReportModule
  include EnvironmentModule

  module_function

  def env
    {
      report_type: ENV.fetch('REPORT_TYPE', 'html'),
      report_only_defects: ENV.fetch('REPORT_ONLY_DEFECTS', false),
      report_include_evidences: ENV.fetch('REPORT_INCLUDE_EVIDENCES', false)
    }
  end
end
