require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'dotenv'
require 'json'
require_relative './lib/docker_container'
require_relative './lib/minecraft'

Dotenv.load
set :show_exceptions, :after_handler

# 指定したIPアドレス以外からのアクセスは禁止にする
before do
  message = {
    status: 'HTTP 403: Access Denied.'
  }
  halt 403, message.to_json if  ENV['ALLOW_HOST'] != '0.0.0.0' && ENV['ALLOW_HOST'] != request.ip
end

# error handling
error do
  message = {
    status: 'request error.'
  }
  return message.to_json
end

# not found
not_found do
  message = {
    status: 'not found.'
  }
  return message.to_json
end

namespace '/api/v1' do
  # whitelist.jsonを返却する
  get '/whitelist' do
    File.open("./minecraft/whitelist.json") do |f|
      @whitelist_json = JSON.load(f)
    end
    return @whitelist_json.to_json
  end

  # ops.jsonを返却する
  get '/ops' do
    File.open("./minecraft/ops.json") do |f|
      @ops_json = JSON.load(f)
    end
    return @ops_json.to_json
  end

  # サーバの稼働状況を返却する
  get '/status' do
    container_status = DockerContainer.get_status(__dir__)
    status = {
      minecraft_version: ENV['MINECRAFT_VERSION'],
      host: request.host,
      container_status: container_status
    }
    return status.to_json
  end

  get '/test' do
    Minecraft.world_backup(ENV['MINECRAFT_VERSION'], './minecraft', './backup')
  end
end
