require "spec_helper"
require "api"

describe ReverbAPI::API do
	include Rack::Test::Methods

	def app
		ReverbAPI::API
	end

	it "handles post with strings" do
		post "/records", :record => {:value => "FooBar"}
		# make this persist somehow
	end

	it "get by gender" do
		get "/records/gender"
		last_response.status.should == 200
		last_response.body.should == { by: "gender" }.to_json
	end

	it "get by name" do
		get "/records/name"
		last_response.status.should == 200
		last_response.body.should == { by: "name" }.to_json
	end

	it "get by birthdate" do
		get "/records/birthdate"
		last_response.status.should == 200
		last_response.body.should == { by: "birthdate" }.to_json
	end
end
