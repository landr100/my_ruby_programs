#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

require 'count'

# nethttp2.rb
require 'net/http'

# My_page = @chapter3
My_page = @text_txt

url = URI.parse(My_page)
Net::HTTP.start(url.host, url.port) do |http|
	req = Net::HTTP::Get.new(url.path)
	puts http.request(req).body
end

