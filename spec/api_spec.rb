require "spec_helper"
require "api"
require "db_helper"


describe ReverbAPI::API do
	include Rack::Test::Methods

	def app
		ReverbAPI::API
	end

	it "handles post with strings" do
		clear_db
		post "/records", {record: "Sutton David male cerulean 01/18/1990"}
		last_response.status.should == 201
		last_response.body.should == '"saved"'
		reader = Reader.new([])
		reader.read_db[0].to_s.should == "Sutton David male 01/18/1990 cerulean"
	end

	w = Writer.new([])

	it "get by gender" do
		clear_db
		w.save(Person.new("z", "a", "male", "blue", "01/18/1990"))
		w.save(Person.new("x", "a", "female", "blue", "01/18/1990"))
		w.save(Person.new("a", "a", "female", "blue", "01/18/1990"))
		w.save(Person.new("y", "a", "male", "blue", "01/18/1990"))
		get "/records/gender"
		last_response.status.should == 200
		last_response.body.should == '[{"last_name":"a","first_name":"a","gender":"female","date_of_birth":"01/18/1990","favorite_color":"blue"},' +
									  '{"last_name":"x","first_name":"a","gender":"female","date_of_birth":"01/18/1990","favorite_color":"blue"},' +
									  '{"last_name":"y","first_name":"a","gender":"male","date_of_birth":"01/18/1990","favorite_color":"blue"},' +
									  '{"last_name":"z","first_name":"a","gender":"male","date_of_birth":"01/18/1990","favorite_color":"blue"}]'
		clear_db
	end

	it "get by name" do
		clear_db
		w.save(Person.new("z", "a", "male", "blue", "01/18/1990"))
		w.save(Person.new("x", "a", "female", "blue", "01/18/1990"))
		w.save(Person.new("a", "a", "female", "blue", "01/18/1990"))
		w.save(Person.new("y", "a", "male", "blue", "01/18/1990"))

		get "/records/name"
		last_response.status.should == 200
		last_response.body.should == '[{"last_name":"z","first_name":"a","gender":"male","date_of_birth":"01/18/1990","favorite_color":"blue"},' +
									  '{"last_name":"y","first_name":"a","gender":"male","date_of_birth":"01/18/1990","favorite_color":"blue"},' +
									  '{"last_name":"x","first_name":"a","gender":"female","date_of_birth":"01/18/1990","favorite_color":"blue"},' +
									  '{"last_name":"a","first_name":"a","gender":"female","date_of_birth":"01/18/1990","favorite_color":"blue"}]'
		clear_db
	end

	it "get by birthdate" do
		clear_db
		w.save(Person.new("z", "a", "male", "blue", "01/18/1920"))
		w.save(Person.new("x", "a", "female", "blue", "01/18/1989"))
		w.save(Person.new("a", "a", "female", "blue", "01/18/1999"))
		w.save(Person.new("y", "a", "male", "blue", "01/18/1991"))
		get "/records/birthdate"
		last_response.status.should == 200
		last_response.body.should == '[{"last_name":"z","first_name":"a","gender":"male","date_of_birth":"01/18/1920","favorite_color":"blue"},' +
									  '{"last_name":"x","first_name":"a","gender":"female","date_of_birth":"01/18/1989","favorite_color":"blue"},' +
									  '{"last_name":"y","first_name":"a","gender":"male","date_of_birth":"01/18/1991","favorite_color":"blue"},' +
									  '{"last_name":"a","first_name":"a","gender":"female","date_of_birth":"01/18/1999","favorite_color":"blue"}]'
		clear_db
	end
end
