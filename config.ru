require 'grape'
require_relative "lib/api"

#\ -w -p 8080
# use Rack::Reloader, 0
# use Rack::ContentLength

run Rack::Cascade.new [ReverbAPI::API]
