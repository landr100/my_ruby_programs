# my_reverse.rb
# exercise 'A simple text reversing service' from day 10
require 'sinatra'
get '/' do
	erb :reverse_home
end

post '/display' do
	erb :reverse_show
end

