#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

require 'count'

# netouri.rb
require 'open-uri'

f = open(@text_txt)
puts f.readlines.join

