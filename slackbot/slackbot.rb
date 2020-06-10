require 'slack-ruby-client'

require_relative './config/environment'
require_relative './lib/minecraft'

Slack.configure do |conf|
  conf.token = ENV['SLACK_BOT_TOKEN']
end

client = Slack::RealTime::Client.new

# slackに接続できたときの処理
client.on :hello do
  puts 'connected!'
end


# ユーザからメッセージを検知した時の処理
client.on :message do |data|
  text = data['text'].split(' ')
  # データ取得系
  case text[0]
  when 'hello'
    client.message channel: data['channel'], text: 'Hello. I\'m msns slack bot.'
  when 'get'
    data = Minecraft.get_data(text[1])
    client.message channel: data['channel'], text: data
  else
  end
end

client.start!