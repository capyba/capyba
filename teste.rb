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

# require 'pastel'
# pastel = Pastel.new
# puts pastel.yellow.bold('Unicorns!')

# ---------------------------------------- #

# require 'countries/global'

# c = Country['US']
# p c.number
# p c.alpha2 # => "US"
# p c.alpha3 # => "USA"
# p c.gec    # => "US"

# p c.name
# p c.unofficial_names

# p c.local_names

# p c.region # => "Americas"
# p c.subregion # => "Northern America"

# p c.latitude # => "38 00 N"
# p c.longitude # => "97 00 W"
# p c.latitude_dec # => 39.44325637817383
# p c.longitude_dec # => -98.95733642578125

# ---------------------------------------- #

# require 'ruby-progressbar'

# progressbar = ProgressBar.create

# 10.times { progressbar.increment; sleep 0.1 }
# 15.times { progressbar.increment; sleep 0.1 }
# 20.times { progressbar.increment; sleep 0.1 }
# 15.times { progressbar.increment; sleep 0.1 }
# 30.times { progressbar.increment; sleep 0.1 }
# 10.times { progressbar.increment; sleep 0.1 }

# 100 %

# ---------------------------------------- #

# 'https://wikimatze.de/installing-postgresql-gem-under-ubuntu-and-mac/'

require "browser"

browser = Browser.new("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36", accept_language: "en-us")
p browser.mac?