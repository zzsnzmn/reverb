require 'grape'
require_relative "../reader"
require_relative "../writer"

module ReverbAPI
  class API < Grape::API
    format :json
    reader = Reader.new('api.db')
    writer = Writer.new('api.db')


    resource :records do
      desc "Add posted string to records."
      params do
        requires :record, type: String, desc: "the record with | , ' '"
      end

      post do
        person = reader.validate(params[:record])
        writer.save(person)
        "saved"
      end

      get :gender do
        people = reader.read_db
        writer = Writer.new
        writer.sort_by_gender(people).map { |person| person.to_hash }
      end

      get :name do
        people = reader.read_db
        writer.sort_by_last_name(people).map { |person| person.to_hash }
      end

      get :birthdate do
        people = reader.read_db
        writer.sort_by_age(people).map { |person| person.to_hash }
      end
    end
  end
end
