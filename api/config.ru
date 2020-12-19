require 'sinatra'
require_relative './app.rb'
run Rack::URLMap.new(Main::ROUTES)
