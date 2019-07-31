# frozen_string_literal: true

# require 'pdf-reader'
# require 'terminal-table'
# require 'ruby-progressbar'
# require 'bcrypt'
# require 'rqrcode'

# require 'optimist'

# ###
# # @description: Capyba Command Options Module
# ###
# module CapybaModule
#   include Optimist

#   # PENDING

#   Optimist.options do
#     version 'Capyba 0.0.6 (c) 2019 - Developed by Lucas Ferreira'
#     banner "\nCAPYBA TESTING FRAMEWORK"
#     banner 'A framework based on Cucumber, Capybara and Ruby for testers'

#     banner "\nUsage: \nruby capyba.rb [options]"
#     banner "\nOptions:"

#     opt :database, 'Show the configured database environment variables', default: '15'
#     opt :name, 'Monkey name', type: :string
#     opt :num_limbs, 'Number of limbs', default: 4
#     opt :help, 'Show this help message', short: :h
#   end
# end

# ---------------------------------------- #

# reader = PDF::Reader.new('D:\asia-16-Sivakorn-Im-Not-a-Human-Breaking-the-Google-reCAPTCHA-wp.pdf')

# puts reader.pdf_version
# puts reader.info
# puts reader.metadata
# puts reader.page_count

# puts reader.objects.inspect

# ---------------------------------------- #

# rows = []
# rows << ['One', 1]
# rows << ['Two', 2]
# rows << ['Three', 3]
# # table = Terminal::Table.new :rows => rows

# table = Terminal::Table.new headings: %w[Word Number], rows: rows, style: {width: 80}
# table.style = {:width => 40, :padding_left => 3, :border_x => ".", :border_i => "."}

# puts table

# ---------------------------------------- #

# my_password = BCrypt::Password.create("my password")
# #=> "$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey"

# p my_password
# p my_password.version              #=> "2a"
# p my_password.cost                 #=> 12
# p my_password == "my password"     #=> true
# p my_password == "not my password" #=> false

# my_password = BCrypt::Password.new('$2a$12$yycLM3WrsKlYENV264Wtf.n5uvA0Af6VD1SnaeNCLjOKRr9RGo1SO')
# p my_password == "my password"     #=> true
# p my_password == "not my password" #=> false

# # ---------------------------------------- #

require 'eu_central_bank'
eu_bank = EuCentralBank.new

# call this before calculating exchange rates
# this will download the rates from ECB
eu_bank.update_rates

# exchange 100 CAD to USD
# API is the same as the money gem
p eu_bank.exchange(10_000, "CAD", "USD") # Money.new(80, "USD")
