
# version 0:
# rack_time = Proc.new { |env| [200, {"Content-Type" => "text/plain"}, ["Hello. The time is #{Time.now}"]] }
# Rack::Handler::WEBrick.run rack_time, :Port => 9292

# version 1:
# rack_time = Proc.new { |env| [200, {"Content-Type" => "text/plain"}, ["Hello. The time is #{Time.now}"]] }
# builder = Rack::Builder.new do
# 	run rack_time
# end
# Rack::Handler::WEBrick.run builder, :Port => 9292
#

# version 2:
# require 'logger'
# rack_time = Proc.new { |env| [200, {"Content-Type" => "text/plain"}, ["Hello. The time is #{Time.now}"]] }
# builder = Rack::Builder.new do
# 	use Rack::CommonLogger
# 	Logger.new('rack.log')
# 	run rack_time
# end
# Rack::Handler::WEBrick.run builder, :Port => 9292
#

# version 3:
require 'logger'
rack_app = Rack::Builder.new do
	use Rack::CommonLogger
	Logger.new('rack.log')

	map "/" do
		run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["This is public page"]] }
	end

	map "/secret" do
		use Rack::Auth::Basic, "Restricted Area" do |user, password|
			user == 'super' && password == 'secretsauce'
		end

		map "/" do
			run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["This is a secret page"]] }
		end

		map "/files" do
			run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Here are the secret files"]] }
		end
	end
end
Rack::Handler::WEBrick.run rack_app, :Port => 9292
