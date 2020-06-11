require 'discordrb'
require 'json'

require_relative './config/environment'
require_relative './lib/minecraft_account_list'

puts ENV['DISCORD_BOT_TOKEN']
puts ENV['DISCORD_BOT_CLIENT_ID']

bot = Discordrb::Commands::CommandBot.new(
  token: ENV['DISCORD_BOT_TOKEN'],
  client_id: ENV['DISCORD_BOT_CLIENT_ID'],
  prefix:'!'
)

bot.command :get do |event|
  message = event.message.to_s.split(" ")
  data = MinecraftAccountList.get_data(message[1])
  # event.send_message(data)
  event.send_message(data)
end

bot.run