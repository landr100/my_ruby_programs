require './day8.ex1'

puts "\nin config.ru ARGV is #{ARGV.inspect}\n"
run MyApp.new(ARGV)

# command line:
# rackup "Hello World!" *.ru
