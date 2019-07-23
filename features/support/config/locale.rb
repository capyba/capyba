# frozen_string_literal: true

require 'i18n'
require_relative 'modules'

###
# @description: App Module Env Catcher
###
module LocaleModule
  locales = 'features/support/core/locales'
  I18n.load_path << Dir[File.expand_path(locales) + '/*.yml']
  I18n.default_locale = AppModule.env[:app_lang].to_sym
end

p I18n.t('database.error_message.driver.unsupported')
