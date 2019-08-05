# frozen_string_literal: true

# require 'builder'

# xml_markup = Builder::XmlMarkup.new(target: STDOUT, indent: 2)
# xml_markup.instruct! :xml, version: '1.0', encoding: 'UTF-8'
# xml_markup.comment! 'This is a comment'
# xml_markup.person do |b|
#   b.name('Jim')
#   b.phone('555-1234')
# end
# xml_markup.documentation do |b|
#   b.rg('7107110')
#   b.cpf('06812973440')
# end
# xml_markup.address do |b|
#   b.city('Recife')
#   b.state('Pernambuco')
# end

# ---------------------------------------- #

# Show only true hashes
# h = { a: true, b: false, c: true }
# p h.select { |_, v| v }.keys

# ---------------------------------------- #

# Convert an array to a hash
# browsers = [1, 2, 3, 4]
# # p Hash[browsers.each_slice(1).to_a] #=> {1=>nil, 2=>nil, 3=>nil, 4=>nil}
# p Hash[browsers.each_slice(2).to_a] #=> {1=>2, 3=>4}

# ---------------------------------------- #

# require 'bcrypt'

# # p BCrypt::Password.create("my password")
# p BCrypt::Password.new("$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey")

# ---------------------------------------- #

# require 'csv'

# estate = CSV.read('estate.csv', headers: true)
# # p estate.headers
# # estate.map { |row| p row[1] }

# estate.each do |row|
#   p row['state']
# end

# ---------------------------------------- #

# require 'nokogiri'

# builder = Nokogiri::XML::Builder.new do |xml|
#   xml.root {
#     xml.objects {
#       xml.object.classy.thing!
#     }
#   }
# end
# puts builder.to_xml

# <?xml version="1.0"?>
# <root>
#   <objects>
#     <object class="classy" id="thing"/>
#   </objects>
# </root>

# ---------------------------------------- #

# require 'eu_central_bank'

# eu_bank = EuCentralBank.new
# eu_bank.update_rates
# p eu_bank.exchange(100, 'CAD', 'USD')

# ---------------------------------------- #

require "thor"

class MyCLI < Thor
  desc "hello NAME", "say hello to NAME"
  options :from => :required, :yell => :boolean
  def hello(name)
    output = []
    output << "from: #{options[:from]}" if options[:from]
    output << "Hello #{name}"
    output = output.join("\n")
    puts options[:yell] ? output.upcase : output
  end
end

MyCLI.start(ARGV)
