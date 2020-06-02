require_relative '../common/mysql_client'
require_relative '../common/time_converter'

class MinecraftLog < LogBase
  class << self
    # minecraft_logを取得する
    def get_log(date)
      query = date == nil ? "SELECT id, caused_at, level, log, created_at FROM minecraft_log"
                          : "SELECT id, caused_at, level, log, created_at FROM minecraft_log where created_at >= '#{date}'"
      return get_log_query(query)
    end
  end
end