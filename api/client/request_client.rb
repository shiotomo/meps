require 'rest-client'
require 'json'

class RequestClient
  def initialize(url, headers, body)
    @url = url
    @headers = headers
    @body = body
  end

  # GETリクエストを送信する
  def get
    response = RestClient.get(@url, @headers)
    return JSON.load(response)
  end

  # POSTリクエストを送信する
  def post
    response = RestClient.post(@url, @headers, @body)
    return JSON.load(response)
  end
end