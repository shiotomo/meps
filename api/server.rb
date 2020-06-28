require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'json'

require_relative './config/environment'

require_relative './lib/core/docker_container'
require_relative './lib/core/minecraft'
require_relative './lib/core/access_log'
require_relative './lib/core/minecraft_log'
require_relative './lib/core/access_log_analysis'

set :show_exceptions, :after_handler

configure do
  file = File.new("./logs/msns_#{settings.environment}.log", 'a+')
  puts file
  file.sync = true
  use Rack::CommonLogger, file
end

# 認証
# 指定したTOKEN以外からのアクセスは禁止にする
# TOKENが指定されていない場合はすべてのアクセスを許可する
before do
  message = {
    status: 'HTTP 401: Unauthorized.'
  }
  headers = request.env.select { |k, v| k.start_with?('HTTP_') }
  # halt 403, message.to_json
  halt 403, message.to_json if headers["HTTP_AUTHORIZATION"] != ENV['API_TOKEN'] && ENV['API_TOKEN'] != nil
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
  # MEMO: 現在非推奨APIとしているのでコメントアウト
  # post '/whitelist/add' do
  #   body = request.body.read
  #   data = JSON.load(body)
  #   whitelist_path = __dir__ + '/minecraft/whitelist.json'
  #   message = Minecraft.add_whitelist(whitelist_path, data['name'])
  #   return message.to_json
  # end

  # ops.jsonを返却する
  get '/ops' do
    File.open("./minecraft/ops.json") do |f|
      @ops_json = JSON.load(f)
    end
    return @ops_json.to_json
  end

  # サーバの稼働状況を返却する
  get '/status' do
    server_status = DockerContainer.get_status(__dir__)
    status = {
      minecraft_version: ENV['MINECRAFT_VERSION'],
      host: request.host,
      status: server_status
    }
    return status.to_json
  end

  # access_logを取得する
  get '/access_log' do
    access_log = AccessLog.get_log(params[:date])
    return access_log.to_json
  end

  # minecraft_log(ゲームサーバログ)を取得する
  get '/minecraft_log' do
    minecraft_log = MinecraftLog.get_log(params[:date])
    return minecraft_log.to_json
  end

  # 現在サーバにいる利用者を返却する
  get '/access/now' do
    now_access = AccessLogAnalysis.get_access_count_where_now
    return now_access.to_json
  end

  # アクセスの累計数を返却する
  get '/access/count' do
    access_count = AccessLogAnalysis.get_access_count
    return access_count.to_json
  end
end
