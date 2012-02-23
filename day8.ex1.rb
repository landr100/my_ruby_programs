# my_app.rb
class MyApp
	def initialize(argv)
		@my_argv = argv
	end

	def call(env)
		# [200, {"Content-Type" => "text/html"}, ["Hello Rack Participants from across the globe"]]
		# [200, {"Content-Type" => "text/plain"}, ["env is #{env} and command line argument you typed was: .#{ARGV.join(' ')}."]]
		msg = "env is #{env}"
		msg << " and command line argument you typed was: .#{@my_argv.join(' ')}."
		msg << " and ARGV is .#{ARGV.inspect}."
		msg << "\n"
		content_type = "text/html" # or "text/plain"
		[200, {"Content-Type" => content_type}, [msg]]
	end
end

# __END__
#
# The config.ru will look like this:
#
# require './day8.ex1'
#
# puts "\nin config.ru ARGV is #{ARGV.inspect}\n"
# run MyApp.new(ARGV)
#
# command line:
# rackup "Hello World!" *.ru
