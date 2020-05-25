require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'json'

require_relative './config/environment'

require_relative './lib/core/docker_container'
require_relative './lib/core/minecraft'
require_relative './lib/core/access_log'

set :show_exceptions, :after_handler

configure do
  file = File.new("#{settings.root}/logs/msns_#{settings.environment}.log", 'a+')
  file.sync = true
  use Rack::CommonLogger, file
end

before do
  # 指定したIPアドレス以外からのアクセスは禁止にする
  message = {
    status: 'HTTP 401: Unauthorized.'
  }
  halt 403, message.to_json if ENV['ALLOW_HOST'] != '0.0.0.0' && ENV['ALLOW_HOST'] != request.ip
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

  # whitelist.jsonにアカウントを追加する
  post '/whitelist/add' do
    body = request.body.read
    data = JSON.load(body)
    whitelist_path = __dir__ + '/minecraft/whitelist.json'
    message = Minecraft.add_whitelist(whitelist_path, data['name'])
    return message.to_json
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
    status = DockerContainer.get_status(__dir__)
    status = {
      version: ENV['MINECRAFT_VERSION'],
      host: request.host,
      status: status
    }
    return status.to_json
  end

  # access_logを取得する
  get '/access_log' do
    access_log_json = AccessLog.get_access_log(params[:date])
    return access_log_json.to_json
  end
end
