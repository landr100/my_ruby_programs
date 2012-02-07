#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

require 'count'

# neturi1.rb
require 'net/http'

uri = URI(@text_txt)
res = Net::HTTP.get_response(uri)
puts res.code    # => '200'
puts res.message # => 'OK'

puts Net::HTTP.get(uri) # => String
