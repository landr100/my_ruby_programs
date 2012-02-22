#!/usr/bin/env ruby

# ruby learning

STDOUT.sync = true # or could write to stderr

$: << Dir.pwd # add pwd to the rubylib

require 'count'

# day7.ex1.rb

# my_rack_proc = lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Command line argument you typed was: .#{ARGV.join(' ')}."]] }
# puts my_rack_proc.call({})
# # Rack::Server.new( { :app => my_rack_proc, :server => 'webrick', :Port => 9876} ).start

# puts "dollor colon is: #{$:.inspect}"

# require 'rubygems'
require 'rack'

# pass a method which displays the command line
def my_method2(env)
	[200, {}, ["my_method2 called in #{File.basename($0)} with command line args #{ARGV.join(' ')} at #{Time.now}\n"]]
end

@port = 8500

puts "about to start rack server"

# my_rack_server = Rack::Server.new( { :app => method(:my_method2), :server => 'webrick', :Port => @port} ) # the key is syntax method(:my_method2)
# my_rack_server.start

Rack::Server.new( { :app => method(:my_method2), :server => 'webrick', :Port => @port} ).start

puts "about to shut down"

exit 0


