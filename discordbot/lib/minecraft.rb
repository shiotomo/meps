require_relative './request_client'

class Minecraft
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
      headers = {}
      body   =  {}
      request_client = RequestClient.new(url , headers, body)
      return request_client.get()
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
      return json_data
    end
  end
end