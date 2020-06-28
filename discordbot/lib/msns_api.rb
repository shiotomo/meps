require_relative './request_client'

class MsnsApi
  class << self
    def get_status
      url = ENV['API_URL'] + ":" + ENV['API_PORT'] + '/api/v1/status'
      headers = {Authorization: ENV['API_TOKEN']}
      body   =  {}
      request_client = RequestClient.new(url , headers, body)
      res = request_client.get()
      return convert_discord_format(res)
    end

    private
    # JSONデータをDiscord上で見やすい表記に変換する
    def convert_discord_format(json_data)
      message = "== Msns System Status ==\n"
      status = ""
      json_data.each do |key, value|
        if key != "status"
          status += "#{key}: #{value}\n"
        else
          status += "\n-- Server Status --\n"
          value.each do |server_name, server_status|
            status += "#{server_name}: #{server_status}\n"
          end
          status += "---------------------\n"
        end
      end
      message += status
      return message
    end
  end
end