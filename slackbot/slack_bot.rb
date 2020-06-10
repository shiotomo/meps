require 'slack-ruby-client'

require_relative './lib/minecraft'

Slack.configure do |conf|
  conf.token = ENV['SLACK_BOT_TOKEN']
end

client = Slack::RealTime::Client.new

# ユーザからメッセージを検知した時の処理
clinet.on :message do |data|
  text = data['text'].split(' ')
  # データ取得系
  if text[0] == 'get'
    Minecraft.get_data(text[1])
  end
end