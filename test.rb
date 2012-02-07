#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

require 'count'

require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML:Document for the page we’re interested in...

doc = Nokogiri::HTML(open('http://www.google.com/search?q=tenderlove'))

# Do funky things with it using Nokogiri::XML::Node methods...

####
# Search for nodes by css
doc.css('h3.r a.l').each do |link|
puts link.content
end

####
# Search for nodes by xpath
doc.xpath('//h3/a[@class="l"]').each do |link|
puts link.content
end

# ref: http://nokogiri.org/README_rdoc.html
