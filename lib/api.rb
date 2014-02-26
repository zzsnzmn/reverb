require 'grape'
require_relative "../reader"
require_relative "../writer"

module ReverbAPI
	class API < Grape::API
	    format :json

	    resource :records do
	    	desc "Add posted string to records."
	    	params do
	    		requires :record, type: String, desc: "the record with | , ' '"
	    	end
	    	post do
	            reader = Reader.new([])
	            writer = Writer.new([])
	            person = reader.validate(params[:record])
	            writer.save(person)
	            "saved"
	    	end

	    	get :gender do
	    		people = Reader.new([]).read_db
	    		writer = Writer.new(people)
	    		writer.sort_by_gender.map {|person| person.to_hash}
	    	end

	    	get :name do
	    		people = Reader.new([]).read_db
	    		writer = Writer.new(people)
	    		writer.sort_by_last_name.map {|person| person.to_hash}
	    	end

	    	get :birthdate do
	    		people = Reader.new([]).read_db
	    		writer = Writer.new(people)
	    		writer.sort_by_age.map {|person| person.to_hash}
	    	end
	    end
	end
end
