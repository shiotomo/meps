require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'dotenv'
require 'json'

Dotenv.load
set :show_exceptions, :after_handler

before do
  message = {
    status: 'request error.'
  }
  halt 401, message.to_json if request.ip !=  ENV['ALLOW_HOST'] && ENV['ALLOW_HOST'] != '0.0.0.0'
end

error do
  message = {
    status: 'request error.'
  }
  return message.to_json
end

not_found do
  message = {
    status: 'not found.'
  }
  return message.to_json
end

namespace '/api/v1' do
  get '/whitelist' do
    File.open("./minecraft/whitelist.json") do |f|
      @whitelist_json = JSON.load(f)
    end
    return @whitelist_json.to_json
  end

  get '/ops' do
    File.open("./minecraft/ops.json") do |f|
      @ops_json = JSON.load(f)
    end
    return @ops_json.to_json
  end
end