#!/usr/bin/env ruby

# ruby learning

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD']

# my_rack_proc2.rb
require 'rack'

my_rack_proc = lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Hello from #{File.basename($0)} . The time is #{Time.now}"]] }

# Rack::Handler::WEBrick.run my_rack_proc, :Port => 9876
# Rack::Server.new( { :app => my_rack_proc, :server => 'webrick', :Port => 9876} ).start

def my_method env
	[200, {}, ["method called with env #{env.inspect}"]]
end

# Rack::Handler::WEBrick.run method(:my_method)

@port = 5678

# Rack::Server.new( { :app => :my_method, :server => 'webrick', :Port => @port} ).start
Rack::Handler::WEBrick.run method(:my_method)

