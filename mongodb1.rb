#!/usr/bin/env ruby

STDOUT.sync = true # or could write to stderr

$: << ENV['PWD'] # add pwd to the rubylib

@my_script_name = File.basename($0)

# Our sample program mongodb1.rb:
# copied from day 13, section 'Updating a Document'

require 'mongo'

conn = Mongo::Connection.new
db = conn.db("rubylearning")
db.collection_names.each { |name| puts name }

coll = db.collection("students")
if @update
	doc = {:name => 'Manish', :dob => Time.now, :loves => ['english','marathi'], :weight => 62, :gender => 'm', :country => 'india'}
	coll_id = coll.insert(doc)
	coll.update( { :_id => coll_id }, '$set' => { :weight => 60 } )
end

# puts coll.find()
coll.find().each do |i|
	p i
end

