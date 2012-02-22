
# #!/usr/bin/env ruby

# ruby learning

STDOUT.sync = true # or could write to stderr

$: << Dir.pwd

puts "dollor colon is: #{$:.inspect}"

# my_rack2.rb
require 'rubygems'
require 'rack'

# test one: simple proc which is a lambda
# my_rack_proc = lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Hello from #{File.basename($0)} . The time is #{Time.now}"]] }
# Rack::Handler::WEBrick.run my_rack_proc, :Port => 9876
# Rack::Server.new( { :app => my_rack_proc, :server => 'webrick', :Port => 9876} ).start

# test two: pass a method
def my_method(env)
	[200, {}, ["my_method called in #{File.basename($0)} with env #{env.inspect} at #{Time.now}\n"]]
end

@port = 5678

puts "about to start rack server"

my_rack_server = Rack::Server.new( { :app => method(:my_method), :server => 'webrick', :Port => @port} ) # the key is syntax method(:my_method)
my_rack_server.start

puts "about to shut down"

exit 0

