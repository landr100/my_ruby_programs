#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to rubylib

# cd mydocs/development/ruby_training

# day4.ex3.uri.rb
# day 4, exercise 3, uri solution
require 'count'
require 'net/http'

uri = URI(@chapter3)
res = Net::HTTP.get_response(uri)
puts res.code    # => '200'
puts res.message # => 'OK'

# puts Net::HTTP.get(uri) # => String

num_the = count(Net::HTTP.get(uri), 'the')

summarize()

