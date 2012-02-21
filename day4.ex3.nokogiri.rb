#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

require 'count'

# day4.ex3.nokogiri.rb

require 'nokogiri'
require 'open-uri'
# My_page = @chapter3
# doc = Nokogiri::HTML(open(My_page))

summarize(@chapter3, count(Nokogiri::HTML(open(@chapter3)).css('*').first.content, 'the'))

