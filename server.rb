require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'dotenv'
require 'json'

Dotenv.load

error do
  status = {
    status: 'request error.'
  }
  return status.to_json
end

not_found do
  status = {
    status: 'not found.'
  }
  return status.to_json
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