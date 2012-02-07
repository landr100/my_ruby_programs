#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

# netouri.rb
require 'open-uri'
require 'count'

f = open(@chapter3)
# puts f.readlines.join

num_the = count(f.readlines.join, 'the')

puts "#{@my_script_name} : found #{num_the} occurrences of the word 'the' from site #{@chapter3}"

