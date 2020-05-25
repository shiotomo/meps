require_relative './common/mysql_client'
require_relative './common/time_converter'

class AccessLog
  ERROR_MESSAGE = {status: "Invalid date format."}

  class << self
    # access_logを取得する
    def get_access_log(date)
      return date == nil ? get_access_log_all() : get_access_log_where_date(date)
    end

    # 全access_logを取得する
    def get_access_log_all
      client = MysqlClient.new
      query = "SELECT id, caused_at, level, log, created_at FROM access_log"
      result = client.run_query(query)
      result_list = []
      result.each do |entry|
        result_list.push(entry)
      end
      return result_list
    end

    # 指定した日付のaccess_logを取得する
    def get_access_log_where_date(date)
      return ERROR_MESSAGE unless TimeConverter.is_mysql_time_stamp(date)
      client = MysqlClient.new
      query = "SELECT id, caused_at, level, log, created_at FROM access_log where created_at >= '#{date}'"
      result = client.run_query(query)
      result_list = []
      result.each do |entry|
        result_list.push(entry)
      end
      return result_list
    end
  end
end