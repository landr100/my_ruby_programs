# my_app.rb
class MyApp
	def call(env)
	[200, {"Content-Type" => "text/html"}, ["Hello Rack Participants from across the globe"]]
	end
end

__END__

Also, our config.ru will change to:

require './my_app'
run MyApp.new

