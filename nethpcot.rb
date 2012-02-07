#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr
$: << ENV['PWD'] # add pwd to the rubylib

# nethpcot.rb
require 'open-uri'
require 'hpricot'
require 'count'

page = Hpricot(open(@ruby_learning))
puts "Page title is: " + page.at(:title).inner_html


