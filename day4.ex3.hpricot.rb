#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr
$: << ENV['PWD'] # add pwd to the rubylib

# nethpcot.rb
require 'open-uri'
require 'hpricot'
require 'count'

My_page = @chapter3
page = Hpricot(open(My_page))

@my_string = ''
page.traverse_text_internal { |j| @my_string << j.to_s }

summarize(My_page, count(@my_string, 'the'))

