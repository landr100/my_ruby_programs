#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

require 'count'

# simple_rack.rb

my_rack_proc = lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Command line argument you typed was: .#{ARGV.join(' ')}."]] }
puts my_rack_proc.call({})

# Rack::Server.new( { :app => my_rack_proc, :server => 'webrick', :Port => 9876} ).start

