# my_rack_proc.rb
my_rack_proc = lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Hello. The time is #{Time.now}"]] }
puts my_rack_proc.call({})

# Rack::Server.new( { :app => my_rack_proc, :server => 'webrick', :Port => 9876} ).start

