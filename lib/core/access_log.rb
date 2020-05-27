require_relative '../common/mysql_client'
require_relative '../common/time_converter'

class AccessLog
  ERROR_MESSAGE = {status: "Invalid date format."}

  class << self
    # access_logを取得する
    def get_log(date)
      query = date == nil ? "SELECT id, caused_at, level, log, created_at FROM access_log"
                          : "SELECT id, caused_at, level, log, created_at FROM access_log where created_at >= '#{date}'"
      return get_log_query()
    end
  end
end