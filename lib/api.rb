require 'grape'

module ReverbAPI
	class API < Grape::API
	    format :json

	    resource :records do
	    	desc "Add posted string to records."
	    	post do
	    		"post it"
	    	end

	    	get :gender do
	    		{ by: "gender"}
	    	end

	    	get :name do
	    		{ by: "name"}
	    	end

	    	get :birthdate do
	    		{ by: "birthdate" }
	    	end
	    end
	end
end
