# frozen_string_literal: true

require 'i18n'
require_relative 'app'

###
# @description: App Module Env Catcher
###
module LocaleModule
  locales = 'features/support/core/language'
  I18n.load_path << Dir[File.expand_path(locales) + '/*.yml']
  I18n.default_locale = AppModule.language.to_sym
end
