require_relative './request_client'

class MinecraftServerAnalysis
  class << self
    # サーバに現在ログインしている人を返却する
    def get_access_where_now
      url = ENV['API_URL'] + ":" + ENV['API_PORT'] + '/api/v1/access/now'
      headers = {Authorization: ENV['API_TOKEN']}
      body   =  {}
      request_client = RequestClient.new(url , headers, body)
      res = request_client.get()
      return convert_discord_format(res)
    end

    def get_access_count
      url = ENV['API_URL'] + ":" + ENV['API_PORT'] + '/api/v1/access/count'
      headers = {Authorization: ENV['API_TOKEN']}
      body   =  {}
      request_client = RequestClient.new(url , headers, body)
      res = request_client.get()
      return convert_discord_format(res)
    end

    private
    # JSONデータをSlack上で見やすい表記に変換する
    def convert_discord_format(json_data)
      # TODO: 一旦そのまま返却する
      message = "== connect account list ==\n"
      login_users = ""
      json_data.each do |key, value|
        login_users += "#{key}: #{value}\n"
      end
      login_users += "No users on the server" if login_users == ""
      message += login_users
      return message
    end
  end
end