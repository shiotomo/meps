require_relative './application_controller.rb'
require_relative '../service/access_log_service.rb'

class AccessController < ApplicationController
  @access_log_service = AccessLogService.new()

  # access_logを取得する
  get '/access_log' do
    return @access_log_service.get_log(params[:date])
  end

  # 現在サーバにいる利用者を返却する
  get '/now' do
    return @access_log_service.get_access_count_where_now()
  end

  # アクセスの累計数を返却する
  get '/count' do
    return @access_log_service.get_access_count()
  end
end
