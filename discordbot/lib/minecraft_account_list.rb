require_relative './request_client'

class MinecraftAccountList
  class << self

    # 指定したタイプのデータを取得する
    def get_data(type)
      case type
      when 'ops'
        return get_request('ops')
      when 'whitelist'
        return get_request('whitelist')
      else
        return "Not found: #{type}"
      end
    end

    # APIとやりとりをする
    def get_request(type)
      url     = get_url(type)
      headers = {Authorization: ENV['API_TOKEN']}
      body   =  {}
      request_client = RequestClient.new(url , headers, body)
      res = request_client.get()
      return convert_slack_format(res)
    end

    # APIのURLを取得する
    def get_url(type)
      url = ENV['API_URL'] + ":" + ENV['API_PORT']
      urls = {
        whitelist: url + '/api/v1/whitelist',
        ops: url + '/api/v1/ops'
      }
      return urls[:"#{type}"]
    end

    # JSONデータをSlack上で見やすい表記に変換する
    def convert_slack_format(json_data)
      # TODO: 一旦そのまま返却する
      message = "== #{type} ==\n"
      json_data.each do |data|
        message += "#{data['name']}\n"
      end
      return message
    end
  end
end