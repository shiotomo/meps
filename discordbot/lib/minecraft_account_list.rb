require_relative './request_client'

class MinecraftAccountList
  class << self

    # 指定したタイプのデータを取得する
    def get_data(list_type)
      case list_type
      when 'ops'
        return get_request('ops')
      when 'whitelist'
        return get_request('whitelist')
      else
        return "Not found: #{list_type}"
      end
    end

    # APIとやりとりをする
    def get_request(list_type)
      url     = get_url(list_type)
      headers = {Authorization: ENV['API_TOKEN']}
      body   =  {}
      request_client = RequestClient.new(url , headers, body)
      res = request_client.get()
      return convert_slack_format(list_type, res)
    end

    # APIのURLを取得する
    def get_url(list_type)
      url = ENV['API_URL'] + ":" + ENV['API_PORT']
      urls = {
        whitelist: url + '/api/v1/whitelist',
        ops: url + '/api/v1/ops'
      }
      return urls[:"#{list_type}"]
    end

    # JSONデータをSlack上で見やすい表記に変換する
    def convert_slack_format(list_type, json_data)
      # TODO: 一旦そのまま返却する
      message = "== #{list_type} ==\n"
      json_data.each do |data|
        message += "#{data['name']}\n"
      end
      return message
    end
  end
end