# my_middleware.rb
module MyMiddleware
	class Hello
		def initialize(app)
			@app = app
		end

		ONE_HOUR = 60 * 60
		Time_offset = (Time.now.zone[0].chr == 'C') ? ONE_HOUR : 0 # convert from Central time to Eastern time
		def log(str)
		        STDERR.puts((Time.now+Time_offset).strftime("%D %T") + ' : ' + str)
		end

		def call(env)
			log("in call(#{env.inspect})")
			if env['PATH_INFO'] == '/'
				[200, {"Content-Type" => "text/plain"}, ["OK!"]]
			else
				[404, {"Content-Type" => "text/plain"}, ["Not OK!"]]
				# forward the request
				# @app.call(env)
			end
		end
	end
end
=begin
127.0.0.1 - - [18/Apr/2012 10:14:58] "GET /hello HTTP/1.1" 200 - 0.0010
04/18/12 10:14:59 : in call({"SERVER_SOFTWARE"=>"thin 1.3.1 codename Triple Espresso", "SERVER_NAME"=>"localhost", "rack.input"=>#<Rack::Lint::InputWrapper:0x00000101a11218 @input=#<StringIO:0x000001018d4c88>>, "rack.version"=>[1, 0], "rack.errors"=>#<Rack::Lint::ErrorWrapper:0x00000101a111a0 @error=#<IO:<STDERR>>>, "rack.multithread"=>false, "rack.multiprocess"=>false, "rack.run_once"=>false, "REQUEST_METHOD"=>"GET", "REQUEST_PATH"=>"/favicon.ico", "PATH_INFO"=>"/favicon.ico", "REQUEST_URI"=>"/favicon.ico", "HTTP_VERSION"=>"HTTP/1.1", "HTTP_HOST"=>"localhost:9292", "HTTP_CONNECTION"=>"keep-alive", "HTTP_ACCEPT"=>"*/*", "HTTP_USER_AGENT"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.163 Safari/535.19", "HTTP_ACCEPT_ENCODING"=>"gzip,deflate,sdch", "HTTP_ACCEPT_LANGUAGE"=>"en-US,en;q=0.8", "HTTP_ACCEPT_CHARSET"=>"ISO-8859-1,utf-8;q=0.7,*;q=0.3", "GATEWAY_INTERFACE"=>"CGI/1.2", "SERVER_PORT"=>"9292", "QUERY_STRING"=>"", "SERVER_PROTOCOL"=>"HTTP/1.1", "rack.url_scheme"=>"http", "SCRIPT_NAME"=>"", "REMOTE_ADDR"=>"127.0.0.1", "async.callback"=>#<Method: Thin::Connection#post_process>, "async.close"=>#<EventMachine::DefaultDeferrable:0x000001019d4a70>}
=end
