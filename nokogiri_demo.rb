#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

require 'count'

# nokogiri_demo.rb

require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open(@ruby_learning))

