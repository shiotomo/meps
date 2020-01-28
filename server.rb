require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'dotenv'
require 'json'

Dotenv.load
set :show_exceptions, :after_handler

before do
  message = {
    status: 'HTTP 403: Access Denied.'
  }
  halt 403, message.to_json if  ENV['ALLOW_HOST'] != '0.0.0.0' && ENV['ALLOW_HOST'] != request.ip
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

  get '/status' do
    status = {
      minecraft_version: ENV['MINECRAFT_VERSION'],
      host: request.host
    }
    return status.to_json
  end
end
