require 'sinatra/base'
require 'json'

class ApplicationController < Sinatra::Base
  # 認証
  # 指定したTOKEN以外からのアクセスは禁止にする
  # TOKENが指定されていない場合はすべてのアクセスを許可する
  before do
    message = {
      status: 'HTTP 401: Unauthorized.'
    }
    headers = request.env.select { |k, v| k.start_with?('HTTP_') }
    # halt 403, message.to_json
    halt 403, message.to_json() if headers["HTTP_AUTHORIZATION"] != ENV['API_TOKEN'] && ENV['API_TOKEN'] != nil
  end

  # error handling
  error do
    message = {
      status: 'request error.'
    }
    return message.to_json
  end

  # not found
  not_found do
    message = {
      status: 'not found.'
    }
    return message.to_json
  end
end
