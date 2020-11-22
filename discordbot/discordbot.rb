require 'discordrb'
require 'json'

require_relative './config/environment'
require_relative './lib/minecraft_account_list'
require_relative './lib/minecraft_server_analysis'
require_relative './lib/meps_api'

bot = Discordrb::Commands::CommandBot.new(
  token: ENV['DISCORD_BOT_TOKEN'],
  client_id: ENV['DISCORD_BOT_CLIENT_ID'],
  prefix:'!'
)

bot.command :help do |event|
  message = "== Meps Discord Bot ==\n" +
  "command list\n" +
  "!help\n" +
  "    ヘルプを表示します。\n" +
  "!get (ops|whitelist)\n" +
  "    nameに指定したlistを表示します。 例) !get whitelist\n" +
  "!nowlogin\n" +
  "    現在サーバにログインしているユーザを表示します。\n" +
  "!count\n" +
  "    全ユーザの累計アクセス数を表示します。\n" +
  "!status\n" +
  "    mepsの状態を表示します。\n"
  event.send_message(message)
end

bot.command :get do |event|
  message = event.message.to_s.split(" ")
  data = MinecraftAccountList.get_data(message[1])
  event.send_message(data)
end

bot.command :nowlogin do |event|
  message = event.message.to_s.split(" ")
  data = MinecraftServerAnalysis.get_access_where_now
  event.send_message(data)
end

bot.command :count do |event|
  message = event.message.to_s.split(" ")
  data = MinecraftServerAnalysis.get_access_count
  event.send_message(data)
end

bot.command :status do |event|
  message = event.message.to_s.split(" ")
  data = MepsApi.get_status
  event.send_message(data)
end

bot.run
