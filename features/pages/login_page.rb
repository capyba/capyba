# frozen_string_literal: true

require 'bcrypt'
require 'capybara/dsl'

require_relative File.expand_path('features\support\config\login')

##
# Login Page
##
class LoginPage
  include Capybara::DSL
  include LoginModule

  def proceed
    visit 'https://accounts.google.com/ServiceLogin'
    username
    password
    sleep 2
  end

  def username
    find("input[name='identifier']").set LoginModule.username
    find('#identifierNext').click
  end

  def password
    find("input[name='password']").set LoginModule.password
    find('#passwordNext').click
  end
end
