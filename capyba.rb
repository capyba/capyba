# frozen_string_literal: true

require 'pdf-reader'

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

reader = PDF::Reader.new('D:\asia-16-Sivakorn-Im-Not-a-Human-Breaking-the-Google-reCAPTCHA-wp.pdf')

puts reader.pdf_version
puts reader.info
puts reader.metadata
puts reader.page_count

puts reader.objects.inspect
