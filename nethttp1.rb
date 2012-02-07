#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

require 'count'

# nethttp1.rb
require 'net/http'

My_page = @chapter3

url = URI.parse(My_page)
Net::HTTP.start(url.host, url.port) do |http|
	req = Net::HTTP::Get.new(url.path)
	@my_body = http.request(req).body
end

summarize(My_page, count(@my_body, 'the'))

