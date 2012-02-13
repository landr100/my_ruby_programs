#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

# netouri.rb
require 'open-uri'
require 'count'

My_page = @chapter3
f = open(My_page)
# puts f.readlines.join

num_the = count(f.readlines.join, 'the')

summarize(My_page, num_the)

