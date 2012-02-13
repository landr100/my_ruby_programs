#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr
$: << ENV['PWD'] # add pwd to the rubylib

# nethpcot.rb
require 'open-uri'
require 'hpricot'
require 'count'

My_page = @chapter3
page = Hpricot(open(My_page))
# puts "Page title is: " + page.at(:title).inner_html


