
# day 8 exercise 2: write an app to reverse a string

=begin
@app = proc do |env|
  response  = Rack::Response.new
  request   = Rack::Request.new(env)
  info      = request.params['info']

  if info and info[:tempfile]
    response['Content-Type'] = info[:type]
    response.body            = info[:tempfile].readlines.sort
  else
    response['Content-Type'] = 'text/plain'
    response.status          = 400
    response.write "info parameter must be a file uplad"
  end

  response.finish
end

# run app
=end

class My_reverse
	def call(env)
		my_response = Rack::Response.new
		my_request = Rack::Request.new(env)
		my_string = my_request.params['reverse']

		# Rack::Response.new.finish do |res|
			# res['Content-Type'] = 'text/plain'
			# res.status = 200
			# str = "Parameters sent: name - #{name} | text - #{text}"
			# res.write str
		# end
		my_response['Content-Type'] = 'text/plain'
		if my_string
			my_response.status = 200
			my_response.body = [my_string.reverse]
		else
			my_response.status = 400
			my_response.body = ["Error: no string provided"]
			# my_response.write my_response.body
		end

		my_response.finish
	end
end

